#!/usr/bin/python2.7
# coding: utf-8

import sys
import os
import shapefile

def Erv2Shp(InFileName, OutFileName='', KeepColorsSizes=True):
	"""
			Convert a Vector File from Er Mapper (erv) to a Shapefile
			--
			Nom : MATTEO Lionel
			Date : 27/02/2018
			--
			InFileName : Name of the Er Mapper file, in string without extension
			OutFileName : Default same than InFileName with shapefiles extensions
			KeepColors : Boolean - True is keeping original colors from the Erv file
	"""
	if not os.path.isfile(InFileName):
		print("Error 01: {}".format(InFileName))
		print("Error 01: File doesn't exist")
		sys.exit()

	InFileName = InFileName.split('.')[0]
	if OutFileName == '':
		OutFileName = InFileName

	file_data = open(InFileName, 'r').readlines()

	PolyLines = {}
	PolyLines['PolyLine'] = {}
	# Reformat file_data
	File_Data_Reformat = []
	tmp = ''
	for polyline in file_data:
		if polyline.find(')') > -1:
			File_Data_Reformat += [tmp+polyline]
			tmp = ''
		else:
			tmp += polyline

	# Convert into Shapefile
	for idd, polyline in enumerate(File_Data_Reformat):
		if polyline.split('(')[0] == "poly":
			polyline_group = ','.join(polyline.replace(').\n', '').split(',')[-4:-1])
			polyline_id = polyline.replace(').\n', '').split(',')[-9]
			polyline_line_type = polyline.replace(').\n', '').split(',')[-8]
			polyline_points = polyline.split('[')[1].split(']')[0].split(',')
			polyline_points = zip(polyline_points[0::2], polyline_points[1::2])
			try:
				PolyLines['PolyLine'][polyline_group]
			except KeyError:
				PolyLines['PolyLine'][polyline_group] = {}
			try:
				PolyLines['PolyLine'][polyline_group][polyline_id]
			except KeyError:
				PolyLines['PolyLine'][polyline_group][polyline_id] = {}
			try:
				PolyLines['PolyLine'][polyline_group][polyline_id]['points']
			except KeyError:
				PolyLines['PolyLine'][polyline_group][polyline_id]['points'] = []

			PolyLines['PolyLine'][polyline_group][polyline_id]['points'] += [[[polyline_line_type],[[float(pts[0]), float(pts[1])] for pts in polyline_points]]]
			PolyLines['PolyLine'][polyline_group][polyline_id]['LineType'] = polyline_line_type
		else:
			print(polyline.split('(')[0])

	PolyLines['Group'] = {}
	counter = 0
	for key in PolyLines['PolyLine'].keys():
		PolyLines['Group'][str(key)] = counter
		counter += 1

	PolyLines['SubGroup'] = {}

	for KEY in PolyLines['PolyLine'].keys():
		PolyLines['SubGroup'][str(KEY)] = sorted(PolyLines['PolyLine'][str(KEY)].keys())

	outfc = shapefile.Writer(OutFileName, shapeType=3)
	Fields = ['Group', 'Subgroup', 'LineType', 'RGBColors', 'ErMapperSiz']
	outfc.field(Fields[0],'N')
	outfc.field(Fields[1],'N')
	outfc.field(Fields[2],'N')
	if KeepColorsSizes:
		outfc.field(Fields[3],'C')
		outfc.field(Fields[4],'C')
		# Create a qml file to export the display the same colors on the erv and shp files
		StyleFileName = OutFileName+'_style.qml'
		StyleFileData = open(StyleFileName, 'w')
		Headers = []
		Headers += ["<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>"]
		Headers += ['<qgis version="2.18.16" simplifyAlgorithm="0" minimumScale="0" maximumScale="1e+08" simplifyDrawingHints="1" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" readOnly="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" scaleBasedLabelVisibilityFlag="0">']
		Headers += ["\t<edittypes>"]
		for field in Fields:
			Headers += ['\t\t<edittype widgetv2type="TextEdit" name="{}">'.format(field)]
			Headers += ['\t\t\t<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>']
			Headers += ["\t\t</edittype>"]
		Headers += ["\t</edittypes>"]
		Headers += ['\t<renderer-v2 attr="Group" forceraster="0" symbollevels="0" type="categorizedSymbol" enableorderby="0">']
		Headers += ["\t\t<categories>"]
		for Group in PolyLines['Group']:
			Headers += ['\t\t\t<category render="true" symbol="{0}" value="{0}" label="{0}"/>'.format(int(PolyLines['Group'][Group]))]
		Headers += ["\t\t</categories>"]
		Headers += ["\t\t<symbols>"]
		for Group in PolyLines['Group']:
			Headers += ['\t\t\t<symbol alpha="1" clip_to_extent="1" type="line" name="{}">'.format(int(PolyLines['Group'][Group]))]
			Headers += ['\t\t\t\t<layer pass="0" class="SimpleLine" locked="0">']
			Headers += ['\t\t\t\t\t<prop k="capstyle" v="square"/>']
			Headers += ['\t\t\t\t\t<prop k="customdash" v="5;2"/>']
			Headers += ['\t\t\t\t\t<prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>']
			Headers += ['\t\t\t\t\t<prop k="customdash_unit" v="MM"/>']
			Headers += ['\t\t\t\t\t<prop k="draw_inside_polygon" v="0"/>']
			Headers += ['\t\t\t\t\t<prop k="joinstyle" v="bevel"/>']
			Headers += ['\t\t\t\t\t<prop k="line_color" v="{},255"/>'.format(str(Group))]
			Headers += ['\t\t\t\t\t<prop k="line_style" v="solid"/>']
			Headers += ['\t\t\t\t\t<prop k="line_width" v="0.26"/>']#changer ici pour la taille de la ligne
			Headers += ['\t\t\t\t\t<prop k="line_width_unit" v="MM"/>']
			Headers += ['\t\t\t\t\t<prop k="offset" v="0"/>']
			Headers += ['\t\t\t\t\t<prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>']
			Headers += ['\t\t\t\t\t<prop k="offset_unit" v="MM"/>']
			Headers += ['\t\t\t\t\t<prop k="use_custom_dash" v="0"/>']
			Headers += ['\t\t\t\t\t<prop k="width_dd_active" v="1"/>']
			Headers += ['\t\t\t\t\t<prop k="width_dd_expression" v="to_real(&quot;ErMapperSiz&quot;)/2"/>']
			Headers += ['\t\t\t\t\t<prop k="width_dd_field" v=""/>']
			Headers += ['\t\t\t\t\t<prop k="width_dd_useexpr" v="1"/>']
			Headers += ['\t\t\t\t\t<prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>']
			Headers += ["\t\t\t\t</layer>"]
			Headers += ["\t\t\t</symbol>"]
		Headers += ["\t\t</symbols>"]
		Headers += ["\t</renderer-v2>"]
		Headers += ["</qgis>"]

		for line in Headers:
			StyleFileData.write(line+'\n')

	for Group in PolyLines['Group']:
		for SubGroup in PolyLines['PolyLine'][str(Group)].keys():
			for line in PolyLines['PolyLine'][str(Group)][str(SubGroup)]['points']:
				outfc.line([line[1]])
				if KeepColorsSizes:
					#                      Group                                        SubGroup                                LineType      RGBColors   ErMapperSize
					outfc.record(float(PolyLines['Group'][Group]), float(PolyLines['SubGroup'][str(Group)].index(SubGroup)), str(line[0][0]), str(Group), str(SubGroup))
				else:
					outfc.record(float(PolyLines['Group'][Group]), float(PolyLines['SubGroup'][str(Group)].index(SubGroup)), PolyLines['PolyLine'][str(Group)][str(SubGroup)]['LineType'])

	outfc.close()


InFileName = sys.argv[1]
if len(sys.argv) == 3:
	OutFileName = sys.argv[2]
else:
	OutFileName = ''

if len(sys.argv) == 4:
	KeepColorsSizes = sys.argv[3]
else:
	KeepColorsSizes = True

print('toto')
Erv2Shp(InFileName, OutFileName, KeepColorsSizes)
