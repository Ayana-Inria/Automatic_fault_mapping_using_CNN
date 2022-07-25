<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="2.18.16" simplifyAlgorithm="0" minimumScale="0" maximumScale="1e+08" simplifyDrawingHints="1" minLabelScale="0" maxLabelScale="1e+08" simplifyDrawingTol="1" readOnly="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" scaleBasedLabelVisibilityFlag="0">
	<edittypes>
		<edittype widgetv2type="TextEdit" name="Group">
			<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
		</edittype>
		<edittype widgetv2type="TextEdit" name="Subgroup">
			<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
		</edittype>
		<edittype widgetv2type="TextEdit" name="LineType">
			<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
		</edittype>
		<edittype widgetv2type="TextEdit" name="RGBColors">
			<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
		</edittype>
		<edittype widgetv2type="TextEdit" name="ErMapperSiz">
			<widgetv2config IsMultiline="0" fieldEditable="1" constraint="" UseHtml="0" labelOnTop="0" constraintDescription="" notNull="0"/>
		</edittype>
	</edittypes>
	<renderer-v2 attr="Group" forceraster="0" symbollevels="0" type="categorizedSymbol" enableorderby="0">
		<categories>
			<category render="true" symbol="0" value="0" label="0"/>
			<category render="true" symbol="1" value="1" label="1"/>
		</categories>
		<symbols>
			<symbol alpha="1" clip_to_extent="1" type="line" name="0">
				<layer pass="0" class="SimpleLine" locked="0">
					<prop k="capstyle" v="square"/>
					<prop k="customdash" v="5;2"/>
					<prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
					<prop k="customdash_unit" v="MM"/>
					<prop k="draw_inside_polygon" v="0"/>
					<prop k="joinstyle" v="bevel"/>
					<prop k="line_color" v="254,254,254,255"/>
					<prop k="line_style" v="solid"/>
					<prop k="line_width" v="0.26"/>
					<prop k="line_width_unit" v="MM"/>
					<prop k="offset" v="0"/>
					<prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
					<prop k="offset_unit" v="MM"/>
					<prop k="use_custom_dash" v="0"/>
					<prop k="width_dd_active" v="1"/>
					<prop k="width_dd_expression" v="to_real(&quot;ErMapperSiz&quot;)/2"/>
					<prop k="width_dd_field" v=""/>
					<prop k="width_dd_useexpr" v="1"/>
					<prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
				</layer>
			</symbol>
			<symbol alpha="1" clip_to_extent="1" type="line" name="1">
				<layer pass="0" class="SimpleLine" locked="0">
					<prop k="capstyle" v="square"/>
					<prop k="customdash" v="5;2"/>
					<prop k="customdash_map_unit_scale" v="0,0,0,0,0,0"/>
					<prop k="customdash_unit" v="MM"/>
					<prop k="draw_inside_polygon" v="0"/>
					<prop k="joinstyle" v="bevel"/>
					<prop k="line_color" v="255,128,0,255"/>
					<prop k="line_style" v="solid"/>
					<prop k="line_width" v="0.26"/>
					<prop k="line_width_unit" v="MM"/>
					<prop k="offset" v="0"/>
					<prop k="offset_map_unit_scale" v="0,0,0,0,0,0"/>
					<prop k="offset_unit" v="MM"/>
					<prop k="use_custom_dash" v="0"/>
					<prop k="width_dd_active" v="1"/>
					<prop k="width_dd_expression" v="to_real(&quot;ErMapperSiz&quot;)/2"/>
					<prop k="width_dd_field" v=""/>
					<prop k="width_dd_useexpr" v="1"/>
					<prop k="width_map_unit_scale" v="0,0,0,0,0,0"/>
				</layer>
			</symbol>
		</symbols>
	</renderer-v2>
</qgis>
