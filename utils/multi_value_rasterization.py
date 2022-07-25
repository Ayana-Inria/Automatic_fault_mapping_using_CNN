#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Aug  8 13:25:27 2021

@author: Bilel Kanoun
"""
import rasterio
from rasterio.features import rasterize
import numpy as np
import geopandas as gpd
from scipy.ndimage.filters import gaussian_filter
import sys,os
import skimage

import argparse

def rasterize_from_profile(geometry_iter, profile, burn_value):
    """
    rasterize shapes of geometry iterator using the background profile and the burn value.
    returns a numpy array of raster
    """
    return rasterize(geometry_iter,
                     (profile["height"], profile["width"]),
                     fill=0,
                     transform=profile["transform"],
                     all_touched=True,
                     default_value=burn_value,
                     dtype=profile["dtype"])

# Gaussian filtering technique proposed
def apply_gaussian(matrix, sigma=0.5):
    """
    Apply gaussian filter on input matrix.
    Return ndArray
    """
    gaussian_applied= gaussian_filter(matrix, sigma, order=0, truncate=3.0)
    gaussian_applied[matrix > 0] = matrix[matrix > 0]
    #gaussian_applied[ gaussian_applied>1 ] = 1
    return gaussian_applied

# Gaussian filtering technique performed by Lionel Mattéo
def ApplyGaussianFilter(image, sigma=0.7):
	return gaussian_filter(image, sigma)
	return skimage.filters.gaussian(image, sigma=sigma)

def AddGaussianBlur(rasterizedMapping, sigma=0.8):
    rasterizedMappingSmoothed = ApplyGaussianFilter(rasterizedMapping, sigma)
    print(rasterizedMapping.max())
    print(rasterizedMappingSmoothed.max())
    # normed to 1
    rasterizedMappingSmoothed = rasterizedMappingSmoothed/rasterizedMappingSmoothed.max()
    rasterizedMappingSmoothed[rasterizedMapping > 0] = rasterizedMapping[rasterizedMapping > 0]
    print(rasterizedMappingSmoothed.max())
    # 1 as maximum
    #rasterizedMappingSmoothed[rasterizedMappingSmoothed > 1] = 1 
    
    return rasterizedMappingSmoothed
	

def rasterize_gdf(gdf, input_profile, burn_column="b_col"):
    """
    Inputs:
        gdf: geodataframe of geometries with burn value at column burn_column
        rio_dataset: rasterio dataset of refrence (background) image
        burn_column: column name in shapefile representing burning values
    """
            
    new_profile = input_profile
        
    new_profile.update(
        dtype=rasterio.float32,
        count=1
        )
    
    rasterization_images=[]
    
    if (not (burn_column in gdf.columns)):
        single_rasterization= rasterize_from_profile(gdf.geometry, new_profile, 1)
        rasterization_images.append(single_rasterization)
        
    else:
        burning_values=np.sort(gdf[burn_column].unique())
        for c_burn_value in burning_values:
            c_burn_gdf_view = gdf[gdf[burn_column]==c_burn_value]
            single_rasterization = rasterize_from_profile(c_burn_gdf_view.geometry, new_profile, c_burn_value)
            rasterization_images.append(single_rasterization)
       
    return np.max(rasterization_images, axis=0)

    
if __name__ == "__main__":
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--shapefile_path", help='The path related to the vector mapping .shp')
    parser.add_argument("--rgb_reference_image", help='The path related to the RGB image')
    parser.add_argument("--output_path", help='The path to store the outpout raster')
    parser.add_argument("--burn_column", default='b_col', help='A column in the shapefile vector mapping for the uncertain faults (Unc): optional argument, if you did not precise it in the main all faults will be figured as certain')
    
    args = parser.parse_args()
    
    # load gdf
    shapes_gdf=gpd.read_file( args.shapefile_path )
    
    if args.burn_column != 'b_col':
        if args.burn_column not in shapes_gdf.columns:
            print("Missing burn column {} !".format(args.burn_column))
            print("Existing columns: {}".format(shapes_gdf.columns))
            sys.exit(1)
        else:
            print("Burn values count: {}".format(len(shapes_gdf[args.burn_column].unique())))
    
    input_profile = None
    with rasterio.open(args.rgb_reference_image) as input_dst:
        input_profile = input_dst.profile
    input_profile.update(nodata= -32768)
    
    out_matrix=rasterize_gdf(shapes_gdf, input_profile, burn_column=args.burn_column)
    
    out_matrix = apply_gaussian(out_matrix)
    
    #out_matrix_smoothed = AddGaussianBlur(out_matrix, sigma=0.8)
    
    
    with rasterio.open(args.output_path, mode="w", **input_profile) as output_dst:
        output_dst.write(out_matrix,1)
    
