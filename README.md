# Automatic_fault_mapping_using_CNN

This is the code for the paper :
- Bilel Kanoun, Mohamed Abderrazak Cherif, Isabelle Manighetti, Yuliya Tarabalka, Josiane Zerubia. **An enhanced deep learning approach for tectonic fault and fracture extraction in very high resolution optical images**. ICASSP 2022 - IEEE International Conference on Acoustics, Speech, & Signal Processing, IEEE, May 2022, Singapore/Hybrid, Singapore.

If you use this code please cite:
```
@inproceedings{kanoun:hal-03577214,
  TITLE = {{An enhanced deep learning approach for tectonic fault and fracture extraction in very high resolution optical images}},
  AUTHOR = {Kanoun, Bilel and Cherif, Mohamed Abderrazak and Manighetti, Isabelle and Tarabalka, Yuliya and Zerubia, Josiane},
  URL = {https://hal.inria.fr/hal-03577214},
  BOOKTITLE = {{ICASSP 2022 - IEEE International Conference on Acoustics, Speech, \& Signal Processing}},
  ADDRESS = {Singapore/Hybrid, Singapore},
  ORGANIZATION = {{IEEE}},
  YEAR = {2022},
  MONTH = May,
  DOI = {10.1109/ICASSP43922.2022.9747007},
  KEYWORDS = {Image processing ; Curvilinear feature extraction ; Deep convolutional neural network ; VHR optical imagery ; Tectonic faults and fractures},
}
```


## Required packages:
	tensorflow>=2.0.0
	keras>=2.3.1
	rasterio>=1.1.0
	scikit-image

## Converting data

Use the “Convert_Shapefile_to_ERV_standalone.py” program to convert .erv vectors  to .shp vectors
**Example:**

use the following Ubuntu Command
```
python3  Convert_Shapefile_to_ERV_standalone.py CartoD8S1_Isa020821
```
P.S: set file name without extension


## Training
### training/train.py
The algorithm will execute training with the following command on Ubuntu:
```
python3 train.py –data_root ../path_to_the_processed_train_valid_dataset –mean_list 123.68 116.779 103.939 161.54 –tile_channels 4 –num_classes 1 –tile_size 256 –batch_size 6 –epochs 20 --optimizer ADAM --checkpoints_folder_path ../path_to_store_the_checkpoints –checkpoint_name name_of_checkpoint
```

```
optional arguments:
  -h, --help            show this help message and exit
  --data_root DATA_ROOT
                        Select the root of the folder that contains the (train, valid) subfolders
  --tile_size TILE_SIZE
		Select the size (heightxwidth) for the tiles used in the decompostion (default: 256)
  --mean_list MEAN_LIST
                        Select the mean list (Mean RGBT bands) for IamgeNet dataset (default: [123.68, 116.779, 103.939, 161.54])
  --tile_channels TILE_CHANNELS
                        Select the number of classes for the segmentation (default: num_classes=1 for binary segmentation task)
  --num_classes NUM_CLASSES
                        Select the number of classes (default: 1 for binary segmentation)

--batch_size BATCH_SIZE
		selected batch size (default: 12)

--optimizer OPTIMIZER
		default ADAM optimizer (list of optimizers: sgd, adagrad, adadelta, rmsprop, adam)

--checkpoints_folder_path CHECKPOINTS_FOLDER_PATH
		Select the path of checkpoints to store the data

--checkpoint_name CHECKPOINT_NAME
		Select the name of the checkpoint (default: test)
```

## Utils

### utils/multi_value_rasterization.py
The algorithm will execute rasterizing a shapefile vector with the following command on Ubuntu:
```
python3 multi_value_rasterization.py –shapefile_path ../path_to_the_desired_shapefile_shp –rgb_reference_image ../path_to_the_ortho_rgb_image –output_path ../path_to_store_the_raster –burn_column Unc (for uncertain faults if you dont precise it in the command all faults will be selected as certain faults)
```
```
optional arguments:
  -h, --help            show this help message and exit
  --shapefile_path SHAPEFILE_PATH
                        The path related to the vector mapping .shp
  --rgb_reference_image RGB_REFERENCE_IMAGE
                        The path related to the RGB image
  --output_path OUTPUT_PATH
                        The path to store the outpout raster
  --burn_column BURN_COLUMN
                        A column in the shapefile vector mapping for the
                        uncertain faults (Unc): optional argument, if you did
                        not precise it in the main all faults will be figured
                        as certain
```
### utils/balanced_tile_partition.py
a technique used for tile partition of a selected optical site into “train”, “valid” tiles of RGB and their corresponding GT with 0°, 45° roatation and 90° rotation.

Use the following Ubuntu command:
```
python3 balanced_tile_partition.py –site_name name_your_site --valid_shp_path ../path_to_valid_zone_area_shp –rgb_path ../path_to_ortho_optical_image –gt_path ../path_to_gt_raster_that_corresponds_to_rgb_optical_site --tile_size 256 –output_folder ../path_to_store_tiles (use data/processed/folder_name) –tile_type_column TTV (do not put it if you want, it will differentiate between valid and train tiles)
```
```
optional arguments:
  -h, --help            show this help message and exit
  --site_name SITE_NAME
                        set the name of the selected RGBT site
  --valid_shp_path VALID_SHP_PATH
                        The path of the shapefile (polygone) related to the
                        validation zone
  --rgb_path RGB_PATH   The path related to the RGB image
  --gt_path GT_PATH     The pâth related to the ground truth mapping raster
  --tile_size TILE_SIZE
                        Select the size (heightxwidth) for the tiles used in
                        the decompostion (default: 256)
  --output_folder OUTPUT_FOLDER
                        The path related to the folder name in which the user
                        store the tiles: contains two sub-folders (train,
                        valid) on each one the user find (image, gt) folders
                        for the RGB tiles anbd their corresponding ground
                        truth respectively
  --tile_type_column TILE_TYPE_COLUMN
                        A name used to differentiate the training tiles from valid ones
```

## Visualization
### visualization/test.py
The algorithm will execute ttest prediction with the following command on Ubuntu:
```
python3 test.py –rgb_patjh ../path_to_the_test_dataset –mean_list 123.68 116.779 103.939 161.54 –tile_channels 4 –num_classes 1 –tile_size 256 –batch_size 6 checkpoints_folder_path ../path_to_store_the_checkpoints –output_folder  ../path_to_the_output –pred_name name_of_prediction
```

```
optional arguments:
  -h, --help            show this help message and exit
  --rgb_path RGB_PATH
                        Select the root of the folder that contains the (train, valid) subfolders
  --tile_size TILE_SIZE
		        Select the size (heightxwidth) for the tiles used in the decompostion (default: 256)
  --mean_list MEAN_LIST
                        Select the mean list (Mean RGBT bands) for IamgeNet dataset (default: [123.68, 116.779, 103.939, 161.54])
  --tile_channels TILE_CHANNELS
                        Select the number of classes for the segmentation (default: num_classes=1 for binary segmentation task)
  --num_classes NUM_CLASSES
                        Select the number of classes (default: 1 for binary segmentation)
  --batch_size BATCH_SIZE
                        selected batch size (default: 12)
```