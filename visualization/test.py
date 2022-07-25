#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Aug 21 13:01:09 2021

@author: Bilel Kanoun
"""
import tensorflow as tf
import keras 

from keras.models import load_model
from keras import backend as K

import os

import Utils
import numpy as np

from skimage.transform import rotate, rescale, resize

from rasterio.plot import reshape_as_raster, reshape_as_image

import rasterio as rio

from tqdm import tqdm
from skimage.io import imread


import argparse


def _calculate_weighted_binary_crossentropy(target, output, from_logits=False):
    if not from_logits:
        # transform back to logits
        _epsilon = K.epsilon()
        output = tf.clip_by_value(output, _epsilon, 1 - _epsilon)
        output = tf.math.log(output / (1 - output))
        
    return tf.nn.weighted_cross_entropy_with_logits(labels=target, logits=output, pos_weight=95.98)

def weighted_binary_crossentropy(y_true, y_pred):
    return K.mean(_calculate_weighted_binary_crossentropy(y_true, y_pred), axis=-1)

def IoU_coef(y_true, y_pred, smooth=1.0):
    
    #flatten label and prediction tensors
    y_true_f = K.flatten(y_true)
    y_pred_f = K.flatten(y_pred)
    
    intersection = K.sum(y_true_f*y_pred_f)
    total = K.sum(y_true_f) + K.sum(y_pred_f)
    union = total - intersection
    
    IoU = (intersection + smooth) / (union + smooth)
    return IoU

def IoULoss(y_true, y_pred):
    return -IoU_coef(y_true, y_pred)

def combined_loss(y_true, y_pred):
    return IoULoss(y_true, y_pred) + weighted_binary_crossentropy(y_true, y_pred)


def run_rotation_scale(rgb_rio_dst, tile_size, angle, scale, output_folder):
    
    mid_tile_size = int(tile_size/2)
    
    # create a new .txt file 
    f = open(os.path.join(output_folder,'./info_rot_{}_scale_{}.txt'.format(angle,scale)), "w+")

    img_scale = rescale(rgb_rio_dst, scale, multichannel=True, anti_aliasing=False, 
                        preserve_range=True, mode='constant')
    
    img_rot_scale = rotate(img_scale, angle, resize=True, preserve_range=True)
    
    
    if (img_rot_scale.shape[0]%mid_tile_size==0 and img_rot_scale.shape[1]%mid_tile_size==0):
        pad_rows = pad_cols = 0
        #SaveRGBRaster(output_folder,img_rot_scale, geotransform, proj, band)
        img_rot_scale_pad = np.zeros((img_rot_scale.shape[0], img_rot_scale.shape[1], img_rot_scale.shape[2]))
        img_rot_scale_pad = img_rot_scale
    else:
        pad_rows = mid_tile_size*(int(img_rot_scale.shape[0]/mid_tile_size)+1) - img_rot_scale.shape[0]
        pad_cols = mid_tile_size*(int(img_rot_scale.shape[1]/mid_tile_size)+1) - img_rot_scale.shape[1]
        
        # Add some padding
        img_rot_scale_pad = np.zeros((img_rot_scale.shape[0]+pad_rows, img_rot_scale.shape[1]+pad_cols, img_rot_scale.shape[2]))
        img_rot_scale_pad[pad_rows//2:-pad_rows//2, pad_cols//2:-pad_cols//2,:] =  img_rot_scale
        
        #SaveRGBRaster(output_folder,img_rot_scale_pad, geotransform, proj, band)    
    f.write("Degree of rotation: {}".format(angle))
    f.write("\nScale: {}".format(scale))
    f.write("\nSize of the Image: {}".format(img_rot_scale_pad.shape))
    f.write("\n{} {}".format(pad_rows,pad_cols))
    f.close()
    
    return img_rot_scale_pad

def get_list_rgb_tiles(input_folder, tile_height, tile_width, tile_channels):
    """
    Inputs:
        input_folder: the folder that contains the RGB tiles
        tile height
        tile width
        tile channels
    Output:
        array of RGB tiles
    """    
    rgb_path, dirs, rgb_ids = next(os.walk(input_folder+'/'))

    # Sort the RGB tile ids
    rgb_ids.sort(key=lambda x: int(''.join(filter(str.isdigit, x))))

    # create np array of RGB tiles
    rgb_array = np.zeros((len(rgb_ids), tile_height, tile_width, tile_channels), dtype=np.float32) 
    
    print('Reading the RGB tiles:\n')
    for n, id_ in tqdm(enumerate(rgb_ids), total=len(rgb_ids)):
        img = imread(rgb_path + id_)[:,:,:tile_channels]

        rgb_array[n] = img 
       
    print('Done!')
    
    return rgb_array

def predict_site(current_folder, mean_list, batch_size, img_rgb_rio_dst, img_rot_scale_mat, 
                 array_list_rgb_tiles, checkpoint_path, angle, scale):
    """
    Inputs:
        current_folder: the folder that contains the rotated RGB image and RGB tiles folder
        img_rgb_rio_dst: rasterio dataset of the original RGB image
        img_rot_scale_mat: matrix dataset of the rotated and scale changed image
        array_list_rgb_tiles: array that contains all the RGB tiles
        checkpoint_path: path of the checkpoint
        angle: the selected rotation angle
        scale: the selected scale
    Output:
        predicted site array
    """
    # Load The U-Net Model        
    model = load_model(checkpoint_path, custom_objects={'mean_list': mean_list,
                                                        'weighted_binary_crossentropy': weighted_binary_crossentropy,
							                            'combined_loss': combined_loss})
    # Predict the outputs
    preds = model.predict(array_list_rgb_tiles, verbose=1, batch_size=batch_size)
    preds = preds.astype(np.float32)
    
    # Reconstruct the site
    with open(os.path.join(current_folder,'info_rot_{}_scale_{}.txt'.format(angle, scale)), 'r') as f:
        lines = f.read().splitlines()
        pad_rows, pad_cols = list((lines[-1].split(" ")))
        
    if (angle%90 == 0):
        if(int(pad_rows)==0 and int(pad_cols)==0):
            img_reconst_rot_scale = Utils.reconstruct_site(img_rot_scale_mat, preds)    
            img_reconst = Utils.rotate_image(img_reconst_rot_scale,360-float(angle))
            
        else: 
            img_reconst_rot_scale = Utils.reconstruct_site(img_rot_scale_mat, preds)
            img_reconst_rot_scale = img_reconst_rot_scale[int(pad_rows)//2:-int(pad_rows)//2,int(pad_cols)//2:-int(pad_cols)//2]
            
            img_reconst_rotate = Utils.rotate_image(img_reconst_rot_scale,360-float(angle))
            img_reconst = resize(img_reconst_rotate, [img_rgb_rio_dst.shape[0], img_rgb_rio_dst.shape[1]])
	
    else:
        img_reconst_rot_scale = Utils.reconstruct_site(img_rot_scale_mat, preds)
        img_reconst_rot_scale = img_reconst_rot_scale[int(pad_rows)//2:-int(pad_rows)//2,int(pad_cols)//2:-int(pad_cols)//2]
        
        img_reconst_rescale = rescale(img_reconst_rot_scale, 1/float(scale), multichannel=True, anti_aliasing=False, 
                                      preserve_range=True, mode='constant')
    
        img_reconst_rotate = Utils.rotate_image(img_reconst_rescale,360-float(angle))
    
        diff_shape_rows = int((img_reconst_rotate.shape[0]-img_rgb_rio_dst.shape[0])/2)
        diff_shape_cols = int((img_reconst_rotate.shape[1]-img_rgb_rio_dst.shape[1])/2)
        
        img_reconst = img_reconst_rotate[diff_shape_rows+1:img_reconst_rotate.shape[0]-diff_shape_rows,diff_shape_cols+1:img_reconst_rotate.shape[1]-diff_shape_cols]

    return img_reconst

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--rgb_path", help='The path related to the RGB image')
    parser.add_argument("--angle_list", default=[0], type=int, nargs='+', help="Select the list of the angles (in degrees) to perform for site rotation (default: 0°)")
    parser.add_argument("--scale_list", default=[1], type=float, nargs='+', help="Select the list of the scales to perform for site scale chane (default: 1)")
    parser.add_argument("--mean_list", default=[123.68, 116.779, 103.939, 161.54], type=float, nargs='+', help="Select the mean list (Mean RGBT bands) for IamgeNet dataset (default: [123.68, 116.779, 103.939, 161.54])")
    parser.add_argument("--batch_size", default=6, type=int, help="Select the batch size for the prediction (default: 6)")
    parser.add_argument("--tile_size", default=256, type=int, help="Select the size (heightxwidth) for the tiles used in the decompostion (default: 256)")
    parser.add_argument("--checkpoints_folder_path", help='The path related to the checkpoints folder')
    parser.add_argument("--output_folder", default="temp", help='The path related to the folder name in which the user store the predictions')
    parser.add_argument("--pred_name", default="test", help='Set the name of the output prediction')
    
    args = parser.parse_args()
    
    # Display the angle and scale lists parameters
    print("angles: {}".format(args.angle_list))
    print("Scales: {}".format(args.scale_list))
     
    checkpoint_list = sorted(os.listdir(args.checkpoints_folder_path))
    count = 0
    
    for checkpoint in checkpoint_list:
        count+=1
        print("Epoch: {}/{}".format(count,len(checkpoint_list)))
        file_save_folder = os.path.join(args.output_folder, checkpoint[:-5])
    
        
        if not os.path.isdir(file_save_folder):
            os.makedirs(file_save_folder)
           
        with rio.open(args.rgb_path) as input_dst:
            input_profile = input_dst.profile
            input_mat = reshape_as_image(input_dst.read())
            
            for angle in args.angle_list:
                for scale in args.scale_list:
                    print('Rotation with angle {} deg, scale {}:'.format(angle, scale))
                    
                    file_save_folder_dir = os.path.join(file_save_folder, 'rot_{}_scale_{}'.format(angle, scale))
                    
                    if not os.path.isdir(file_save_folder_dir):
                        os.makedirs(file_save_folder_dir)
                        
                    out_img_rot_scale = run_rotation_scale(input_mat, args.tile_size, angle, scale, file_save_folder_dir)
                
                    output_name = 'Valid_RGB_rot{}_scale_{}.tif'.format(angle, scale)
                    output_path = os.path.join(args.output_folder,output_name)
                           
                    with rio.open(output_path, 'w+', driver='GTiff',
                                  height=out_img_rot_scale.shape[0],
                                  width=out_img_rot_scale.shape[1], 
                                  count=out_img_rot_scale.shape[2],
                                  dtype=out_img_rot_scale.dtype,
                                  transform=input_dst.transform, 
                                  crs=input_dst.crs) as output_dst:
                        output_dst.write(reshape_as_raster(out_img_rot_scale).astype(output_dst.meta['dtype']))
                
                    folder_to_create = os.path.join(file_save_folder_dir, 'RGB_tiles')
                
                    if not os.path.isdir(folder_to_create):
                        os.makedirs(folder_to_create)    
                    
                    gdalRetileCommand = 'gdal_retile.py -of GTiff -overlap {} -ot Float32 -targetDir {} {}'.format(args.tile_size//2, folder_to_create, output_path)
                    os.system(gdalRetileCommand)
                
                    list_rgb_tiles = get_list_rgb_tiles(folder_to_create, args.tile_size, args.tile_size, input_mat.shape[2]) # bands=3 or 4
                    
                    predicted_img = predict_site(file_save_folder_dir, args.mean_list, args.batch_size, input_mat, out_img_rot_scale, 
                                                 list_rgb_tiles, os.path.join(args.checkpoints_folder_path, checkpoint), angle, scale) 
    
                    epoch_num = [int(s) for s in  checkpoint[:-5].split('_') if s.isdigit()][0]
                    pred_name = args.pred_name + '_rot_{}_scale_{}_Epoch_{}.tif'.format(angle, scale, epoch_num)
                    pred_path = os.path.join(file_save_folder_dir,pred_name)
                    
                    pred_profile = input_profile.copy()
                
                    pred_profile.update(dtype=rio.float32, count=1, nodata= -32768)
                
                    with rio.open(pred_path, mode='w+', **pred_profile) as output_pred_dst:
                        output_pred_dst.write(reshape_as_raster(predicted_img).astype(output_pred_dst.meta['dtype']))
                    
                
                    rgbTilesClearCommand = 'rm -rf {}'.format(folder_to_create)
                    os.system(rgbTilesClearCommand)
            
                    RasterClearCommand = 'rm -rf {}'.format(output_path)
                    os.system(RasterClearCommand)
            
                
