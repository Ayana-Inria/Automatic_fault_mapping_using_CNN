#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 21 10:30:45 2022

@author: Bilel Kanoun
"""

import scipy.io as sio

import numpy as np

import pandas as pd

import matplotlib.pyplot as plt


loss_dir = '/home/dell/Documents/LxGeo/repos/faultsDetectionDL/models/BK_MRef_refined_GP_Balloon/2022-03-25 20:17:15.363635/train_val_loss_BK_MRef_refined.mat'

dicc = sio.loadmat(loss_dir)

train_loss = dicc['train_loss']
val_loss = dicc['val_loss']


# Convert a list to a np array
train_loss = np.array(train_loss).transpose()
val_loss = np.array(val_loss).transpose()

step = np.arange(1,len(train_loss)+1)

df_train_loss = pd.DataFrame(data=train_loss, columns=['value'])
#print(df_train_loss)

df_valid_loss = pd.DataFrame(data=val_loss, columns=['value'])
#print(df_valid_loss)

#TSBOARD_SMOOTHING = [0.6, 0.78, 0.99]
TSBOARD_SMOOTHING = [0.6]

smooth_train = []
smooth_valid = []

for ts_factor in TSBOARD_SMOOTHING:
    smooth_train.append(df_train_loss.ewm(alpha=(1 - ts_factor)).mean())
    smooth_valid.append(df_valid_loss.ewm(alpha=(1 - ts_factor)).mean())

for ptx in range(3):
    #plt.subplot(1,3,ptx+1)
    plt.plot(step, df_train_loss["value"], 'r-', alpha=0.4)
    plt.plot(step, smooth_train[ptx]["value"], 'r', label='train loss')
    plt.plot(step, df_valid_loss["value"], 'b-', alpha=0.4)
    plt.plot(step, smooth_valid[ptx]["value"], 'b', label='validation loss')
    plt.title("Tensorboard Smoothing = {}".format(TSBOARD_SMOOTHING[ptx]))
    plt.grid(alpha=0.3)
    plt.legend(loc='upper right')
    plt.xlabel('Epoch')
    plt.ylabel('combined loss (wBCE+IoU) L"')
    plt.xlim([1,len(val_loss)])

plt.show()
