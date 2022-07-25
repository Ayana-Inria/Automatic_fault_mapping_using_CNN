#!/usr/bin/python2.7
# coding: utf-8

import sys
import os
import shapefile
import numpy as np

def Shp2Erv(InFileName, OutFileName='', KeepColorsSizes=True, Faults=True):
	"""
			Convert a Shapefile to an Er Mapper Vector File
			--
			Nom : MATTEO Lionel
			Date : 27/02/2018
			--
			InFileName : Name of the Er Mapper file, in string without extension
			OutFileName : Default same than InFileName with shapefiles extensions
			KeepColors : Boolean - True is keeping original colors from the Erv file
	"""
	import datetime

	if not os.path.isfile(InFileName.split('.')[0]+'.shp'):
		#Pretty_Print("Error 01: File doesn't exist", 2)
		sys.exit()

	InFileName = InFileName.split('.')[0]
	if OutFileName == '':
		OutFileName = InFileName

	NewErMapperDatas = open('{}'.format(OutFileName), 'w')
	sf = shapefile.Reader('{}.shp'.format(InFileName))
	All = sf.shapeRecords()
	#SelectedID = 34
	#WantedIndex = [index for index in range(len(All)) if All[index].record[0] == SelectedID]
	shapes = sf.shapes()
	shapes = [All[index].shape for index in range(len(All))]
	#shapes = [All[index].shape for index in WantedIndex]
	records = sf.records()
	records = [All[index].record for index in range(len(All))]
	#records = [All[index].record for index in WantedIndex]
	if Faults:
		if KeepColorsSizes:
			Colors = np.array(records)[:,0]
			Colors = Colors[:, np.newaxis]#vector in column
			Colors = np.column_stack([Colors, Colors, Colors])#3 columns to RGB
			for color in np.unique(Colors[:, 0]):
				RandColor = np.random.uniform(0,255,3).astype(int)
				Colors[Colors[:,0] == color] = RandColor
			Sizes = np.array(records)[:,1]
			if type(Sizes[0]) != type(int()):
				Sizes = np.repeat(1, len(Sizes))
			else:
				Sizes[Sizes == None] = Sizes.max()
				Sizes = (((Sizes/Sizes.max())*-1.)+1)#All size reversed between 0 and 2
		else:
			Colors = [list(np.random.uniform(0,255,3).astype(int)) for i in range(len(np.unique(np.array(records)[:,0])))]
			Sizes = np.around(np.linspace(1, 3, len(np.unique(np.array(records)[:,1]))), decimals=1)
		try:
			LineTypes = np.array(records)[:,2]
		except IndexError:
			LineTypes = np.repeat(0, len(Sizes))
		LineTypes[LineTypes == None] = 2
		counter = 0

		for line in shapes:
			points = line.points
			Head = 'poly(,{},'.format(len(points))
			if KeepColorsSizes:
				Foot = ',0,{},{},0,0,0,{},{},{},0).\n'.format(Sizes[counter], LineTypes[counter]+1,Colors[counter][0], Colors[counter][1], Colors[counter][2])
			else:
				Foot = ',0,{},{},0,0,0,{},{},{},0).\n'.format(Sizes[records[counter][1]], LineTypes[counter], Colors[records[counter][0]][0], Colors[records[counter][0]][1], Colors[records[counter][0]][2])
			STRpoints = [[str(pts[0]), str(pts[1])] for pts in points]
			if len(STRpoints) > 21:
				counterPoints = 0
				Points = []
				for pts in STRpoints:
					counterPoints += 1
					if counter == 20:
						Points += ['\n'+pts[0], pts[1]]
						counterPoints = 0
					else:
						Points += [pts[0], pts[1]]
				Points = '[' + ','.join(Points) + ']'
			else:
				Points = '[' + ','.join(','.join(pts) for pts in STRpoints) + ']'
			NewErMapperDatas.write(Head + Points + Foot)
			counter += 1
	else:
		for Polyline in shapes:
			points = Polyline.points
			Head = 'poly(,{},'.format(len(points))
			Size, LineType, Color = [1, 1, [255, 0, 0]]
			Foot = ',0,{},{},0,0,0,{},{},{},0).\n'.format(Size, LineType, Color[0], Color[1], Color[2])
			STRpoints = [[str(pts[0]), str(pts[1])] for pts in points]
			if len(STRpoints) > 21:
				counter = 0
				Points = []
				for pts in STRpoints:
					counter += 1
					if counter == 20:
						Points += ['\n'+pts[0], pts[1]]
						counter = 0
					else:
						Points += [pts[0], pts[1]]
				Points = '[' + ','.join(Points) + ']'
			else:
				Points = '[' + ','.join(','.join(pts) for pts in STRpoints) + ']'
			print(Head + Points + Foot)
			NewErMapperDatas.write(Head + Points + Foot)

	NewErMapperHeaders = open('{}.erv'.format(OutFileName), 'w')
	TLEastings = min([np.min(np.array(shapes[index].points), axis=0)[0] for index in range(len(shapes)) if np.array(shapes[index].points).size > 0])
	TLNorthings = max([np.max(np.array(shapes[index].points)[:,1]) for index in range(len(shapes)) if np.array(shapes[index].points).size > 0])
	BREastings = max([np.max(np.array(shapes[index].points), axis=0)[0] for index in range(len(shapes)) if np.array(shapes[index].points).size > 0])
	BRNorthings = min([np.min(np.array(shapes[index].points)[:,1]) for index in range(len(shapes)) if np.array(shapes[index].points).size > 0])

	Headers = []
	Headers += ['DatasetHeader Begin\n']
	Headers += ['\tVersion\t\t= "7.1"\n']
	Headers += ['\tName\t\t= "{}.erv"\n'.format(InFileName.split('/')[-1])]
	Headers += ['\tLastUpdated\t= {}\n'.format(datetime.datetime.now().strftime("%a %b %d %H:%M:%S GMT %Y"))]
	Headers += ['\tDataSetType\t= None\n']
	Headers += ['\tDataType\t= Vector\n']
	Headers += ['\tByteOrder\t= LSBFirst\n']
	Headers += ['\tCoordinateSpace Begin\n']
	Headers += ['\t\tDatum\t\t= "WGS84"\n']
	Headers += ['\t\tProjection\t= "NUTM12"\n']
	Headers += ['\t\tCoordinateType\t= EN\n']
	Headers += ['\t\tUnits\t\t= "meters"\n']
	Headers += ['\t\tRotation\t= 0:0:0.0\n']
	Headers += ['\tCoordinateSpace End\n']
	Headers += ['\tVectorInfo Begin\n']
	Headers += ['\t\tType\t\t= ERVEC\n']
	Headers += ['\t\tFileFormat\t= ASCII\n']
	Headers += ['\t\tExtents Begin\n']
	Headers += ['\t\t\tTopLeftCorner Begin\n']
	Headers += ['\t\t\t\tEastings\t= {}\n'.format(TLEastings)]
	Headers += ['\t\t\t\tNorthings\t= {}\n'.format(TLNorthings)]
	Headers += ['\t\t\tTopLeftCorner End\n']
	Headers += ['\t\t\tBottomRightCorner Begin\n']
	Headers += ['\t\t\t\tEastings\t= {}\n'.format(BREastings)]
	Headers += ['\t\t\t\tNorthings\t= {}\n'.format(BRNorthings)]
	Headers += ['\t\t\tBottomRightCorner End\n']
	Headers += ['\t\tExtents End\n']
	Headers += ['\tVectorInfo End\n']
	Headers += ['DatasetHeader End\n']

	for line in Headers:
		NewErMapperHeaders.write(line)

InFileName = sys.argv[1]
if len(sys.argv) >= 3:
	OutFileName = sys.argv[2]
else:
	OutFileName = ''
	
if len(sys.argv) >= 4:
	KeepColorsSizes = sys.argv[3]
	if KeepColorsSizes == 'True':
		KeepColorsSizes = True
	elif KeepColorsSizes == 'False':
		KeepColorsSizes = False
else:
	KeepColorsSizes = True
	
if len(sys.argv) >= 5:
	Faults = sys.argv[4]
	if Faults == 'True':
		Faults = True
	elif Faults == 'False':
		Faults = False
else:
	Faults = True

Shp2Erv(InFileName, OutFileName, KeepColorsSizes, Faults)
