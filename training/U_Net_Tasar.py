#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr  3 20:13:42 2021

U-Net Tasar

@author: bkanoun
"""

from keras.layers import Conv2D, Activation, BatchNormalization, MaxPooling2D, Conv2DTranspose, concatenate, Input, Lambda, Dropout 
from keras.models import Model


def conv_block(tensor, nfilters, size=3, padding='same'): #drop_rate=0.1): 
    x = Conv2D(filters=nfilters, kernel_size=(size, size), padding=padding, activation='relu')(tensor)  
    #x = BatchNormalization()(x)    
    #x = Activation("relu")(x)
    #x = Dropout(rate = drop_rate)(x)
    return x

def conv_block_sequence(tensor, num_blocks, nfilters): #drop_rate): 
    kernel_size = 3    
    outputs = tensor

    for conv_block_no in range(1,num_blocks+1):
        outputs = conv_block(outputs, nfilters, kernel_size)#, drop_rate=drop_rate)
    
    return outputs


def deconv_concat(tensor, residual, nfilters, size=2, padding='same', strides=(2, 2)):#, drop_value=0.1):
    y_deconv = Conv2DTranspose(filters=nfilters, kernel_size=(size, size), strides=strides, padding=padding)(tensor)
    y_deconv = Activation('relu')(y_deconv)
    y_concat = concatenate([y_deconv, residual])
    return y_concat


def Unet(img_height, img_width, img_channels, mean_list, nclasses=1, filters=64):
# down
    input_layer = Input(shape=(img_height, img_width, img_channels), name='image_input')

    s = Lambda(lambda x: x-mean_list)(input_layer) # Normalize the patches (substruction to Mean List)

    conv1 = conv_block_sequence(s, num_blocks=2, nfilters=filters)
    conv1_out = MaxPooling2D(pool_size=(2, 2))(conv1)

    conv2 = conv_block_sequence(conv1_out, num_blocks=2, nfilters=filters*2)
    conv2_out = MaxPooling2D(pool_size=(2, 2))(conv2)
    
    conv3 = conv_block_sequence(conv2_out, num_blocks=3, nfilters=filters*4)
    conv3_out = MaxPooling2D(pool_size=(2, 2))(conv3)
    
    conv4 = conv_block_sequence(conv3_out, num_blocks=3, nfilters=filters*8)#,drop_value=0.2)
    conv4_out = MaxPooling2D(pool_size=(2, 2))(conv4)
    
    conv5 = conv_block_sequence(conv4_out, num_blocks=3, nfilters=filters*8)#, drop_value=0.2)
    conv5_out = MaxPooling2D(pool_size=(2, 2))(conv5)
    
    conv_center = conv_block(conv5_out, nfilters=filters*8)#, drop_value=0.3)
    
# up
    deconv6 = deconv_concat(conv_center, residual=conv5, nfilters=filters*8)
    up6 = conv_block_sequence(deconv6, nfilters=filters*8, num_blocks=3)
    
    deconv7 = deconv_concat(up6, residual=conv4, nfilters=filters*8)
    up7 = conv_block_sequence(deconv7, nfilters=filters*8, num_blocks=3)
    
    deconv8 = deconv_concat(up7, residual=conv3, nfilters=filters*8)
    up8 = conv_block_sequence(deconv8, nfilters=filters*4, num_blocks=3)
    
    deconv9 = deconv_concat(up8, residual=conv2, nfilters=filters*4)
    up9 = conv_block_sequence(deconv9, nfilters=filters*2, num_blocks=2)
    
    deconv10 = deconv_concat(up9, residual=conv1, nfilters=filters*2)
    up10 = conv_block_sequence(deconv10, nfilters=filters*2, num_blocks=1)

# output
    output_layer = Conv2D(filters=nclasses, kernel_size=(1, 1), strides= (1,1))(up10)
    output_layer = Activation('sigmoid')(output_layer)

    model = Model(inputs=input_layer, outputs=output_layer, name='Unet-Tasar')
    return model
