#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Mar 18 12:01:35 2021

This file contains the utils (functions) that I used for slicing the 
VHR optical images and then, reconstructing the sites

@author: Bilel Kanoun
"""
from osgeo import osr, gdal
import numpy as np
from skimage.transform import rotate, rescale, resize


def LoadRaster(image):
    image_gdal = gdal.Open(image)

    geotransform = image_gdal.GetGeoTransform()
    proj = image_gdal.GetProjection()
    band = image_gdal.GetRasterBand(1)
    NO_DATA = image_gdal.GetRasterBand(1).GetNoDataValue()

    img_arr = image_gdal.ReadAsArray()
    
    return img_arr, geotransform, proj, band, NO_DATA


def LoadRGBImage(image):
    image_gdal = gdal.Open(image)

    geotransform = image_gdal.GetGeoTransform()
    proj = image_gdal.GetProjection()
    band = image_gdal.GetRasterBand(1)

    img_arr = image_gdal.ReadAsArray()
    img_arr = img_arr .transpose(1,2,0)
    
    return img_arr, geotransform, proj, band

def SaveRGBRaster(dir_path, image, geotransform, proj, band):
    driver = gdal.GetDriverByName("GTiff")
    driver.Register()

    dst_ds = driver.Create(dir_path, xsize = image.shape[1], ysize = image.shape[0], 
                           bands = 4, eType = band.DataType)

    ##writting output raster
    dst_ds.GetRasterBand(1).WriteArray(np.squeeze(image[:,:,0]))
    dst_ds.GetRasterBand(2).WriteArray(np.squeeze(image[:,:,1]))
    dst_ds.GetRasterBand(3).WriteArray(np.squeeze(image[:,:,2]))
    dst_ds.GetRasterBand(4).WriteArray(np.squeeze(image[:,:,3]))

    #setting extension of output raster
    # top left x, w-e pixel resolution, rotation, top left y, rotation, n-s pixel resolution
    dst_ds.SetGeoTransform(geotransform)
    outband = dst_ds.GetRasterBand(1)

    # setting spatial reference of output raster 
    srs = osr.SpatialReference(wkt = proj)
    dst_ds.SetProjection(srs.ExportToWkt())
    #dst_ds.SetNoDataValue(np.nan)

    #Close output raster dataset 
    outband = None
    dst_ds = None
    
    return None


def SaveRaster(dir_path, image, geotransform, proj, band):
    driver = gdal.GetDriverByName("GTiff")
    driver.Register()

    dst_ds = driver.Create(dir_path, xsize = image.shape[1], ysize = image.shape[0], 
                           bands = 1, eType = gdal.GDT_Float64)

    ##writting output raster
    dst_ds.GetRasterBand(1).WriteArray(np.squeeze(image))
    
    #setting extension of output raster
    # top left x, w-e pixel resolution, rotation, top left y, rotation, n-s pixel resolution
    dst_ds.SetGeoTransform(geotransform)
    outband = dst_ds.GetRasterBand(1)

    # setting spatial reference of output raster 
    srs = osr.SpatialReference(wkt = proj)
    dst_ds.SetProjection(srs.ExportToWkt())
    #dst_ds.SetNoDataValue(np.nan)

    #Close output raster dataset 
    outband = None
    dst_ds = None
    
    return None

def start_points(size, split_size, overlap=0):
    points = [0]
    stride = int(split_size * (1-overlap))
    counter = 1
    while True:
        pt = stride * counter
        if pt + split_size >= size:
            points.append(size - split_size)
            break
        else:
            points.append(pt)
        counter += 1
    return points

def get_tiles(img):
    img_h, img_w, _ = img.shape
    split_width = split_height = 256
    
    X_patches = np.zeros((10*img.shape[0], split_height, split_width, img.shape[2]), dtype=np.float32)

    X_points = start_points(img_w, split_width, 0.5)
    Y_points = start_points(img_h, split_height, 0.5)

    count = 0

    for i in Y_points:
        for j in X_points:
            split = img[i:i+split_height, j:j+split_width]

            X_patches[count] = split
        
        #        imsave('{}_{}.{}'.format(name, count, frmt), split)
            count += 1

    X_patches = X_patches[:count]
    
    return X_patches

def rotate_image(img, angle):
    return rotate(img, angle, resize=True, mode="constant")

def change_scale(img, scale_val):
    return rescale(img, scale_val, multichannel=True, anti_aliasing=False, 
                   preserve_range=True, mode='constant')

def change_scale_inverse(img, shape1, shape2):
    return resize(img, [shape1, shape2])

def reconstruct_site(img_valid, img_pred):
    n_classes=1     
    img_reconst = np.zeros((img_valid.shape[0],img_valid.shape[1],n_classes))   
    overlap = img_pred.shape[1]//2  # Height shape: 256
    semi_overlap = overlap//2    # moitier de l'overlapping
    concat_overlap = overlap + semi_overlap 

    num_rows = img_valid.shape[0]//overlap
    num_cols = img_valid.shape[1]//overlap


    l = 0
    i = 1
    j = 1

    while (l < img_pred.shape[0]):
        img_reconst[semi_overlap+overlap*(j-1):semi_overlap+(overlap*j),semi_overlap+overlap*(i-1):semi_overlap+(overlap*i),:] = img_pred[l][semi_overlap:concat_overlap,semi_overlap:concat_overlap] # Middle if the image
    
    
        # On the boarders
        if (j==1):
            img_reconst[:semi_overlap+(overlap*j),semi_overlap+overlap*(i-1):semi_overlap+(overlap*i),:] = img_pred[l][:concat_overlap,semi_overlap:concat_overlap]
    
        if (j==(num_rows-1)):
            img_reconst[semi_overlap+overlap*(j-1):,semi_overlap+overlap*(i-1):semi_overlap+(overlap*i),:] = img_pred[l][semi_overlap:,semi_overlap:concat_overlap]
    
        if (i==1):
            img_reconst[semi_overlap+overlap*(j-1):semi_overlap+(overlap*j),:semi_overlap+(overlap*i),:] = img_pred[l][semi_overlap:concat_overlap,:concat_overlap]
            if (j==1):
                img_reconst[:semi_overlap+(overlap*j),:semi_overlap+(overlap*i),:] = img_pred[l][:concat_overlap,:concat_overlap]
            if (j==(num_rows-1)):
                img_reconst[semi_overlap+overlap*(j-1):,:semi_overlap+(overlap*i),:] = img_pred[l][semi_overlap:,:concat_overlap]
    
        if (i==(num_cols-1)):
            img_reconst[semi_overlap+overlap*(j-1):semi_overlap+(overlap*j),semi_overlap+overlap*(i-1):,:] = img_pred[l][semi_overlap:concat_overlap,semi_overlap:]
            if (j==1):
                img_reconst[:semi_overlap+(overlap*j),semi_overlap+overlap*(i-1):,:] = img_pred[l][:concat_overlap,semi_overlap:]
            if (j==(num_rows-1)):
                img_reconst[semi_overlap+overlap*(j-1):,semi_overlap+overlap*(i-1):,:] = img_pred[l][semi_overlap:,semi_overlap:]
    
        if (i%(num_cols-1)==0):
            i=0
            j+=1
    
        i+=1
        l+=1
    
    return img_reconst
