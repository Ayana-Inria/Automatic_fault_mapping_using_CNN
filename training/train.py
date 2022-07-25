#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed SJuly 21 11:36:52 2021

U-Net Model (Tasar et al. 2019)

Build the U-Net model proposed by Tasar et al. in the paper "Incremental Learning for Semantic Segmentation of Large-Scale Remote Sensing Data"

Authors: Onur Tasar, Student member, IEEE, Yuliya Tarabalka, Senior member, IEEE, Pierre Alliez

Journal Reference: IEEE JOURNAL OF SELECTED TOPICS IN APPLIED EARTH OBSERVATIONS AND REMOTE SENSING, 12, 2019, 3524-3537

DOI: 10.1109/JSTARS.2019.2925416
    
@author: Bilel Kanoun
"""

import tensorflow as tf
import keras

from keras import optimizers
from keras.callbacks import ModelCheckpoint, TensorBoard

import os,sys
import numpy as np
import matplotlib.pyplot as plt

from tqdm import tqdm

from skimage.io import imread, imshow
#from skimage.transform import resize 
import scipy.io as sio

from keras import backend as K
import datetime

import argparse

from image_transformation import recurse_transform, images_transformations_list

#%% generate the weighted Binary Cross Entropy loss function    
def _calculate_weighted_binary_crossentropy(target, output, from_logits=False):
    if not from_logits:
        # transform back to logits
        _epsilon = K.epsilon()
        output = tf.clip_by_value(output, _epsilon, 1 - _epsilon)
        output = tf.math.log(output / (1 - output))
        
    return tf.nn.weighted_cross_entropy_with_logits(labels=target, logits=output, pos_weight=95.83) # 97.67 for A+B basic mapping # 95.83 for Site A+B+C refined mapping


def weighted_binary_crossentropy(y_true, y_pred):
    return K.mean(_calculate_weighted_binary_crossentropy(y_true, y_pred), axis=-1)

#%% generate the Jaccard loss function  
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

#%% Combine both wBCE and Jaccard losses
def combined_loss(y_true, y_pred):
    return IoULoss(y_true, y_pred) + weighted_binary_crossentropy(y_true, y_pred)

#%% Dictionary of available optimizers
optimizer_dicc = {'sgd': optimizers.SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True),
                  'rmsprop': optimizers.RMSprop(lr=0.001, rho=0.9, epsilon=1e-08, decay=0.0),
                  'adagrad': optimizers.Adagrad(lr=0.01, epsilon=1e-08, decay=0.0),
                  'adadelta': optimizers.Adadelta(lr=1.0, rho=0.95, epsilon=1e-08, decay=0.0),
                  'adam': optimizers.Adam(lr=0.0001)}


if __name__ =="__main__":
    
    #%% Declare the parser arguments
    parser = argparse.ArgumentParser()
    
    parser.add_argument("--data_root", help="Select the root of the folder that contains the (train, valid) subfolders")
    parser.add_argument("--tile_size", default=256, type=int, help="Select the size (heightxwidth) for the tiles used in the decompostion (default: 256)")
    parser.add_argument("--tile_channels", default=4, type=int, help="Select the number of channels for the tiles used in the decompostion (default: 4 channels RGB+Topography)")
    parser.add_argument("--mean_list", default=[123.68, 116.779, 103.939, 161.54], type=float, nargs='+', help="Select the mean list (Mean RGBT bands) for IamgeNet dataset (default: [123.68, 116.779, 103.939, 161.54])")
    parser.add_argument("--num_classes", default=1, type=int, help="Select the number of classes for the segmentation (default: num_classes=1 for binary segmentation task)")
    parser.add_argument("--batch_size", default=12, type=int, help="selected batch size (default: 12)")
    parser.add_argument("--epochs", default=60, type=int, help="Number of Epochs to train (default: 12)")
    parser.add_argument("--optimizer", default='adam', help="Select the optimizer among this elements:{sgd, rmsprop, adagrad, adadelta, adam} (default: adam)")
    parser.add_argument("--models_path", help="Select the path where to store the checkpoints and the Tensorboard")
    parser.add_argument("--checkpoint_name", default='test', help="Select the name of the checkpoint") 
    
    args = parser.parse_args()
      
    #%% initialize the paths
    # Read the Data (Sites A, B and C refined mapping)
    
    TRAIN_PATH = os.path.join(args.data_root, 'train') 
    
    path, dirs, train_ids = next(os.walk(TRAIN_PATH + '/image/'))
    
    VALID_PATH = os.path.join(args.data_root, 'valid')
    
    valid_path, dirs, valid_ids = next(os.walk(VALID_PATH + '/image/'))
    
    MODELS_PATH = os.path.join(args.models_path, str(datetime.datetime.now()))
    
    if not os.path.isdir(MODELS_PATH):
        os.makedirs(MODELS_PATH)
    
    CHECKPOINT_PATH = MODELS_PATH + '/checkpoints_Epochs{}_BK_MRef'.format(args.epochs)
    checkpoint_name = args.checkpoint_name + '_epoch_{epoch:02d}.hdf5'
    
    filepath = os.path.join(CHECKPOINT_PATH, checkpoint_name) 
    tensorboard_path = os.path.join(MODELS_PATH, 'tensorboard')
    
                     
    #%% Build the model
    
    seed = 42
    np.random.seed = seed
    
    from U_Net_Tasar import Unet
    
    model = Unet(args.tile_size, args.tile_size, args.tile_channels, args.mean_list, nclasses=args.num_classes)
    
    model.compile(optimizer=optimizer_dicc[(args.optimizer).lower()], loss=combined_loss) #weighted_binary_crossentropy (try also wBCE as a loss alone, it provides some intersting results)
    
    model.summary()
    
    #%% Read the data (+ perform data augmentation)
    
    AUG_X_TRAIN = []
    AUG_Y_TRAIN =[]
    
    print('Reading the training RGB Images and masks:\n')
    for n, id_ in tqdm(enumerate(train_ids), total=len(train_ids)):
        c_img = imread(path + id_)[:,:,:args.tile_channels]    
        if (c_img[:,:,:3].max()<2):
            continue
        
        c_mask = imread(TRAIN_PATH + '/gt/' + id_)#[:,:,1]
        
        #mask = np.expand_dims(mask, axis=-1)
        RT = recurse_transform((c_img, c_mask))
        RT.run_recurse(RT.image_couple, images_transformations_list, [])
        c_all_trans = RT.all_transformed
        for c_augmented_couple in c_all_trans :
            AUG_X_TRAIN.append(c_augmented_couple[0].astype(np.float32))
            AUG_Y_TRAIN.append( np.expand_dims(c_augmented_couple[1], axis=-1).astype(np.float32) )
    
    AUG_X_TRAIN = np.array(AUG_X_TRAIN).astype(np.float32)
    AUG_Y_TRAIN = np.array(AUG_Y_TRAIN).astype(np.float32)
        
    
    print("Done!")
        
    # Valid images
    X_valid = np.zeros((len(valid_ids), args.tile_size, args.tile_size, args.tile_channels), dtype=np.uint8) 
    Y_valid = np.zeros((len(valid_ids), args.tile_size, args.tile_size, args.num_classes), dtype=np.uint8)
    
    
    print('Reading the valid RGB Images:\n')
    for n, id_ in tqdm(enumerate(valid_ids), total=len(valid_ids)):
        img = imread(valid_path + id_)[:,:,:args.tile_channels]
        
        #img = resize(img, (IMG_HEIGTH, IMG_WIDTH), mode='constant', preserve_range=True)  
        X_valid[n] = img.astype(np.float32)
        
        mask_valid = imread(VALID_PATH + '/gt/' + id_)#[:,:,1]
        
        mask_valid = np.expand_dims(mask_valid, axis=-1)
        
        Y_valid[n] = mask_valid.astype(np.float32)
       
    print('Done!')

    if not (os.path.isdir(os.path.dirname(filepath))):
        os.makedirs(os.path.dirname(filepath))
    
    callbacks = [ModelCheckpoint(filepath, monitor='val_loss', verbose=0, save_best_only=False, save_weights_only=False, mode='auto', period=1), 
                 TensorBoard(log_dir=tensorboard_path)]

    history = model.fit(AUG_X_TRAIN,AUG_Y_TRAIN, batch_size=args.batch_size, epochs=args.epochs, validation_data=(X_valid, Y_valid), callbacks=callbacks, verbose=1) #,  validation_split=0.1, steps_per_epoch=1000 
    
    #%% Save train/valid losses in .mat file
    sio.savemat(MODELS_PATH+'/train_val_loss_BK_MRef_refined.mat', {"val_loss":history.history['val_loss'],
                                                                    "train_loss": history.history['loss']})
    
