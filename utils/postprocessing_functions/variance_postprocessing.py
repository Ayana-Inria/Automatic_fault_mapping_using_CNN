#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov 24 09:57:35 2021

Post-processing program to stack images and compute the mean average 

@author: Bilel Kanoun
"""
import os, sys
import numpy as np
from skimage.io import imread
import rasterio as rio

from rasterio.plot import reshape_as_image, reshape_as_raster

def load_rasters(dir_path):
    """
    Parameters
    ----------
    Inputs:
        dir_path: a selected directory path to stack the images

    Returns
    -------
        full_rasters_path: a list of all the rasters in the selected directory path

    """
    dir_list = sorted(os.listdir(dir_path))
    dir_paths_list = [os.path.join(dir_path, c_dir_list) for c_dir_list in dir_list]
    
    full_rasters_path = []
    
    for c_dir_paths_list in dir_paths_list:
        c_img = list(filter(lambda x: x.endswith('.tif'), os.listdir(c_dir_paths_list)))[0]
        full_c_img_path = os.path.join(c_dir_paths_list, c_img)
        full_rasters_path.append(full_c_img_path)
    
    return full_rasters_path


def stack_images(rasters_path):
    """   
    Parameters
    ----------
    Inputs:
        rasters_path : list
        A list describing the path of each raster in the selected directory

    Returns
    -------
        stacked_imgs: a 3D Numpy array stacked images
    """
    stacked_imgs = []
   
    for c_raster in rasters_path:
        img = imread(c_raster)
        stacked_imgs.append(img)
        
    return np.array(stacked_imgs, dtype=np.float32).transpose(1,2,0)
    

def print_help():
    help_message = """
    python mean_postprocessing.py rgb_path dir_path output_folder pred_name
    """
    print(help_message)

    
if __name__ == "__main__":
    
    if (len(sys.argv)<5):
        print("Missing arguments !")
        print_help()
        sys.exit(1)
    
    rgb_path = sys.argv[1]
    dir_path = sys.argv[2]
    output_folder = sys.argv[3]
    pred_name = sys.argv[4]
    
    if not os.path.isdir(output_folder):
        os.makedirs(output_folder)
    
    pred_path = os.path.join(output_folder, pred_name)
    
    with rio.open(rgb_path, 'r') as input_dst:
        rgb_img = reshape_as_image(input_dst.read())
        profile = input_dst.profile
        
        pred_profile = profile.copy()
        
        pred_profile.update(dtype=rio.float32, 
                            count=1, 
                            nodata= -32768)
        
        # Apply the post-processing on the stack of images
        rasters_list = load_rasters(dir_path)
        stacked_rasters = stack_images(rasters_list)
        processed_img = np.var(stacked_rasters, axis=-1, dtype=np.float32)
        processed_img = np.expand_dims(processed_img, axis=-1)
        
    with rio.open(pred_path, mode='w', **pred_profile) as out_dst:
        out_dst.write(reshape_as_raster(processed_img).astype(out_dst.meta['dtype']))
        
        
       
    
   
    
   
    
    
