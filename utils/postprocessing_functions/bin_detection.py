#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 14 11:33:29 2021

@author: Bilel Kanoun
"""

import Utils
import matplotlib.pyplot as plt
import numpy as np

from scipy import ndimage

# Read the RGB image
[valid_RGB_siteA,geotransform,proj, band] = Utils.LoadRGBImage('./valid_RGB_siteB.tif') 

# Read the Matrices
[img_rot0_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_0_scale_change_0.95/test_predicted_MRef_rot_0_scale_0.95.tif")
[img_rot0_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_0_scale_change_1/test_predicted_MRef_rot_0_scale_1.tif")
[img_rot0_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_0_scale_change_1.05/test_predicted_MRef_rot_0_scale_1.05.tif")

[img_rot45_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_45_scale_change_0.95/test_predicted_MRef_rot_45_scale_0.95.tif")
[img_rot45_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_45_scale_change_1/test_predicted_MRef_rot_45_scale_1.tif")
[img_rot45_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_45_scale_change_1.05/test_predicted_MRef_rot_45_scale_1.05.tif")

[img_rot90_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_90_scale_change_0.95/test_predicted_MRef_rot_90_scale_0.95.tif")
[img_rot90_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_90_scale_change_1/test_predicted_MRef_rot_90_scale_1.tif")
[img_rot90_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_90_scale_change_1.05/test_predicted_MRef_rot_90_scale_1.05.tif")

[img_rot135_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_135_scale_change_0.95/test_predicted_MRef_rot_135_scale_0.95.tif")
[img_rot135_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_135_scale_change_1/test_predicted_MRef_rot_135_scale_1.tif")
[img_rot135_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_135_scale_change_1.05/test_predicted_MRef_rot_135_scale_1.05.tif")


[img_rot180_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_180_scale_change_0.95/test_predicted_MRef_rot_180_scale_0.95.tif")
[img_rot180_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_180_scale_change_1/test_predicted_MRef_rot_180_scale_1.tif")
[img_rot180_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_180_scale_change_1.05/test_predicted_MRef_rot_180_scale_1.05.tif")

[img_rot225_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_225_scale_change_0.95/test_predicted_MRef_rot_225_scale_0.95.tif")
[img_rot225_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_225_scale_change_1/test_predicted_MRef_rot_225_scale_1.tif")
[img_rot225_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_225_scale_change_1.05/test_predicted_MRef_rot_225_scale_1.05.tif")

[img_rot270_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_270_scale_change_0.95/test_predicted_MRef_rot_270_scale_0.95.tif")
[img_rot270_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_270_scale_change_1/test_predicted_MRef_rot_270_scale_1.tif")
[img_rot270_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_270_scale_change_1.05/test_predicted_MRef_rot_270_scale_1.05.tif")

[img_rot315_scale_0_95,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_315_scale_change_0.95/test_predicted_MRef_rot_315_scale_0.95.tif")
[img_rot315_scale_1,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_315_scale_change_1/test_predicted_MRef_rot_315_scale_1.tif")
[img_rot315_scale_1_05,_,_,_] = Utils.LoadRaster("./rotation_scale_change/rot_315_scale_change_1.05/test_predicted_MRef_rot_315_scale_1.05.tif")

# Stack the values into a 3D-Matrix
#Matrix = np.dstack((img_rot0_scale_0_95, img_rot0_scale_1,img_rot0_scale_1_05, img_rot45_scale_0_95, img_rot45_scale_1,img_rot45_scale_1_05, img_rot90_scale_0_95, img_rot90_scale_1,img_rot90_scale_1_05, img_rot135_scale_0_95, img_rot135_scale_1,img_rot135_scale_1_05,
#                    img_rot180_scale_0_95, img_rot180_scale_1,img_rot180_scale_1_05, img_rot225_scale_0_95, img_rot225_scale_1,img_rot225_scale_1_05, img_rot270_scale_0_95, img_rot270_scale_1,img_rot270_scale_1_05, img_rot315_scale_0_95, img_rot315_scale_1,img_rot315_scale_1_05))

Matrix = np.dstack((img_rot0_scale_0_95, img_rot0_scale_1,img_rot0_scale_1_05, img_rot45_scale_1, img_rot90_scale_0_95, img_rot90_scale_1,img_rot90_scale_1_05, img_rot135_scale_1,
                    img_rot180_scale_0_95, img_rot180_scale_1,img_rot180_scale_1_05, img_rot225_scale_1, img_rot270_scale_0_95, img_rot270_scale_1,img_rot270_scale_1_05, img_rot315_scale_1))


#New_image = np.zeros((Matrix.shape[0], Matrix.shape[1]))
interval_slices=np.linspace(0,1,20)
half_bin_width=(interval_slices[1]-interval_slices[0])/2
def vectorized_binning(tab_val):
    """
    """
    hist, bin_edges = np.histogram(tab_val, bins=interval_slices)
    argmax_val = bin_edges[np.argmax(hist)]+half_bin_width
    return argmax_val

"""
for i in range(Matrix.shape[0]):
    for j in range(Matrix.shape[1]):
        tab_val = Matrix[i,j,:]        
        hist, bin_edges = np.histogram(tab_val, bins=np.linspace(0,1,11))
        argmax_val = np.argmax(hist)/10 + 0.05
        New_image[i,j] = argmax_val
"""
New_image=np.apply_along_axis(vectorized_binning,2, Matrix)

"""
New_image[:4,:] = 0
New_image[:,:6] = 0
New_image[-4:,:] = 0
New_image[:,-2:] = 0
"""

#img_final = ndimage.gaussian_filter(New_image, sigma=(3, 3), order=0)

#Define the kernel
kernel1 = np.array([[0.025, 0.025, 0.025],
                    [0.025, 0.8, 0.025],
                    [0.025, 0.025, 0.025]])

kernel2 = np.array([[0.0625, 0.0625, 0.0625],
                    [0.0625, 0.5, 0.0625],
                    [0.0625, 0.0625, 0.0625]])

kernel3 = np.array([[0.075, 0.075, 0.075],
                    [0.075, 0.4, 0.075],
                    [0.075, 0.075, 0.075]])


kernel4 = np.array([[0.0875, 0.0875, 0.0875],
                    [0.0875, 0.3, 0.0875],
                    [0.0875, 0.0875, 0.0875]])


kernel5 = np.array([[1/9, 1/9, 1/9],
                    [1/9, 1/9, 1/9],
                    [1/9, 1/9, 1/9]])


img_final = ndimage.convolve(New_image, kernel1, mode='mirror')

save_path = "./prediction_MRef_bin_val_bin20_defined_kernel_ApproachA_v2..tif"
Utils.SaveRaster(save_path, img_final, geotransform,proj, band)
#Utils.SaveRaster(save_path, New_image, geotransform,proj, band)
