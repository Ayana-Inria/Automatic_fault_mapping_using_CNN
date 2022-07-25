#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 10 09:25:43 2022

@author: Bilel Kanoun
"""

import scipy.io as sio
import numpy as np

import matplotlib.pyplot as plt

import os

FIGURE_PATH = './Plots_train_validation_loss'
figurename = 'train_valid_loss_BK_MRef_Refined_combined_loss_ReduceLRPlateau_final.png' 

#dicc = sio.loadmat('../../models/balanced_train_combined_loss_BK_MRef_refined_3_pix_width_gt/2022-02-08 18:35:45.294398/train_val_loss_BK_MRef_refined_3_pix_with_gt.mat')
dicc = sio.loadmat('/home/dell/Documents/LxGeo/repos/faultsDetectionDL/models/BK_MRef_refined_GP_Balloon/2022-03-25 20:17:15.363635/train_val_loss_BK_MRef_refined.mat')

train_loss = dicc['train_loss']
val_loss = dicc['val_loss']


# Convert a list to a np array
train_loss = np.array(train_loss).transpose()
val_loss = np.array(val_loss).transpose()

# Plot the graph
plt.figure(figsize=(12,8))
epoch = np.arange(1,len(val_loss)+1)
plt.plot(epoch, train_loss, 'r', label='train loss')
plt.plot(epoch, val_loss, 'b', label='validation loss')
plt.legend(loc='upper right')
plt.xlabel('Epoch')
plt.ylabel('combined loss (wBCE+IoU) L"')
#plt.title(label='Variation of the combined loss L" as a function of number of epochs (BK-MRef Basic veg. train)')
plt.title(label='Variation of the combined loss L" as a function of num of epochs (BK-MRef Refined)', fontsize=12)
plt.grid()
plt.xlim([1,len(val_loss)])
plt.show()

# save the plot
if not os.path.isdir(FIGURE_PATH):
    os.makedirs(FIGURE_PATH)
    
plt.savefig(os.path.join(FIGURE_PATH,figurename),bbox_inches='tight', dpi=300)
