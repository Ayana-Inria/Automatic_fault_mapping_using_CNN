#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 19 18:09:50 2021

@author: Bilel Kanoun
"""

import rasterio as rio
import geopandas as gpd
from rasterio.plot import reshape_as_raster, reshape_as_image
from shapely.affinity import rotate as rotate_geometry
from skimage.transform import rotate as rotate_image
from shapely.geometry import box
import tempfile
#import affine

from grid_creation import run_grid_creation
from tile_partition import run_partition

import os

import argparse

def run_balanced_partition(site_name, valid_geometry, rgb_rio_dst, gt_rio_dst, 
                           tile_size, output_folder, tile_type_column):
    
    x_size = rgb_rio_dst.transform[0]
    y_size = -rgb_rio_dst.transform[4]
    # Set the list of rotation angles
    #angles_list = [0]   
    angles_list = [0, 45, 90]
    
    for angle in angles_list:
        
        # Set current site name
        c_site_name = site_name + '_rot_{}'.format(angle)
        # In case of using 0° orientation only: 
        #c_site_name = site_name    # no need to specify the rotation angle
        print( "Running partition for angle {} ".format(angle) )
        
        

        # Rotate RGB and gtreshape_as_image
        rgb_rio_raster = rgb_rio_dst.read()
        gt_rio_raster = gt_rio_dst.read()
        #accross_bands_no_data = np.invert(rgb_rio_raster.min(axis=0).astype(bool))
        accross_bands_no_data = (rgb_rio_raster.min(axis=0)==255)
        rgb_rio_raster[:, accross_bands_no_data] = 0
        gt_rio_raster[:, accross_bands_no_data] = 0
        rgb_rotated = rotate_image(reshape_as_image(rgb_rio_dst.read()), angle, resize=True, preserve_range=True)
        gt_rotated = rotate_image(reshape_as_image(gt_rio_dst.read()), angle, resize=True, preserve_range=True)
        
        assert((rgb_rotated.shape[0] == gt_rotated.shape[0]) and (rgb_rotated.shape[1] == gt_rotated.shape[1]))
        
        # Creating new geotransformp for rotated rasters
        rgb_zone_geometry = box(*rgb_rio_dst.bounds)
        rotated_zone_envelop_bounds = rotate_geometry(rgb_zone_geometry, angle).bounds
        
        # Rotate valid geometry
        rotated_valid_geometry = rotate_geometry(valid_geometry, angle, origin=rgb_zone_geometry.centroid)
        
        new_geotransform = rio.transform.from_origin(
            rotated_zone_envelop_bounds[0],
            rotated_zone_envelop_bounds[-1],
            x_size, y_size)
        #new_geotransform= new_geotransform* affine.Affine.rotation(-angle, pivot=rgb_zone_geometry.centroid.coords[0])
        
        with tempfile.NamedTemporaryFile() as rgb_rotated_tmpfile:
            with rio.open(rgb_rotated_tmpfile.name,
                               'w+', driver='GTiff',
                               height=rgb_rotated.shape[0],
                               width=rgb_rotated.shape[1],
                               count=rgb_rotated.shape[2],
                               dtype=rgb_rotated.dtype,
                               crs=rgb_rio_dst.crs,
                               transform=new_geotransform) as rgb_rotated_dst:
                
                with tempfile.NamedTemporaryFile() as gt_rotated_tmpfile:
                    with rio.open(gt_rotated_tmpfile.name,
                                       'w+', driver='GTiff',
                                       height=gt_rotated.shape[0],
                                       width=gt_rotated.shape[1],
                                       count=1,
                                       dtype=rgb_rotated.dtype,
                                       crs=gt_rio_dst.crs,
                                       transform=new_geotransform) as gt_rotated_dst:
                        
                        # writing rgb array
                        rgb_rotated_dst.write(reshape_as_raster(rgb_rotated).astype(rgb_rotated_dst.meta["dtype"]))
                        
                        # writing gt array
                        gt_rotated_dst.write(reshape_as_raster(gt_rotated).astype(gt_rotated_dst.meta["dtype"]))
                        
                        # tile grid creation
                        grid_gdf = run_grid_creation(rgb_rotated_dst, rotated_valid_geometry, tile_size)
                        
                        # tile partition
                        run_partition(c_site_name, grid_gdf, rgb_rotated_dst, gt_rotated_dst, 
                                      output_folder, tile_type_column)
                



if __name__ == "__main__" :
    parser = argparse.ArgumentParser()
    parser.add_argument("--site_name", help="set the name of the selected RGBT site")
    parser.add_argument("--valid_shp_path", help="The path of the shapefile (polygone) related to the validation zone")
    parser.add_argument("--rgb_path", help='The path related to the RGB image')
    parser.add_argument("--gt_path", help="The pâth related to the ground truth mapping raster")
    parser.add_argument("--tile_size", default=256, type=int, help="Select the size (heightxwidth) for the tiles used in the decompostion (default: 256)")
    parser.add_argument("--output_folder", help='The path related to the folder name in which the user store the tiles: contains two sub-folders (train, valid) on each one the user find (image, gt) folders for the RGB tiles anbd their corresponding ground truth respectively')
    parser.add_argument("--tile_type_column", default="TTV", help='A name used to differenciate the training tiles from the validation ones (default: "TTV")')
    
    args = parser.parse_args()
        
    valid_shp = gpd.read_file(args.valid_shp_path) 
    valid_geometry = valid_shp.geometry[0]
    
    if not os.path.isdir(args.output_folder):
        os.makedirs(args.output_folder)
    
    with rio.open(args.rgb_path) as rgb_rio_dst:
        with rio.open(args.gt_path) as gt_rio_dst:        
            run_balanced_partition(args.site_name, valid_geometry, rgb_rio_dst, gt_rio_dst, 
                               args.tile_size, args.output_folder, args.tile_type_column)
   
