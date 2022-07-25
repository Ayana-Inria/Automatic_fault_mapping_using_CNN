Algorithm Begin
	Version		= "7.1"
	Name		= "GraniteDells_UTM12N_ISA-100322"
	Description	= "Algorithm Not Yet Saved"
	Author		= "ER Mapper"
	ViewMode	= Planimetric2D
	LastUpdated	= Thu Mar 10 16:31:32 GMT 2022
	BackGroundColourSet	= No
	BackGroundColour	= 0,0,0
	ConvertToGreyscale	= No
	CoordinateSpace Begin
		Datum		= "WGS84"
		Projection	= "NUTM12"
		CoordinateType	= EN
		Units		= "meters"
		Rotation	= 0:0:0.0
	CoordinateSpace End
	TopLeftCorner Begin
		Eastings	= 369656.82666167617
		Northings	= 3829059.2358518476
	TopLeftCorner End
	BottomRightCorner Begin
		Eastings	= 369766.49117021542
		Northings	= 3828995.6133315135
	BottomRightCorner End
	MosaicType	= Overlay
	PageSize Begin
		PageConstraint	= None
		PageWidth	= 8.5
		PageHeight	= 11
		TopBorder	= 0
		BottomBorder	= 6.0686741768766712
		LeftBorder	= 0
		RightBorder	= 0
		Scale		= 507.94121602247333
		PageExtents Begin
			TopLeftCorner Begin
				Eastings	= 369656.82666167617
				Northings	= 3829059.2358518476
			TopLeftCorner End
			BottomRightCorner Begin
				Eastings	= 369766.49117021542
				Northings	= 3828917.3170760907
			BottomRightCorner End
		PageExtents End
		ContentExtents Begin
			TopLeftCorner Begin
				Eastings	= 369656.82666167617
				Northings	= 3829059.2358518476
			TopLeftCorner End
			BottomRightCorner Begin
				Eastings	= 369766.49117021542
				Northings	= 3828995.6133315135
			BottomRightCorner End
		ContentExtents End
	PageSize End
	Surface Begin
		Name		= "Airborne_Lidar"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Lidar"
			Dataset		= "Airborne_Lidar\DEM_Lidar_GD_UTM12.ers"
			DoStaticShade	= No
			SunAzimuth	= 246:2:15.036247599
			SunAngle	= 52:16:51.476574799
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 212.75865173339844
					MaximumValue	= -2.2737367544323206E-013
					CellsBelowMin	= 1
					CellsAboveMax	= 0
					NrOfCells	= 2546791
					Bins		= {
						0	0	0	0	277	1089	1419	1412	5297	10079	
						7303	5615	8183	8960	8628	8783	10043	11338	15581	18553	
						19089	20130	21137	21590	23333	24260	24508	28640	29201	28216	
						28645	26685	25132	24937	25672	27136	29651	30291	134279	63401	
						58955	55109	104075	62992	61888	61429	60993	61348	60759	60403	
						57949	57102	57909	55311	51007	47953	46624	43428	40760	38773	
						36861	32752	29721	27158	24508	24033	22973	21989	21752	20648	
						17897	16248	15300	16070	12976	12453	11362	10468	9961	9009	
						8964	8081	7911	8045	7997	7314	7056	6447	6093	5674	
						5279	4999	4722	4409	4170	4001	3962	3833	3536	3498	
						3250	3168	3007	2958	2880	2809	2684	2583	2422	2377	
						2348	2361	2298	2292	2268	2120	2116	1950	1922	1876	
						1767	1752	1675	1576	1489	1412	1346	1267	1193	1194	
						1193	1180	1126	1049	1030	974	889	804	696	709	
						630	596	586	582	523	483	433	464	510	535	
						553	598	660	691	712	732	748	730	757	758	
						660	687	667	658	637	661	636	714	684	672	
						623	625	660	621	594	624	654	674	650	689	
						669	663	668	685	661	643	722	697	691	695	
						660	560	547	528	510	451	465	421	392	392	
						349	310	305	244	163	165	156	147	132	129	
						98	63	36	2	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "FaillLaure&ProfilsDensite"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Loc Fig AGU2018"
			Dataset		= "Carto_failles_Isabelle\Carto figures AGU 2018\Granite-AllFigureLocations-Isa131118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "2-ProfilsDensiteBallonW"
			Dataset		= "ProfilsDensite_BallonWest_Alexandre-Merged\profils_DensiteVisuelle_Alex_BallonOuest_180718.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "1-ProfilsDensiteBallonW"
			Dataset		= "ProfilsDensite_BallonWest_Alexandre-Merged\profils_DensiteVisuelle_Alex_BallonOuest_160718white.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Bande2DensiteIN_EW"
			Dataset		= "Carto_failles_Isabelle\GraniteDells_Pleiades-ProfilsDensiteInner_EW_Isa180618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "ProfilsPleiadesBande1-e"
			Dataset		= "Profils densite Pleiades bande 1 (West-Failles N30)\Profil_Swath5(profil1)_BandeOuest1a.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "ProfilsPleiadeBande1-d"
			Dataset		= "Profils densite Pleiades bande 1 (West-Failles N30)\Profil_Swath4(4to2)_BandeOuest1a.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "ProfilsPleiadeBande1-c"
			Dataset		= "Profils densite Pleiades bande 1 (West-Failles N30)\Profil_Swath3(7to5)_BandeOuest1a.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "ProfilsPleiadesBande1-b"
			Dataset		= "Profils densite Pleiades bande 1 (West-Failles N30)\Profil_Swath2(10to8)_BandeOuest1a.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "ProfilsPleiadeBande1-a"
			Dataset		= "Profils densite Pleiades bande 1 (West-Failles N30)\Profil_Swath1(Profils12&11)_BandeOuest1a.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Bandes1DensiteIN_NS"
			Dataset		= "Carto_failles_Isabelle\GraniteDells_Pleiades-Bande1a_DensiteInnerFaillesN30_Isa020718.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "carto Laure photogram sol"
			Dataset		= "Carto_failles_LS\CartoFailles_GraniteDells_PhotogrammetrieGD1_LS_300318.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "CartoFailles_LS_Balloon"
			Dataset		= "Carto_failles_LS\CartoFailles_GraniteDells_Balloon_LS_060318.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
	Surface End
	Surface Begin
		Name		= "Zones OK ou pas Drone"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= DynamicLink
			Description	= "Sites faits Nov2018"
			Dataset		= "Sites Terrain\Sites_done-Nov18.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Vol drone 100m"
			Dataset		= "Sites Terrain\PrioritySitesDrone_100mIsa-121118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Vol drone 30m"
			Dataset		= "Sites Terrain\PrioritySitesDrone_30mIsa-121118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Priority Sites drone Isa (100m alt)"
			Dataset		= "Sites Terrain\PrioritySites_drone-SuggestionsIsa-091118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "All Sites drone Isa (100m alt)"
			Dataset		= "Sites Terrain\AllSites_drone-SuggestionsIsa-091118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "TransectsFract_Laure"
			Dataset		= "Sites Terrain\Transects_Fracturation_GraniteDells-SuggestionsLaure.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Sites drone-Laure"
			Dataset		= "Sites Terrain\Sites_drone-SuggestionsLaure.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Zones Drone OK"
			Dataset		= "Sites Terrain\zones_VolDronePossible_GraniteDells_291018.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Roads"
			Dataset		= "Sites Terrain\Roads_GraniteDells_blue_091118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Habitations(No drone)"
			Dataset		= "Sites Terrain\Habitations_DroneInterdit.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= Pseudo
			Description	= "Pseudo Layer"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "cartos pour figures projets"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= DynamicLink
			Description	= "3-NS_SsSTOuestPink"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_SousSystemesWestPinkpourFIGURE-140419.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "2-NS_SsSTPink"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_ISA-SsSYST_NS_Pink-PourFIGURE140419.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= Pseudo
			Description	= "Pseudo Layer"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Carto-ISA-PLEIADE"
		TurnedOff	= Yes
		Transparency	= 1
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= DynamicLink
			Description	= "Boites test deep learning"
			Dataset		= "Zones test deep learning Pleiades\GraniteDells-ZoneTestDeepLearningPleiades.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(Bande1DensiteIN_NS"
			Dataset		= "Carto_failles_Isabelle\GraniteDells_Pleiades-ProfilsDensiteInner_Isa110618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(Boites densite Pleiades"
			Dataset		= "Carto_failles_Isabelle\GraniteDells_Boites-densite-Pleiades-Isa040618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "3-FaillEW_simplifie_AGU"
			Dataset		= "Carto_failles_Isabelle\Carto figures AGU 2018\Granite-ZoomPleiades_EW-avecFailles-Isa131118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "2-FaillNS_simplifie_AGU"
			Dataset		= "Carto_failles_Isabelle\Carto figures AGU 2018\Granite-ZoomPleiades_NS-avecFailles-Isa131118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "decalages lateraux"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesEWPleiades-LateralOffsets-Isa_100418_shifted.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Inner Width EW Pleiades"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_ISA-INNER_PleiadesEW-120618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Inner Width NS Pleiades"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_ISA-INNER_PleiadesNS-090618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "4-FaillBANDE1_NS"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesNSMajeures-BANDE1-Isa071118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "2-FaillGen_NS_GdeEchelle"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesNSGeneral-GdeEchellePleiades-ISA_091118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(FaillCoul_NS_GdeEchelle"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesNS_Couleur-GdeEchelle-ISA_210518_shifted.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "1b-FaillGen_NS_GdeEchelle"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesNS_GdeEchellePleiades_3_ISA_040718.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "1-FaillGen_NS_GdeEchelle"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesNSGeneral-GdeEchellePleiades-ISA_090618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "3-FaillesEW_Individual"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesEWPleiades-Individual Faults-Isa_121118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "3-FaillesEW_Gds systemes"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesEWPleiades-Gds systemes-Isa_120618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(2-FaillesEW_PteEchelle_Isa_010318"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesEW-Pte echelle Isa_060418_essai2_shifted.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(1-FaillesEW_PteEchelle_Isa_010318"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesEW-Pte echelle Isa_060418_essai1_shifted.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(Failles_PasOK_GdeEchelle_Isa_260218"
			Dataset		= "Carto_failles_Isabelle\granite_dells_FaillesEW-GdeEchelle-ISA_260218_shifted.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
	Surface End
	Surface Begin
		Name		= "Carto Pleaides Antoine"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= DynamicLink
			Description	= "Carto boites Antoine"
			Dataset		= "Antoine Mercier\Carto Antoine-081019\antoine_GD-Zones_test_deep_learning_pleiade_08102019\antoine_cartography_zoneTestDeepLearningPleiades_08102019.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
	Surface End
	Surface Begin
		Name		= "ISA_SYST-Ballon&Photogram"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Faults simplified2-AGU-2"
			Dataset		= "Carto_failles_Isabelle\Carto figures AGU 2018\Granite-ZoomBallon2-avecFailles-Isa131118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Faults simplified1-AGU-2018"
			Dataset		= "Carto_failles_Isabelle\Carto figures AGU 2018\Granite-ZoomBallon1-avecFailles-Isa131118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Main faults vs density"
			Dataset		= "Carto_failles_Isabelle\granite_dells_BallonOuest-MainFaults-vs-Density-Isa071118.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Main Faults SsST simplifies"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_ISA-MainFaultsSsSYST-250518.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "3-NS_SsSTOuestPink"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_SousSystemesWestPink-120618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "2-NS_SsSTPink"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_ISA-SsSYST_NS_Pink-250518.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "1_Bal-NS_SsSTCyanJaun"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_SousSystemesJaune&Cyan-230518.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "1_All-NS_SsSTCyanJaun"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon&Photogram_SousSystemesJaune&Cyan-150518.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Faill Photog SYST encours"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon&Photogram_SYST_NS-ISA_encours-080518.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "NS_SsST_simplifies"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon&Photogram_SousSystemesSimplifies-250518.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "BallGdsSystEW simplifies"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon&Photogram_GdsSystEWsimplifies-200418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "BallGdsSystNS simplif"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon&Photog_GdsSystNSsimplifies_2-180418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "BalGdsSystEW Isa(surOrthoSteh)"
			Dataset		= "Carto_failles_Isabelle\granite_dells_Failles-BallonEW prelim Isa_120618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Ex-NS-SsSTjaun&cyan"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Photogram&Ballon_SousSYST_Jaune&CyanNS-260418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Ex-LS photog sol revue ISA"
			Dataset		= "Carto_failles_LS\CartoFailles_GraniteDells_PhotogrammetrieGD1_LSrevuISA_020418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Ex-Failles_Ballon_Isa_010318"
			Dataset		= "Carto_failles_Isabelle\granite_dells_Failles-Ballon Isa_010318_shifted.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
	Surface End
	Surface Begin
		Name		= "ISA-INDIV-Ballon&Photogram"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "1-NS_INDIV_SsSTCyanJaun"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_Faill_INDIV1-SsSTJaune&Cyan-120618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "2-NS_INDIV_SsSTPink"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_ISA-FAILL_INDIV-1-SsSYST_NS_Pink-050618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "3-NS_INDIV_OuestPink"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_FailINDIV-1-WestPink-120618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Profils densite-RevuIsa"
			Dataset		= "Carto_failles_LS\Profils_densite_fracturation_LaureRevuIsa_070618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Profils densite-Laure"
			Dataset		= "Carto_failles_LS\Profils_densite_fracturation_Laure_060618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Inner width Ballon"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_ISA-INNER_BallonOuest-090618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Inner width Photogram"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_ISA-INNER_Photogram-090618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Faill Photog INDIV-Best"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_PhotogrammetrieGD1_FaillesLSrevuISA_Fail_INDIV-R1_Isa120618.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Faill Photog INDIV encours"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_PhotogrammetrieGD1_FaillesLSrevuISA_Fail_Indiv_encours-180418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Faill Photog F1F2-LS revu Isa"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_PhotogrammetrieGD1_LSrevuISA_F1F2-110418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "Faill Photog F2\"etc-LS revu Isa"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_PhotogrammetrieGD1_FaillesLSrevuISA_F2etc-130418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(Faill Photog F1F2-LS revu Isa"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_PhotogrammetrieGD1_LSrevuISA_F1F2-110418.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
	Surface End
	Surface Begin
		Name		= "GroundTruth-drone"
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "rgb"
		Stream Begin
			Type		= DynamicLink
			Description	= "1-NS_UPDATED"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_Faill_INDIV1-SsSTJaune&Cyan-UPDATED_090322.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "2-NS_UPDATED"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_ISA-FAILL_INDIV-1-SsSYST_NS_Pink-UPDATED-090322.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "3-NS_UPDATED"
			Dataset		= "Carto_failles_Isabelle\CartoFailles_GraniteDells_Ballon_FailINDIV-1-WestPink-UPDATED_100322.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "boite GT Isa 032022"
			Dataset		= "BoitesGroundTruthDrone_Isa_090322.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 0
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= Pseudo
			Description	= "Pseudo Layer"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "FaillFRED-BallonSE"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= DynamicLink
			Description	= "BallonSE-NSFred"
			Dataset		= "Failles-ballon-Est-Frederique-ErMapper\Failles_BallonEST_Fred_NS_UTM12b.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "BallonSE-EWFred"
			Dataset		= "Failles-ballon-Est-Frederique-ErMapper\Failles_BallonEST_Fred_EW_UTM12.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
	Surface End
	Surface Begin
		Name		= "DensiteFract_Alexandre"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Carte_densite_fracturation\CarteDensFract_Alexandre_BallonW_071118.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 34
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 1521
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	1	0	0	0	1	0	
						0	1	0	0	0	0	1	0	2	2	
						2	1	1	1	2	2	0	1	2	3	
						1	9	6	2	7	10	7	6	5	4	
						7	6	12	16	6	9	11	3	10	8	
						8	4	8	4	8	10	8	13	7	7	
						8	10	11	14	7	8	16	5	8	12	
						2	2	14	7	5	23	9	6	17	11	
						8	22	10	13	17	11	6	16	9	9	
						13	11	7	22	5	14	21	4	10	4	
						8	16	6	9	15	4	8	17	5	5	
						10	2	9	15	4	4	7	4	7	10	
						7	4	16	3	2	10	12	5	8	5	
						6	6	1	15	15	9	7	13	15	15	
						14	14	13	7	6	16	3	9	8	4	
						7	13	4	3	9	6	8	11	7	6	
						14	6	5	16	10	8	11	6	7	13	
						13	12	9	10	7	12	10	9	19	11	
						4	12	5	17	12	5	7	11	8	7	
						5	1	2	0	3	3	0	0	3	0	
						1	2	0	0	4	0	0	5	0	0	
						1	0	0	2	0	0	0	0	0	2	
						0	0	4	0	0	8	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Carte_densite_fracturation\CarteDensFract_Alexandre_BallonW_071118.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 46
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 1521
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	1	0	0	0	
						1	2	1	0	1	0	0	1	0	0	
						2	3	2	3	2	3	4	2	1	0	
						3	2	4	4	6	5	8	6	7	9	
						10	6	8	8	2	15	6	10	5	4	
						12	5	9	9	8	8	15	9	4	20	
						7	5	14	8	6	15	7	8	23	4	
						4	23	5	6	14	4	8	14	3	4	
						12	3	5	21	6	5	19	5	12	8	
						6	20	12	3	12	4	5	13	6	11	
						15	4	6	17	6	5	9	8	9	8	
						12	12	14	4	6	12	9	9	15	6	
						10	5	5	6	9	4	10	9	3	4	
						7	8	6	3	7	13	6	6	7	11	
						6	10	5	7	11	10	9	10	13	7	
						18	16	16	16	17	11	18	13	14	17	
						10	18	6	11	13	9	15	13	24	10	
						13	11	12	12	13	5	17	12	9	9	
						7	6	11	7	3	7	3	2	5	3	
						0	3	0	1	4	0	0	5	0	0	
						1	0	0	2	0	0	0	0	0	2	
						0	0	4	0	0	8	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Carte_densite_fracturation\CarteDensFract_Alexandre_BallonW_071118.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 42
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 1521
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	1	0	0	1	2	0	0	0	
						0	0	1	0	1	0	2	0	1	1	
						1	3	1	3	4	3	1	4	2	1	
						4	3	6	5	3	6	8	5	6	8	
						8	4	8	7	7	8	5	9	5	6	
						12	5	4	8	6	12	15	5	7	11	
						3	3	14	4	10	18	8	5	19	4	
						5	23	6	7	12	3	6	15	4	2	
						7	8	7	17	3	7	20	5	13	5	
						5	19	0	5	18	0	14	14	12	3	
						16	8	4	15	1	5	7	10	9	12	
						6	8	16	7	8	10	7	5	7	6	
						5	9	5	5	8	3	5	3	0	5	
						9	1	5	5	6	11	2	5	5	7	
						5	10	2	10	8	6	2	14	4	2	
						13	6	4	17	13	6	19	8	17	14	
						8	15	22	14	20	15	14	13	29	12	
						24	24	23	16	36	12	16	11	18	16	
						16	16	9	10	5	15	4	5	5	3	
						1	3	0	2	4	0	0	5	0	0	
						1	0	0	2	0	0	0	0	0	2	
						0	0	4	0	0	8	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "DensiteFract_Laure"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Carte_densite_fracturation\CarteDensFract_Laure_BallonW_071118.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 16
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2346170
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	1	1	1	1	
						4	1	6	5	7	7	12	20	31	35	
						54	49	75	77	112	105	151	194	254	292	
						354	442	499	666	745	916	1105	1286	1430	2071	
						2057	2477	2665	3265	3359	5047	4172	4888	6970	6258	
						7100	8615	8403	8736	11266	10076	11514	12363	12228	11968	
						14984	12738	14476	16305	13858	14094	17016	14378	13870	18108	
						13733	13968	17858	14523	13887	20193	14133	19873	13859	14209	
						21274	13622	14105	23485	13871	13226	24782	13055	13138	24900	
						13353	12814	26711	13624	13295	30147	13423	13114	31183	14115	
						13062	33485	13485	14788	31095	15315	14105	33597	14045	15841	
						32674	15415	13425	30359	12492	14563	28076	13081	24690	11301	
						11410	22015	10827	10034	19904	9241	9618	18850	9044	8608	
						18394	8187	8987	14890	8313	7893	15689	7787	8259	16261	
						8366	7856	15112	7867	9150	13850	9348	8444	17692	8697	
						9593	11232	9609	12654	16204	14142	11178	19564	11782	15515	
						17313	16406	17223	15981	11139	19902	10364	13989	13718	12738	
						8580	13885	10510	7941	13859	7596	10712	11064	10808	7809	
						14349	8177	11355	11554	11835	8328	14798	8004	11155	10535	
						11325	8047	11185	11475	8451	15420	9296	14488	12856	15703	
						11294	18407	11351	17755	10253	14384	10205	12335	7177	11397	
						5564	7590	4832	3587	4574	3461	2832	1416	3370	799	
						1139	1612	376	232	686	67	40	608	7	12	
						384	12	16	493	28	27	716	3	2	606	
						8	1	284	0	0	1659	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Carte_densite_fracturation\CarteDensFract_Laure_BallonW_071118.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 22
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2346170
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	1	2	2	2	0	1	2	1	
						1	4	1	6	11	8	19	37	27	63	
						68	112	137	199	246	245	505	491	512	843	
						792	925	1035	1175	1362	2313	1752	2032	3406	2568	
						2842	4354	3680	4147	5938	5040	5839	7137	6285	6726	
						9433	7657	8901	11865	9128	9707	12786	10977	10729	14930	
						11206	11603	16010	12538	12048	18521	12723	18662	12584	13547	
						20235	13025	13793	23256	13770	13211	24350	13167	12640	24933	
						12875	12471	25676	13061	12242	29980	11917	12304	30138	12090	
						11618	30672	11274	11498	28638	11292	11535	29129	11344	11241	
						29709	10912	11274	26487	11402	11450	27514	11044	24632	10953	
						11374	22350	11223	11036	21225	10634	11103	21491	10551	11249	
						19930	10747	10188	17380	9819	10466	17007	10342	10588	18601	
						10816	10020	17575	10030	11207	15735	11311	10009	18755	10083	
						11802	10325	12048	10246	17570	10395	11326	14902	9108	10643	
						14128	10190	13721	9210	7654	13883	7421	9390	11974	8108	
						9702	13040	10394	9954	14136	10957	12540	15290	13952	13126	
						18594	14365	16413	19094	17770	15375	21395	15709	18617	18352	
						14713	18256	16460	14707	16003	15984	15958	12414	18612	11948	
						16578	13398	16683	13306	16966	11346	17853	12246	16449	13294	
						15551	10828	14856	8841	7541	11620	5874	7455	5403	4945	
						2371	3995	1272	1583	1383	747	402	908	158	108	
						440	41	12	488	18	23	718	0	1	605	
						2	0	283	0	0	1659	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Carte_densite_fracturation\CarteDensFract_Laure_BallonW_071118.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 18
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2346170
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	1	1	
						1	0	2	0	4	4	0	2	2	3	
						6	8	8	17	24	29	53	54	83	132	
						184	211	240	404	416	470	699	666	791	1213	
						1163	1312	1354	1582	1847	2893	2302	2678	4044	3160	
						3615	5100	4435	4614	6676	5410	6316	7753	6800	7119	
						9610	7884	8855	11644	9015	9563	12321	10562	10043	14390	
						10528	10656	14701	11461	10979	17264	11345	17402	10993	11817	
						18623	11304	11529	21596	12014	11453	22548	11494	11223	23544	
						11335	11205	24325	11557	10810	28624	10557	11076	28507	10684	
						10142	29533	9900	10589	27079	10572	10121	28543	10096	10620	
						28149	9800	10834	25363	10524	10383	26705	10262	24574	10543	
						11991	21901	11982	10642	22649	10912	13401	21288	12999	11333	
						22571	11432	11719	19587	11228	12312	17645	11915	10079	19092	
						9618	10300	16459	9933	9644	15036	9118	8898	16197	8258	
						8556	8093	8156	7401	13553	7328	7202	11860	7129	6461	
						12367	6932	12493	6523	6807	11586	6550	7245	10971	7711	
						6960	12527	7328	8991	10510	9643	7765	13684	8469	11137	
						12246	11527	10187	15882	11166	13839	15050	13186	15006	16903	
						16009	13664	20582	13987	20723	17566	22394	15915	26017	16546	
						25029	18803	24067	21390	25164	20062	28095	19752	21512	25293	
						20251	20507	15428	20072	11585	17314	8552	11030	7419	7049	
						3489	5238	2229	2157	1663	987	546	1049	202	192	
						448	73	16	490	13	2	714	0	0	600	
						0	0	283	0	0	1659	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Fracturation_zones+grille"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "rgb"
		Stream Begin
			Type		= DynamicLink
			Description	= "Fract_Benchmark5"
			Dataset		= "Fracturation\Carto-fractures_ISA-Benchmark5_030419.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "Fract_Benchmark4"
			Dataset		= "Fracturation\Carto-fractures_ISA-Benchmark4_210319.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "Fract_Benchmark3"
			Dataset		= "Fracturation\Carto-fractures_ISA-Benchmark3_060219.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "Fract_Benchmark2"
			Dataset		= "Fracturation\Carto-fractures_ISA-Benchmark2_060219.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			Type		= DynamicLink
			Description	= "Fract_Benchmark1"
			Dataset		= "Fracturation\Carto-fractures_ISA-Benchmark1_090519.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "ZonesVeriteTerrain2_lionel"
			Dataset		= "Fracturation\Zone_carto-fractures_22022019.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "ZonesVeriteTerrain1 Lionel"
			Dataset		= "Fracturation\Zones_carto-fractures_Lionel-310119.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(Fracturation ex1"
			Dataset		= "Carto_failles_Isabelle\CartoFractures-Isa&Laure-280918.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(Zones_cartoFractures"
			Dataset		= "Fracturation\Zones_carto-fractures_181018.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= DynamicLink
			Description	= "(Grille"
			Dataset		= "Fracturation\Grille_carto-fractures_181018.erv"
			FilterProgramName	= "ermps_ervec"
			LinkType	= TrueColour
			FileExtent	= ".erv $$ALG"
			CanEdit		= Yes
			EditProgram	= "erm_vec"
			RGBcolour Begin
				Red			= 65279
				Green		= 65279
				Blue		= 65279
			RGBcolour End
		Stream End
	Surface End
	Surface Begin
		Name		= "Photogram_D8S7_ortho"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			TurnedOff	= Yes
			Type		= Pseudo
			Description	= "Pseudo Layer"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Photogram_GD1_Couleur"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Photogrammetrie\GD1_ortho_ultra_high_quality_fixed_balloon.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 30
				MaximumInputValue	= 200
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 239
					MaximumValue	= 0
					CellsBelowMin	= 134568
					CellsAboveMax	= 767
					NrOfCells	= 2535306
					Bins		= {
						7441	7572	0	7842	8121	0	8476	0	0	8615	
						9119	0	9359	9409	0	9808	10199	0	10493	10712	
						0	11172	11664	0	0	11509	0	12157	12690	0	
						12898	13003	0	13397	13809	0	14252	14508	0	15205	
						15300	0	0	15994	0	16261	16672	0	16923	17599	
						0	17885	18250	0	18443	19139	0	19326	0	0	
						19715	20255	0	20532	21088	0	21855	21674	0	22388	
						22511	0	23048	23641	0	0	23760	0	24585	24677	
						0	25370	25863	0	25531	26232	0	26173	26589	0	
						26835	0	0	27231	27529	0	27941	28162	0	28310	
						28577	0	28636	29001	0	28900	28996	0	29277	0	
						0	29093	29162	0	29473	29453	0	29563	29590	0	
						29472	29413	0	28924	29059	0	0	0	28757	28785	
						28487	0	28250	27628	0	27375	27056	0	27026	26750	
						0	26205	0	0	25644	25320	0	24794	24079	0	
						23628	22583	0	22105	21751	0	20655	20380	0	19776	
						0	0	19172	18237	0	17611	16745	0	16286	15572	
						0	14757	14063	0	13427	12834	0	0	12131	0	
						11601	10869	0	10207	9673	0	9225	8520	0	8026	
						7537	0	7119	0	0	6469	6177	0	5748	5372	
						0	4921	4518	0	4134	3794	0	3406	3236	0	
						2971	0	0	2648	2606	0	2218	1948	0	1883	
						1645	0	1533	1310	0	1190	1047	0	0	939	
						0	863	709	0	614	620	0	496	453	0	
						408	385	0	315	0	0	315	240	0	251	
						188	0	178	139	0	132	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Photogrammetrie\GD1_ortho_ultra_high_quality_fixed_balloon.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 30
				MaximumInputValue	= 200
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 232
					MaximumValue	= 0
					CellsBelowMin	= 147832
					CellsAboveMax	= 560
					NrOfCells	= 2535306
					Bins		= {
						7726	0	0	8027	8479	0	8456	8816	0	9032	
						9267	0	9611	9553	0	9994	10362	0	0	10708	
						0	11166	11337	0	11432	11710	0	12157	12352	0	
						12738	13146	0	0	13468	0	13765	13774	0	14335	
						14674	0	14927	15262	0	15730	16110	0	16424	0	
						0	16868	17421	0	17672	17911	0	18091	18763	0	
						18955	19560	0	19777	0	0	20290	20635	0	20979	
						21748	0	22022	22434	0	22544	23121	0	23585	0	
						0	23896	23952	0	24641	24671	0	25039	25596	0	
						26033	26196	0	26549	26705	0	0	26835	0	27033	
						27604	0	27954	28069	0	27997	28455	0	28763	28691	
						0	0	28851	0	28892	28859	0	29216	29166	0	
						28926	28846	0	29138	28859	0	29020	0	0	28852	
						28880	0	28734	28773	0	28318	28194	0	27835	27582	
						0	26936	0	0	26900	26590	0	26169	25431	0	
						24979	24282	0	23913	23305	0	22545	0	0	22019	
						21438	0	20639	19880	0	19217	18601	0	17475	17301	
						0	16345	15175	0	0	14569	0	14105	13383	0	
						12633	11915	0	11225	10500	0	9867	9380	0	0	
						8799	0	8179	7519	0	7147	6740	0	6158	5748	
						0	5206	4786	0	4381	0	0	3995	3676	0	
						3392	2936	0	2706	2376	0	2187	1890	0	1736	
						0	0	1452	1397	0	1219	1147	0	914	876	
						0	723	660	0	559	514	0	0	495	0	
						359	349	0	298	247	0	204	193	0	140	
						161	0	0	111	0	88	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Photogrammetrie\GD1_ortho_ultra_high_quality_fixed_balloon.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 40
				MaximumInputValue	= 190
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 239
					MaximumValue	= 0
					CellsBelowMin	= 172161
					CellsAboveMax	= 3265
					NrOfCells	= 2535306
					Bins		= {
						7645	0	7899	8011	0	8167	0	8498	8744	0	
						8949	0	0	0	9147	9405	0	9586	0	9845	
						9890	0	10651	0	10602	10748	0	11175	0	11297	
						0	0	11570	0	11730	0	12111	12429	0	12641	
						0	13176	13479	0	13729	0	13998	0	14213	0	
						0	14588	0	14848	15103	0	15437	0	15924	16274	
						0	16614	0	16985	0	17571	17803	0	0	0	
						17995	18443	0	18602	0	19130	19689	0	20027	0	
						20246	0	20900	21203	0	21690	0	22116	0	0	
						22221	0	22626	23236	0	23834	0	23939	0	24267	
						24585	0	24859	0	25332	25480	0	0	0	26212	
						26242	0	26413	0	26897	0	27237	27664	0	27582	
						0	28131	28129	0	28593	0	0	0	28585	28972	
						0	28984	0	29356	29219	0	29595	0	29328	29640	
						0	29527	0	29607	29486	0	0	0	29744	0	
						29410	29650	0	29220	0	29049	29004	0	29123	0	
						28526	28226	0	27422	0	0	0	27136	26605	0	
						26622	0	25672	25358	0	24532	0	23798	23246	0	
						22688	0	21739	0	0	21016	0	20024	0	19423	
						18458	0	17722	0	16875	16133	0	15394	0	14538	
						0	13684	0	0	12936	0	11874	11092	0	10245	
						0	9585	9029	0	8206	0	7605	0	7264	6502	
						0	5758	0	0	5333	0	4969	0	4248	3913	
						0	3572	0	3140	0	2833	2450	0	2138	0	
						1963	0	0	1774	0	1495	1289	0	1218	0	
						940	0	828	728	0	615	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Photogram_GD1-Ortho-NB"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "Photogrammetrie\GD1_ortho_ultra_high_quality_fixed_balloon.ers"
			DoStaticShade	= No
			SunAzimuth	= 260:32:15.596615928
			SunAngle	= 78:21:7.785954609
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 40
				MaximumInputValue	= 200
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 172
					MaximumValue	= 4
					CellsBelowMin	= 6
					CellsAboveMax	= 0
					NrOfCells	= 66
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	1	0	0	0	0	0	
						0	0	0	0	0	1	0	0	0	0	
						0	0	0	1	0	0	0	0	0	0	
						0	1	0	1	0	1	0	0	0	0	
						0	1	0	3	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	1	
						0	0	2	0	0	0	0	0	2	0	
						0	2	0	0	0	0	0	0	1	1	
						0	2	0	0	0	0	1	1	0	0	
						0	0	1	0	0	2	0	1	0	0	
						0	0	0	0	0	0	1	0	0	0	
						2	0	0	1	1	0	1	0	0	1	
						0	3	0	0	0	2	0	0	0	3	
						0	0	1	0	0	0	0	1	0	0	
						0	0	0	0	0	0	0	0	1	0	
						0	0	0	0	1	0	0	0	0	1	
						0	1	0	0	0	0	0	0	1	0	
						0	0	0	2	0	1	0	0	0	0	
						0	0	0	2	0	0	1	0	2	0	
						0	2	0	0	0	0	0	0	0	0	
						1	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Photogram_GD1-DEM"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Photogrammetrie_GD1_DEM"
			Dataset		= "Photogrammetrie\GD1_DEM_ultra_high_quality_fixed_balloon.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 296:33:54.188960163
			SunAngle	= 34:20:10.276151296
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0.22420045733451843
				MaximumInputValue	= 254.22930908203125
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 254.11721801757813
					MaximumValue	= 0.26623803377151489
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 153169
					Bins		= {
						6	65	123	169	156	126	125	124	135	160	
						202	255	277	229	222	281	298	386	388	372	
						328	316	296	320	313	304	314	335	362	392	
						467	478	532	591	781	904	886	863	921	892	
						905	821	792	806	752	794	813	799	723	733	
						754	869	1195	994	829	857	789	826	830	833	
						855	881	741	676	614	604	553	526	544	678	
						734	669	682	703	654	699	697	692	652	679	
						615	713	688	628	620	753	739	862	653	746	
						772	757	793	678	599	642	685	725	634	561	
						643	677	687	816	750	703	723	785	842	1160	
						1017	1037	945	1019	949	851	719	774	734	668	
						664	680	868	725	686	626	654	770	787	823	
						840	825	826	848	984	1095	1245	1040	1300	1043	
						776	777	642	643	595	593	519	503	552	543	
						577	704	788	1056	887	621	584	715	800	933	
						1099	1867	3332	2270	1936	1528	1294	1480	1283	1114	
						1002	920	918	871	780	662	656	605	703	725	
						872	901	1411	1072	816	677	689	570	525	516	
						549	575	560	501	467	510	417	323	300	301	
						280	291	280	314	331	313	315	308	307	302	
						250	273	274	268	263	259	301	297	318	251	
						200	146	153	143	115	130	131	90	74	79	
						72	67	84	77	87	89	94	101	107	121	
						157	169	117	105	105	133	123	90	79	43	
						29	11	5	8	1	2	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "[Ortho_Balloon_Lionel_Best-Original"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_Ultra_High_Quality_Holes_filled_fixed_pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 43
				MaximumInputValue	= 215
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 228
					MaximumValue	= 45
					CellsBelowMin	= 0
					CellsAboveMax	= 312
					NrOfCells	= 1076747
					Bins		= {
						0	0	0	1	1	0	2	0	0	0	
						2	0	0	1	0	4	6	0	5	4	
						0	17	17	0	15	19	0	28	38	0	
						30	48	0	57	61	0	81	91	0	92	
						133	0	170	194	203	0	254	323	0	358	
						464	0	508	595	0	734	786	0	885	1036	
						0	1233	1333	0	1367	1609	0	1561	1737	0	
						2003	2068	0	2279	2373	0	2418	2773	0	3018	
						3163	0	3379	3380	0	3496	3530	3569	0	4001	
						4163	0	4254	4341	0	4621	4374	0	4385	4607	
						0	4565	4699	0	4796	4801	0	4941	4960	0	
						4920	4813	0	4967	5122	0	5150	5228	0	5419	
						5568	0	5870	5908	0	6200	6140	0	6595	6595	
						6854	0	7002	7040	0	7243	7339	0	7441	7624	
						0	7658	7950	0	8030	7952	0	7925	8011	0	
						8216	8176	0	8278	8294	0	8526	8519	0	8646	
						9109	0	9229	9363	0	9456	9732	0	9734	10025	
						10100	0	10354	10671	0	10870	11332	0	11315	11740	
						0	11876	12346	0	12496	12691	0	13284	13529	0	
						13672	14298	0	14835	15188	0	15498	15917	0	16488	
						16558	0	16611	17197	0	16839	17266	0	17202	17437	
						0	17110	17242	16858	0	16693	16410	0	16346	16273	
						0	15347	14602	0	14121	13058	0	12265	11155	0	
						10476	9819	0	9136	8261	0	7812	7036	0	6128	
						5434	0	4524	3821	0	2975	2235	0	1631	1261	
						0	806	505	0	330	228	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Ballon_LIONEL AJUSTE Dominguez"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_Ultra_High_Quality_Holes_filled_fixed_dominguez2.ers"
			DoStaticShade	= No
			SunAzimuth	= 64:26:24.141827478
			SunAngle	= 41:10:46.550299805
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 60
				MaximumInputValue	= 215
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 253
					MaximumValue	= 4
					CellsBelowMin	= 8005
					CellsAboveMax	= 705
					NrOfCells	= 213439
					Bins		= {
						628	0	691	722	0	779	0	779	837	0	
						882	0	931	975	0	1039	979	0	1016	0	
						1071	1118	0	1140	0	1167	1198	0	1208	0	
						1299	1240	0	1308	0	1350	1342	0	1338	1376	
						0	1439	0	1409	1405	0	1430	0	1443	1357	
						0	1379	0	1410	1406	0	1455	0	1424	1527	
						0	1478	0	1465	1436	0	1479	1470	0	1475	
						0	1532	1470	0	1478	0	1485	1508	0	1479	
						0	1357	1490	0	1451	0	1470	1391	0	1520	
						1402	0	1485	0	1483	1476	0	1504	0	1439	
						1447	0	1488	0	1478	1486	0	1578	0	1558	
						1472	0	1561	0	1553	1588	0	1554	1598	0	
						1566	0	1609	1624	0	1648	0	1646	1691	0	
						1688	0	1598	1724	0	1782	0	1755	1789	0	
						1813	1861	0	1843	0	1844	1830	0	1819	0	
						1900	1825	0	1886	0	1934	1862	0	1910	0	
						1946	1897	0	1934	0	1931	1979	0	1945	1971	
						0	1936	0	1980	1959	0	1855	0	1853	1843	
						0	1836	0	1840	1765	0	1776	0	1726	1691	
						0	1703	1668	0	1512	0	1513	1449	0	1400	
						0	1308	1226	0	1232	0	1163	1177	0	1073	
						0	1012	947	0	898	0	899	786	0	768	
						703	0	690	0	678	626	0	558	0	494	
						483	0	422	0	387	353	0	313	0	279	
						300	0	260	227	0	202	0	177	156	0	
						145	0	132	109	0	110	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Ballon_LIONEL"
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "rgb"
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_Ultra_High_Quality_Holes_filled_fixed_dominguez2.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 60
				MaximumInputValue	= 210
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 5
					MaximumValue	= 254
					CellsBelowMin	= 63286
					CellsAboveMax	= 3894
					NrOfCells	= 2965100
					Bins		= {
						6549	0	7179	7681	0	8157	0	8904	9300	0	
						10096	0	10506	0	11123	11867	0	12481	0	12842	
						13680	0	14171	0	14451	15006	0	15581	0	16172	
						0	16328	16871	0	17289	0	17706	17983	0	18458	
						0	18942	19192	0	19351	0	19806	0	20002	20058	
						0	20292	0	20142	20290	0	20195	0	20569	20402	
						0	20750	0	20559	0	20522	20671	0	20680	0	
						20684	21140	0	20900	0	21130	21254	0	20886	0	
						21221	0	21466	21271	0	21606	0	21448	21844	0	
						22199	0	22061	21977	0	22175	0	22527	0	22316	
						22281	0	22731	0	22886	23121	0	23324	0	23072	
						23673	0	23840	0	24032	0	24622	24669	0	25350	
						0	25483	26351	0	26535	0	26956	0	27299	27714	
						0	28310	0	29020	28983	0	29843	0	30258	30764	
						0	31521	0	31727	31882	0	32749	0	33033	0	
						33731	34311	0	34574	0	34909	34706	0	35080	0	
						35041	35118	0	34895	0	34572	0	34082	33690	0	
						33235	0	32710	31616	0	30956	0	29997	29042	0	
						28147	0	27058	0	25715	24794	0	24085	0	22801	
						21747	0	20463	0	19567	18547	0	17587	0	16513	
						0	15682	14664	0	13927	0	13159	12597	0	11439	
						0	10702	10064	0	9382	0	8851	0	8090	7464	
						0	6939	0	6339	6006	0	5449	0	5083	4705	
						0	4322	0	4003	0	3526	3238	0	2961	0	
						2708	2347	0	2093	0	1958	1757	0	1522	0	
						1443	0	1254	1099	0	920	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_Ultra_High_Quality_Holes_filled_fixed_dominguez2.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 60
				MaximumInputValue	= 189
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 1
					MaximumValue	= 254
					CellsBelowMin	= 101167
					CellsAboveMax	= 31292
					NrOfCells	= 2965094
					Bins		= {
						10220	0	11002	0	11649	0	12322	0	13043	0	
						13615	0	14195	0	14806	0	15405	0	15844	0	
						16553	0	16947	0	17563	0	18172	0	18769	0	
						18856	0	19644	0	19987	0	20200	0	20335	0	
						20617	0	20812	20911	0	21550	0	21569	0	22150	
						0	22101	0	21759	0	21697	0	22081	0	21753	
						0	21655	0	21969	0	21828	0	21816	0	21806	
						0	22032	0	21828	0	21839	0	21901	0	22273	
						0	21847	0	22561	0	22676	0	22837	0	22895	
						0	23623	0	23576	0	23926	0	24380	0	24322	
						0	24939	0	25076	0	25443	0	25970	0	26053	
						0	26484	0	26959	0	27425	0	27816	0	28443	
						0	28836	0	28984	0	29724	0	30094	30120	0	
						30999	0	31492	0	32329	0	32224	0	32972	0	
						33849	0	34219	0	34263	0	35259	0	35647	0	
						35732	0	36176	0	36558	0	36398	0	36064	0	
						36115	0	35746	0	35696	0	34952	0	34139	0	
						33798	0	32741	0	32062	0	31081	0	30184	0	
						29378	0	27829	0	27204	0	25997	0	24972	0	
						24366	0	23669	0	22512	0	21759	0	21102	0	
						20153	0	19407	0	18750	0	17852	0	17070	0	
						16352	0	15541	14916	0	14102	0	13501	0	12553	
						0	11979	0	11296	0	10537	0	10183	0	9639	
						0	8890	0	8415	0	7991	0	7447	0	7039	
						0	6476	0	6049	0	5472	0	5119	0	4575	
						0	4262	0	3956	0	3547	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_Ultra_High_Quality_Holes_filled_fixed_dominguez2.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 60
				MaximumInputValue	= 218
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 2
					MaximumValue	= 254
					CellsBelowMin	= 75771
					CellsAboveMax	= 3440
					NrOfCells	= 2965090
					Bins		= {
						7274	0	7781	8229	0	8654	9253	0	9691	0	
						10049	10591	0	11123	0	11846	12119	0	12454	13035	
						0	13383	0	13633	14224	0	14446	14713	0	15091	
						0	15533	15603	0	15830	0	15962	16283	0	16462	
						16837	0	17195	0	17209	17505	0	17728	17749	0	
						17762	0	18012	17830	0	18126	18132	0	18138	0	
						18171	18174	0	18214	0	18119	18002	0	18074	17917	
						0	17895	0	18059	17949	0	18048	17680	0	17985	
						0	18313	18160	0	18038	0	18047	18154	0	18257	
						18286	0	18341	0	18488	18358	0	18831	18735	0	
						18713	0	19120	19209	0	19662	0	19467	19682	0	
						19803	19842	0	20240	0	20525	20848	0	20875	21381	
						0	21778	0	22125	22212	0	22677	0	22953	23619	
						0	23898	24241	0	24706	0	24929	25572	0	25752	
						26524	0	26635	0	26966	27789	0	28082	28599	0	
						28928	0	29343	29947	0	29949	0	31011	31274	0	
						31732	32427	0	32450	0	32956	32967	0	33090	33287	
						0	33530	0	33545	33529	0	33742	0	33293	33134	
						0	32340	32018	0	31339	0	30764	29703	0	29116	
						27930	0	26533	0	25281	24074	0	22539	0	21096	
						19879	0	18794	17653	0	16747	0	15595	14409	0	
						13805	12812	0	11813	0	11155	10228	0	9755	8728	
						0	8201	0	7358	6849	0	6188	0	5458	4891	
						0	4440	3919	0	3553	0	3193	2865	0	2523	
						2239	0	2051	0	1848	1695	0	1413	0	1238	
						1089	0	951	809	0	664	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "DEM_Ballon_LIONEL ajuste Dominguez"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Dsm_Ultra_High_Quality_Holes_filled_fixed_dominguez2.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 292:46:29.896753041
			SunAngle	= 35:7:13.09286057
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= -1.8189894035458565E-012
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= -1.8189894035458565E-012
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 790793
					Bins		= {
						453	324	371	348	326	388	382	322	253	259	
						233	212	520	453	517	464	436	613	821	1148	
						1534	2060	1834	1442	1257	1225	1414	1589	1613	1547	
						1488	1487	1629	1561	1684	1521	1267	1372	1359	1410	
						1510	1723	1892	1787	1753	1818	1859	2072	2232	2023	
						1842	1570	1535	1575	1490	1601	1694	1791	2017	2006	
						2121	1911	1818	1846	1738	1691	1725	1703	1897	1837	
						1839	1838	1946	1872	1827	1880	1818	1952	1943	2156	
						2227	2474	2651	2871	3190	3322	3303	3553	3309	3107	
						3018	2943	2884	2736	2887	3205	3880	4380	5146	6471	
						6641	6073	6408	6326	6383	6548	6405	7377	7565	7534	
						8072	8277	8336	9519	9721	9834	10048	9886	10293	11071	
						11527	11821	11885	10557	9305	9440	9071	8969	9167	9422	
						9363	8800	8285	7989	7693	7330	7652	7541	7610	7193	
						6720	6865	6166	5910	5931	5569	5404	5205	5127	5011	
						4939	5003	4668	4520	4164	4016	3775	3896	3602	3457	
						3455	3484	3507	3444	3651	3858	3758	3988	3820	3695	
						3582	3568	3568	3613	3562	3200	3251	3120	2939	2801	
						2961	2916	2940	3112	3090	3144	2827	2617	2407	2387	
						2209	2138	2020	1935	1932	1710	1486	1383	1527	1616	
						1718	1715	1514	1492	1415	1195	1022	1168	1238	1046	
						1092	954	1023	992	907	848	868	865	772	775	
						787	828	862	1022	1199	1210	1171	1309	1253	1106	
						1082	1143	1061	1034	1108	1296	1407	1280	1361	1210	
						819	686	563	532	511	498	485	416	323	249	
						202	207	207	182	147	471	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "(DSM_Ballon_Lionel AJUSTE Dominguez"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_Ultra_High_Quality_Holes_filled_fixed_dominguez.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 36
				MaximumInputValue	= 226
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 254
					MaximumValue	= 0
					CellsBelowMin	= 766
					CellsAboveMax	= 224
					NrOfCells	= 1282922
					Bins		= {
						122	170	0	212	235	272	0	352	441	442	
						0	541	585	692	0	835	917	1067	0	1159	
						1329	1386	0	1600	1730	1884	0	2033	2208	0	
						2429	2671	2897	0	3051	3272	3506	0	3738	3933	
						4237	0	4509	4717	5115	0	5131	5399	5564	0	
						5754	5768	6204	0	6225	6421	6661	0	6711	7046	
						7094	0	7300	7433	7383	0	7627	7882	7690	0	
						7735	7946	8051	0	8045	8065	8148	0	8028	8040	
						0	8141	8019	8089	0	8019	7904	8104	0	7928	
						7935	8017	0	8027	8063	8026	0	8012	7958	8106	
						0	8036	8157	8270	0	8150	8183	8437	0	8608	
						8530	8561	0	8670	8548	8979	0	8908	8975	9034	
						0	9123	9167	9483	0	9477	9800	0	9837	10031	
						10127	0	10342	10575	10751	0	10938	10956	11236	0	
						11470	11653	11858	0	12064	12241	12601	0	12541	12752	
						12858	0	13173	13387	13509	0	13489	13657	13625	0	
						13710	13855	13973	0	14099	14047	14287	0	14257	14233	
						14166	0	14101	14212	14030	0	13924	13893	13816	0	
						13655	13290	0	13220	12931	12477	0	12012	11641	11195	
						0	10654	10330	9714	0	9084	8497	8011	0	7341	
						6973	6348	0	5873	5558	5080	0	4682	4251	3985	
						0	3756	3451	3000	0	2808	2536	2412	0	2162	
						1902	1706	0	1627	1435	1252	0	1061	1021	827	
						0	738	644	0	553	480	437	0	343	292	
						260	0	200	191	158	0	108	103	81	0	
						79	53	44	0	31	23	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Ballon_Stephane"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Balloon_Ortho_dominguez_fixed_pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 30
				MaximumInputValue	= 200
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 254
					MaximumValue	= 0
					CellsBelowMin	= 224465
					CellsAboveMax	= 14693
					NrOfCells	= 2609669
					Bins		= {
						14061	0	0	14284	14790	0	14977	15261	0	0	
						15533	0	15877	16109	0	16347	0	0	16869	16870	
						0	16799	17283	0	0	17158	0	17627	17801	0	
						17938	0	0	17884	18108	0	17997	18379	0	18335	
						0	0	18379	18330	0	18541	18627	0	0	18513	
						0	18764	18502	0	18460	0	0	18395	18558	0	
						18245	18337	0	0	18264	0	18266	18123	0	18219	
						0	0	18022	18184	0	18050	18370	0	0	18176	
						0	18299	18656	0	18879	18833	0	0	18736	0	
						19119	19092	0	19161	0	0	19561	19819	0	19862	
						19917	0	0	20211	0	20436	20345	0	20562	0	
						0	20605	21049	0	20840	21578	0	0	21570	0	
						21377	21406	0	21580	0	0	21757	0	21573	21688	
						21889	0	22125	0	0	22282	22356	0	22642	22591	
						0	0	22634	0	22974	23167	0	23450	0	0	
						23503	23991	0	23877	24032	0	0	24173	0	24401	
						23892	0	24145	0	0	24099	23505	0	23257	22998	
						0	0	23014	0	22483	22278	0	21885	21832	0	
						0	21011	0	20827	20610	0	19913	0	0	19554	
						19479	0	18729	18312	0	0	17894	0	17135	16623	
						0	16448	0	0	15670	15295	0	14574	13844	0	
						0	13295	0	12679	11974	0	11109	0	0	10460	
						9906	0	9111	8600	0	7903	0	0	7150	6696	
						0	6284	5722	0	0	5319	0	4962	4483	0	
						4156	0	0	3850	3589	0	3306	2956	0	0	
						2658	0	2438	2276	0	2113	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "DEM_Ballon_Stephane"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Balloon_dem_dominguez_fixed_pleiades.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 75:22:44.86696818
			SunAngle	= 44:29:0.580122186
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 100
				MaximumInputValue	= 145
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 207.26004028320312
					MaximumValue	= 41.394760131835937
					CellsBelowMin	= 248964
					CellsAboveMax	= 438733
					NrOfCells	= 2312190
					Bins		= {
						1617	3227	3310	3109	2908	2978	3223	3158	3178	3223	
						3212	3429	3589	3810	3886	4517	4748	4767	4814	5019	
						5048	4879	4890	4765	5200	5304	5075	5333	5331	5176	
						5285	5075	4997	5520	5292	5298	5388	5349	5283	6048	
						5996	5632	5629	5357	5193	5064	5381	5327	5539	5603	
						5798	5945	5934	6311	6460	6957	7547	7914	8139	8019	
						7564	7113	6772	6532	6925	7034	7604	8827	7938	7319	
						6935	6743	6546	6472	6291	6425	6688	6842	6577	6461	
						6740	7090	7453	7588	7415	7658	7628	7751	8054	8108	
						8321	8247	8592	8921	9184	8956	8946	8861	8473	9036	
						10249	10589	10458	11532	12406	12311	11828	11960	11945	11400	
						11582	11645	11241	10892	10782	9676	9233	9044	8520	8631	
						8784	8631	8711	8645	8247	7947	7600	7494	7582	7726	
						7786	7637	7631	7683	7872	7993	8195	8172	8013	7906	
						8026	7627	7747	7576	7862	7462	7344	7193	7247	7391	
						7384	7299	7305	7382	7379	7205	7622	7706	7554	7249	
						7520	7870	7912	7636	7263	7260	7445	7188	6856	6847	
						6656	6474	6324	6373	6539	6411	6279	6297	6343	6073	
						6197	6074	6098	5947	5923	5635	5548	5459	5629	5503	
						5518	5431	5415	5525	5428	5286	5304	5371	5501	5862	
						5693	5701	5689	5390	5252	5318	5142	4956	4880	4740	
						4676	4753	4694	4566	4770	4670	4497	4721	4734	4720	
						4952	4926	4872	5045	4864	4880	4895	4682	4495	4627	
						4493	4339	4193	4043	4112	4035	4041	4059	3902	3958	
						3941	3710	3771	3958	3690	3779	3776	3677	3599	3546	
						3439	3473	3673	3902	3407	1585	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "D5S1_Ortho"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Photogrammetrie\D5S1\D5S1_Ortho.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 250
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 814478
					Bins		= {
						0	15200	11133	8761	8229	8185	7923	7761	7609	7534	
						7470	7173	7047	6986	6812	6593	6460	6328	6232	6003	
						5662	5572	5378	5143	4892	4579	4495	4220	4008	3983	
						3735	3547	3393	3441	3298	3261	3193	3109	3053	2866	
						2984	2926	2946	2886	2902	2911	2889	2927	2900	3015	
						2941	3176	3130	3136	3137	3261	3123	3278	3288	3337	
						3378	3431	3553	3505	3739	3732	3790	3783	3895	4007	
						3984	4109	4144	4302	4383	4546	4539	4688	4746	4906	
						4901	5031	5111	5193	5189	5322	5382	5607	5628	5759	
						5896	5925	5941	5931	6102	6290	6141	6412	6465	6402	
						6477	6460	6519	6585	6630	6709	6652	6579	6857	6903	
						6606	6927	6742	6877	6635	6685	6686	6596	6427	6523	
						6354	6243	6206	6107	6144	6005	5743	5685	5672	5534	
						5271	5432	5142	5051	4809	4657	4679	4487	4496	4233	
						4109	4051	3928	3712	3639	3463	3559	3267	3220	2945	
						2899	2720	2665	2517	2436	2331	2193	2234	2055	1920	
						1914	1710	1589	1530	1464	1338	1279	1194	1146	1097	
						1030	965	824	881	817	732	632	566	530	484	
						476	429	364	361	298	286	251	239	196	181	
						163	144	136	114	98	83	70	65	46	56	
						49	41	37	23	21	27	22	23	27	10	
						11	13	17	21	22	24	18	11	20	9	
						15	6	13	16	16	16	5	4	13	9	
						2	2	5	6	5	7	12	8	11	4	
						9	7	7	10	2	4	1	0	2	0	
						1	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Photogrammetrie\D5S1\D5S1_Ortho.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 253
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 828704
					Bins		= {
						0	14937	14132	9976	8252	7709	7554	7753	8095	7968	
						7987	7782	7459	7291	6923	6663	6494	6108	5945	5641	
						5286	4968	4857	4623	4534	4160	3887	3882	3667	3490	
						3351	3231	3220	2972	2905	2806	2833	2653	2602	2544	
						2500	2592	2516	2538	2519	2477	2386	2449	2525	2490	
						2531	2453	2493	2557	2462	2548	2462	2565	2677	2642	
						2657	2679	2724	2837	2752	2828	2899	2924	2997	2967	
						3138	3082	3214	3244	3184	3328	3424	3500	3436	3477	
						3503	3569	3822	3716	3813	3843	3889	4016	4073	4167	
						4255	4348	4435	4547	4547	4716	4745	4726	4776	4952	
						5067	5238	5086	5117	5279	5397	5422	5406	5556	5698	
						5639	5704	5634	5798	5836	5921	5916	5818	6028	6046	
						6141	6185	6070	6229	6131	6222	6201	6256	6107	6127	
						6202	6083	6279	6088	6065	6165	5960	5911	5824	5824	
						5749	5818	5739	5690	5628	5438	5476	5216	5226	5212	
						5073	4829	4853	4794	4676	4432	4391	4198	4053	4095	
						3938	3681	3643	3480	3482	3260	3154	2972	2803	2803	
						2565	2468	2379	2256	2156	2088	1870	1759	1694	1609	
						1460	1384	1240	1251	1129	1035	922	878	776	708	
						757	572	571	505	424	401	310	286	292	285	
						242	215	167	147	133	132	114	79	74	66	
						67	58	59	38	34	31	32	23	25	19	
						16	6	10	5	2	7	7	2	7	7	
						12	5	10	7	15	6	6	9	4	11	
						2	6	2	2	1	0	0	0	1	0	
						1	0	0	1	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Photogrammetrie\D5S1\D5S1_Ortho.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 807532
					Bins		= {
						0	10168	7642	6511	5948	6078	6076	6027	6044	5980	
						5651	5554	5407	5184	5086	5052	4812	4779	4583	4292	
						4258	4079	4125	3882	3809	3764	3766	3629	3548	3502	
						3400	3257	3131	2994	2986	2922	2838	2781	2729	2662	
						2639	2542	2377	2297	2193	2286	2273	2155	2174	2077	
						2130	2107	2030	2033	1989	2073	1956	2000	1938	1983	
						1867	1994	1871	1941	1892	1958	1979	2039	1985	1961	
						2008	2048	2040	2068	2144	2107	2127	2191	2133	2188	
						2262	2289	2279	2302	2274	2348	2355	2438	2399	2486	
						2487	2452	2572	2598	2712	2593	2698	2782	2886	2819	
						2829	3084	3104	2941	3161	3160	3217	3273	3260	3338	
						3512	3441	3416	3589	3555	3582	3742	3863	3792	3928	
						3936	4047	4027	4103	4356	4128	4280	4270	4570	4326	
						4442	4579	4526	4527	4579	4635	4882	4715	4857	4930	
						5042	5160	5080	5101	5119	5340	5369	5287	5385	5340	
						5574	5496	5595	5668	5605	5680	5697	5791	5827	6089	
						5804	5870	5847	5957	6000	5912	6044	6033	6024	6075	
						5995	5994	6045	5907	5873	5860	5754	5667	5666	5419	
						5314	5220	5274	4993	4822	4857	4614	4598	4389	4195	
						4102	3981	3801	3651	3411	3356	3218	3097	2868	2663	
						2548	2283	2235	2085	1934	1707	1679	1585	1433	1259	
						1144	1147	955	854	715	701	614	523	500	427	
						369	338	283	235	205	194	145	114	101	101	
						59	64	58	40	41	31	37	24	19	20	
						13	10	9	4	7	1	0	0	1	2	
						0	0	0	0	1	1	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Drone_1a"
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "pseudocolor"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Drone\GD_drone_1a_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 10
				MaximumInputValue	= 230
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 1
					MaximumValue	= 255
					CellsBelowMin	= 4720
					CellsAboveMax	= 8823
					NrOfCells	= 3088167
					Bins		= {
						878	977	1023	1176	0	1287	1424	1563	1730	1865	
						2110	0	2313	2582	2843	3223	3734	4023	0	4481	
						4945	5559	6054	6525	7333	8113	0	8549	9151	9731	
						10521	10826	11575	0	12006	12640	13382	13759	14015	14472	
						0	14910	15346	15839	15963	16072	16986	0	16580	17038	
						17546	17710	17784	18027	18228	0	18419	18670	18557	18684	
						19010	19011	0	19144	19337	19401	19476	19571	19852	0	
						19901	20207	20456	20365	20330	20427	20890	0	20955	21025	
						21231	21366	21378	21453	0	21514	21501	21738	21759	21659	
						21504	0	21863	22112	22189	22076	22077	22089	0	22419	
						21970	22193	21975	21886	22190	21968	0	21813	21783	21785	
						21777	21793	21751	0	21675	21414	21236	21228	21029	21341	
						0	20912	21128	20711	20960	20442	20696	0	20325	20353	
						20259	20488	20368	20219	20072	0	20155	19820	20060	19786	
						20073	19586	0	19480	19741	19476	19558	19280	19310	0	
						19010	19067	19080	18844	18645	18431	18661	0	18369	18129	
						18122	17968	17626	17511	0	17531	17502	17376	17258	16937	
						16856	0	16294	16165	15995	16038	15878	15478	15469	0	
						15504	15129	14893	14699	14420	14037	0	13888	13895	13414	
						13399	13146	12993	0	12505	12470	12078	11905	11592	11387	
						0	10853	10709	10601	10307	9908	9702	9526	0	9246	
						9011	8558	8284	8187	7889	0	7735	7371	7120	7139	
						6776	6613	0	6212	6148	5806	5680	5282	5150	4857	
						0	4612	4589	4233	4099	3869	3680	0	3549	3363	
						3192	3010	2817	2585	0	2480	2367	2287	2086	1989	
						1782	0	1659	1463	1345	1206	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Drone\GD_drone_1a_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 10
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 1
					MaximumValue	= 255
					CellsBelowMin	= 4779
					CellsAboveMax	= 0
					NrOfCells	= 3087830
					Bins		= {
						844	1012	1155	1297	1425	1584	1790	2064	2429	2645	
						3048	3589	4140	0	4696	5341	5946	6733	7579	8003	
						8616	9502	10214	10677	11386	11990	12813	13371	13794	13958	
						15046	15558	16243	16550	16949	17162	17358	18189	0	18087	
						18328	18657	19045	18902	18771	18857	18859	19126	19040	19069	
						18871	19012	19248	19249	19114	19405	19351	19385	19374	19441	
						19508	19526	19524	19292	0	19499	19231	19044	19006	18856	
						18433	18180	18191	17754	17669	17015	16941	16511	16169	15677	
						15513	15040	14746	14476	14348	14093	13910	13682	13536	0	
						13276	12936	12946	12802	12614	12522	12554	12287	12114	12195	
						12169	12062	12048	11999	12039	11997	12181	11960	12089	12181	
						12336	12172	12325	12179	12309	0	12602	12524	12651	12820	
						12818	12946	13199	13112	13414	13536	13565	13644	13656	13789	
						14063	14040	14214	14436	14576	14593	14840	14926	15189	15133	
						0	15482	15510	15831	15776	15937	16435	16262	16315	16340	
						16578	16564	16690	16822	17021	17076	17266	17324	17303	17687	
						17412	17671	17481	17677	17516	17873	0	17971	17584	17872	
						17653	17525	17394	17498	17318	17559	17280	17082	17109	17166	
						16745	16749	16790	16582	16506	16191	16031	16112	15560	15660	
						15476	0	15437	15131	14825	14639	14509	14088	13944	13700	
						13417	13195	12827	12742	12307	11909	11429	11252	10875	10565	
						10079	9911	9671	9261	8903	8851	8344	0	8077	7736	
						7291	7181	6701	6367	6312	5966	5649	5330	5073	4817	
						4517	4423	4165	3760	3545	3262	3038	2847	2744	2413	
						2192	2022	0	1830	1717	1447	1259	1240	1006	885	
						774	645	542	441	313	616	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Drone\GD_drone_1a_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 10
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 1
					MaximumValue	= 255
					CellsBelowMin	= 2559
					CellsAboveMax	= 0
					NrOfCells	= 3089231
					Bins		= {
						494	625	702	768	905	1088	1241	1474	1835	2099	
						2525	3061	3603	0	4254	4781	5494	6145	7269	7929	
						8527	9576	10123	11049	11752	12419	13204	13834	14309	14870	
						15401	16049	16575	17151	17536	17868	17924	18466	0	18483	
						18669	18705	18800	19296	19145	19325	19227	19177	19216	19385	
						19213	19326	19031	19157	18998	19200	18770	18520	18557	18104	
						17980	17776	17354	16908	0	16906	16503	16158	15912	15171	
						14973	14827	14276	14109	13691	13285	12952	12750	12750	12378	
						12202	12029	11677	11643	11424	11289	11343	11081	11145	0	
						10854	10663	10739	10672	10622	10629	10504	10291	10482	10340	
						10188	10293	10368	10106	10314	10252	10094	10271	10168	10149	
						10192	10341	10432	10243	10511	0	10466	10524	10660	10663	
						10640	10671	10745	11009	10933	11020	11054	11206	11326	11216	
						11412	11433	11536	11677	11741	11815	12155	11939	12148	12123	
						0	12356	12686	12831	12614	12588	12968	12870	13122	13373	
						13246	13365	13666	13839	13982	13977	13930	14137	14389	14643	
						14553	14793	14946	15025	15312	15345	0	15413	15714	15889	
						15904	15996	16357	16464	16331	16488	16807	16991	16770	16889	
						17104	17541	17641	17659	17266	17451	17799	17645	17544	17680	
						17723	0	17443	17649	17551	17610	17549	17562	17685	17296	
						17314	17166	17255	16787	16923	16810	16758	16771	16426	16227	
						16233	15927	15710	15317	15269	15122	14923	0	14551	13956	
						14143	13598	13317	13022	12676	12189	11715	11455	11296	10605	
						10315	10167	9544	9234	8926	8519	7952	7590	7291	6821	
						6239	5804	0	5225	4957	4440	3927	3451	3043	2505	
						2173	1910	1531	1264	960	1905	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "DSM_Drone_1a"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "Drone\GD_drone_1a_DSM_fixed_Pleiades.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 291:15:1.823843795
			SunAngle	= 53:1:2.167046589
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 1515
				MaximumInputValue	= 1600
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 1685.705322265625
					MaximumValue	= -11302.3515625
					CellsBelowMin	= 37
					CellsAboveMax	= 3
					NrOfCells	= 90177
					Bins		= {
						0	0	0	7	11	14	29	44	26	38	
						30	16	34	37	31	87	100	101	120	181	
						221	172	121	144	107	111	140	126	133	164	
						155	163	173	207	188	192	166	170	174	151	
						158	144	212	213	244	227	216	205	206	186	
						190	220	220	211	191	212	226	219	279	307	
						266	248	258	276	283	262	279	313	284	314	
						312	340	339	366	362	341	351	346	324	348	
						347	362	339	325	353	321	389	367	362	370	
						412	484	1083	1244	1506	921	719	581	554	571	
						564	622	628	657	705	548	517	542	576	512	
						544	539	569	536	514	559	570	528	569	523	
						485	489	535	507	449	484	556	466	446	510	
						499	455	485	483	487	539	488	525	478	558	
						471	472	456	428	439	421	459	477	444	414	
						461	444	403	427	449	535	469	587	580	512	
						544	570	648	613	631	628	616	616	598	576	
						551	490	435	463	494	459	532	566	566	585	
						583	592	724	669	751	807	776	845	777	858	
						754	670	655	641	658	563	524	474	482	478	
						438	424	414	387	374	380	375	344	329	317	
						312	284	281	238	270	244	243	225	207	224	
						174	180	151	156	167	146	158	132	142	117	
						108	98	74	93	76	66	97	87	73	56	
						47	43	49	37	23	13	8	8	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Drone_1b"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "pseudocolor"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Drone\GD_drone_1b_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 0
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Drone\GD_drone_1b_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 0
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Drone\GD_drone_1b_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 0
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "DSM_Drone_1b"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "Drone\GD_drone_1b_DSM_fixed_Pleiades.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 1558
				MaximumInputValue	= 1600
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 2860.496337890625
					MaximumValue	= -11022.5224609375
					CellsBelowMin	= 27
					CellsAboveMax	= 3
					NrOfCells	= 11018
					Bins		= {
						7	14	13	12	16	13	18	21	18	16	
						21	15	18	19	22	13	13	16	14	26	
						11	21	19	23	17	20	20	30	22	28	
						38	32	33	48	41	53	57	52	44	41	
						52	34	48	42	34	42	52	44	46	48	
						39	53	61	50	54	50	53	49	55	52	
						45	50	70	54	46	71	77	67	47	60	
						53	64	64	70	57	89	93	82	83	97	
						82	89	106	85	97	111	139	115	99	77	
						89	87	107	95	98	95	81	91	108	111	
						111	124	188	176	158	153	175	160	167	128	
						129	103	87	78	88	78	79	79	89	74	
						92	77	66	54	88	53	69	55	59	49	
						63	65	52	59	57	39	45	46	41	46	
						47	33	51	29	24	41	35	28	33	50	
						35	35	23	39	28	35	32	30	33	32	
						32	23	34	39	32	31	25	28	37	23	
						28	32	25	32	20	20	22	25	22	21	
						28	20	16	19	24	21	33	26	24	22	
						24	20	21	34	17	18	19	21	28	23	
						20	25	14	16	7	11	15	9	8	15	
						13	11	12	10	7	15	10	11	10	10	
						9	7	12	15	16	8	10	18	10	13	
						10	13	15	10	6	6	8	2	3	6	
						3	2	1	0	0	0	1	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Drone_2"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "pseudocolor"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Drone\GD_drone_2_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 135260
					Bins		= {
						0	12	17	30	28	28	27	29	39	45	
						51	67	70	87	108	129	160	224	234	335	
						338	459	541	631	740	896	928	1084	1053	1238	
						1233	1219	1390	1334	1296	1371	1374	1420	1422	1459	
						1446	1469	1452	1494	1477	1500	1505	1555	1462	1524	
						1614	1486	1430	1462	1451	1469	1507	1510	1398	1390	
						1387	1379	1347	1287	1207	1251	1234	1199	1200	1141	
						1148	1079	1185	1097	1113	1055	1057	1037	1072	1057	
						1030	1020	1001	1059	978	1049	1006	1033	973	986	
						1024	1006	1040	996	988	942	928	938	992	884	
						890	891	855	886	884	866	825	829	838	856	
						818	861	794	716	772	783	742	743	750	747	
						705	732	704	624	661	681	588	607	599	598	
						625	584	532	530	528	525	507	480	446	499	
						411	409	424	419	407	349	378	347	337	347	
						301	318	295	309	259	255	266	243	209	213	
						189	194	181	183	174	155	154	163	118	151	
						147	135	136	114	106	95	92	106	64	75	
						83	67	79	71	69	65	60	68	55	47	
						54	40	48	45	33	39	36	29	38	28	
						34	31	28	30	22	21	22	21	19	20	
						14	13	14	19	16	15	13	19	22	6	
						6	15	11	9	9	14	16	13	13	10	
						12	5	7	14	8	9	16	13	14	17	
						5	9	8	3	9	11	6	11	4	10	
						4	3	2	5	2	3	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Drone\GD_drone_2_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 135332
					Bins		= {
						0	2	0	2	3	4	2	3	9	3	
						11	10	15	18	30	33	54	60	77	113	
						149	150	195	265	295	369	425	497	581	689	
						754	910	960	983	1024	1191	1201	1285	1276	1269	
						1221	1270	1337	1290	1358	1409	1405	1398	1422	1470	
						1489	1504	1565	1498	1560	1493	1486	1533	1447	1530	
						1490	1480	1417	1420	1379	1281	1251	1267	1247	1298	
						1187	1172	1201	1144	1091	1086	1118	1061	1092	1060	
						1019	952	971	1015	944	960	970	890	955	893	
						873	859	901	847	842	801	790	767	808	735	
						781	816	732	760	750	753	695	703	711	707	
						618	695	692	631	674	657	654	625	603	603	
						618	585	608	581	582	533	582	553	533	542	
						557	525	550	513	525	498	560	489	514	523	
						528	530	501	481	488	505	524	451	461	484	
						438	479	458	468	471	471	411	380	387	419	
						391	406	383	370	365	383	359	321	347	314	
						344	338	338	291	307	276	280	301	258	229	
						262	227	256	202	192	203	207	192	212	199	
						183	173	166	175	161	161	150	139	153	140	
						138	136	115	134	143	116	110	117	115	115	
						79	110	77	80	84	75	74	79	70	76	
						81	75	78	69	60	69	71	54	62	74	
						80	67	60	75	73	67	61	62	64	61	
						67	59	70	68	76	98	58	79	107	97	
						83	96	72	84	67	89	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Drone\GD_drone_2_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 135334
					Bins		= {
						0	1	1	1	2	1	3	2	2	6	
						6	8	7	12	11	27	29	43	76	79	
						93	105	145	184	204	250	266	351	365	416	
						499	567	580	647	601	764	786	825	806	865	
						867	881	926	913	1046	1048	1041	1022	1035	1057	
						1071	1120	1124	1102	1137	1151	1191	1176	1113	1159	
						1224	1220	1224	1173	1192	1205	1165	1244	1291	1208	
						1203	1226	1180	1174	1191	1088	1167	1128	1099	1112	
						1005	1157	1038	1015	1005	1002	1030	933	1012	963	
						965	881	981	928	932	898	853	923	840	829	
						817	807	791	798	762	803	767	731	704	768	
						726	703	714	671	686	672	613	670	607	622	
						603	595	587	627	573	564	524	532	523	542	
						530	503	510	516	495	474	456	479	462	468	
						449	431	438	462	437	439	390	361	413	370	
						352	374	412	404	374	393	429	396	358	366	
						344	342	334	359	358	381	359	355	343	323	
						342	340	378	347	369	318	348	377	361	336	
						361	336	370	372	345	392	350	366	363	373	
						369	339	351	351	348	332	375	327	342	333	
						329	322	353	341	320	333	370	336	319	327	
						309	309	276	277	271	283	256	285	260	266	
						262	258	247	243	263	228	194	229	223	220	
						199	228	216	206	206	189	208	200	222	173	
						179	204	183	238	199	229	231	198	259	264	
						247	261	271	263	381	299	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "DSM_Drone_2"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "Drone\GD_drone_2_DSM_fixed_Pleiades.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 1515
				MaximumInputValue	= 1575
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 3115.168701171875
					MaximumValue	= -11581.998046875
					CellsBelowMin	= 778
					CellsAboveMax	= 340
					NrOfCells	= 1772013
					Bins		= {
						11	103	124	86	81	79	86	121	254	225	
						416	834	1177	1903	2730	2953	14679	17744	15038	15565	
						21592	18371	14567	15658	16263	14178	14388	13505	13121	14384	
						15854	24316	30051	35031	29678	23944	20643	16620	16262	16757	
						18372	15003	14187	14259	13964	13800	13671	12854	13223	13919	
						14999	15913	15247	15763	15980	16772	17821	18498	19597	19572	
						20369	19209	18686	18446	17782	17246	17313	17960	19061	18647	
						18150	17580	17313	16745	16677	16263	15715	15400	15327	14244	
						14103	14372	15018	15502	14603	14151	14154	13380	12221	11223	
						11070	10868	11137	10886	10530	10427	9914	8766	8298	7996	
						7367	7355	7194	7342	7798	8151	7535	7648	7878	7546	
						7354	7462	7144	6786	7626	7443	7202	7034	7027	6759	
						6426	6255	6329	5995	5998	5995	6071	5727	5205	4949	
						4673	4082	3574	3361	3385	2845	2507	1904	1660	1787	
						1680	1515	1464	1510	1539	1745	1646	1677	1551	1662	
						1579	1637	1675	1579	1509	1622	1730	1814	1799	1740	
						1521	1448	1496	1610	1519	1522	1491	1500	1566	1601	
						1731	1658	1555	1532	1391	1482	1440	1469	1616	1643	
						1646	1582	1549	1602	1665	1693	1824	1731	1897	1689	
						1627	1597	1567	1713	1899	2170	2227	2256	2497	2615	
						2787	2831	2445	2441	2386	2319	2385	2259	2396	2386	
						2402	2325	2515	2318	2144	2398	2573	2738	2488	2429	
						2556	2167	2175	2115	2089	1766	1427	1235	1025	1089	
						1128	1215	1412	1271	956	862	512	342	130	6	
						0	1	0	0	0	1	1	0	0	0	
						0	1	1	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Drone_3"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "pseudocolor"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "Drone\GD_drone_3_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 710934
					Bins		= {
						0	94	119	126	142	156	174	177	208	266	
						260	271	348	342	389	400	445	478	527	607	
						606	656	721	824	909	974	1027	1095	1178	1395	
						1530	1608	2003	2302	2535	2976	3215	3523	3790	3870	
						3896	3853	3824	3754	3744	3839	3947	4087	4354	4478	
						4465	4691	5033	5222	5427	5726	5882	6221	6385	6627	
						6724	7039	7321	7398	7440	7736	7850	7955	8164	8370	
						8343	8281	8414	8412	8459	8259	8348	8259	8004	8008	
						7786	7659	7532	7503	7233	7245	7139	7157	6971	7005	
						6957	6867	6651	6805	6672	6455	6571	6438	6561	6389	
						6269	6193	6052	5927	5973	5745	5667	5580	5341	5376	
						5382	5118	5117	4962	4851	4753	4682	4583	4491	4329	
						4170	3974	4032	3945	3704	3698	3585	3455	3527	3405	
						3299	3119	3092	3008	2977	2956	2839	2768	2823	2706	
						2666	2547	2616	2546	2420	2335	2391	2288	2289	2087	
						2169	2039	2106	2002	1964	1887	1885	1867	1801	1713	
						1678	1612	1610	1589	1607	1541	1545	1488	1503	1432	
						1378	1339	1279	1262	1243	1233	1160	1217	1169	1153	
						1063	1027	1030	1008	1006	948	906	957	863	895	
						871	881	787	765	757	725	735	741	690	621	
						597	577	569	535	543	481	509	415	431	432	
						408	430	339	372	336	298	311	322	327	276	
						270	254	259	253	196	242	218	178	188	181	
						132	140	157	113	110	109	92	95	89	90	
						71	64	59	51	51	58	42	31	25	22	
						19	12	12	9	12	16	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "Drone\GD_drone_3_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 1
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 711197
					Bins		= {
						0	44	41	52	70	59	78	79	91	119	
						101	125	140	178	185	203	232	249	308	317	
						335	434	485	530	603	677	734	831	934	1007	
						1066	1132	1206	1278	1377	1474	1533	1593	1724	1809	
						1979	2063	2173	2322	2422	2484	2619	2776	3021	3162	
						3332	3392	3660	3819	3987	4226	4475	4658	5022	5363	
						5532	5729	5922	6044	6325	6416	6508	6517	6626	6750	
						6635	6577	6787	6721	6741	6620	6579	6440	6376	6393	
						6271	6299	6067	5979	5989	6009	5831	5737	5686	5702	
						5704	5738	5977	5910	6090	6409	6742	6820	6795	6481	
						6498	5993	5905	5687	5619	5608	5629	5369	5449	5535	
						5317	5387	5389	5399	5273	5190	4857	4704	4502	4603	
						4336	4322	4240	4306	4180	4146	4168	4141	4117	3996	
						4059	3970	3992	3885	3832	3777	3745	3774	3731	3689	
						3861	3565	3728	3605	3462	3494	3429	3419	3429	3282	
						3305	3257	3267	3062	3046	3196	2943	2928	2910	2837	
						2740	2787	2670	2716	2508	2527	2503	2452	2423	2307	
						2301	2366	2253	2255	2229	2077	2148	2016	1993	1956	
						2032	1887	1887	1916	1938	1840	1695	1719	1729	1732	
						1662	1603	1644	1576	1550	1531	1403	1384	1409	1395	
						1373	1318	1283	1223	1267	1144	1178	1137	1060	1062	
						1015	945	991	969	937	879	826	883	788	786	
						754	736	707	630	597	647	597	584	534	510	
						553	520	483	481	433	431	422	409	403	413	
						346	367	346	327	265	283	250	206	204	187	
						138	118	98	65	59	65	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "Drone\GD_drone_3_Orthophotography_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "DSM_Drone_3"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "Drone\GD_drone_3_DSM_fixed_Pleiades.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 318:34:34.819910234
			SunAngle	= 46:35:10.915260626
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 1505
				MaximumInputValue	= 1540
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 2737.872802734375
					MaximumValue	= -11239.5654296875
					CellsBelowMin	= 261
					CellsAboveMax	= 5
					NrOfCells	= 32619
					Bins		= {
						44	59	54	69	57	39	50	67	71	78	
						90	104	114	130	133	135	133	131	140	127	
						131	144	144	140	165	142	166	149	157	188	
						168	175	190	181	161	201	185	193	202	259	
						225	219	202	226	214	225	271	268	251	243	
						264	251	230	243	269	221	226	218	238	238	
						233	223	248	234	284	294	253	253	307	280	
						316	338	321	336	356	364	365	370	355	378	
						343	341	324	330	332	346	307	287	261	276	
						296	280	266	233	248	263	236	239	241	233	
						232	225	196	208	199	192	180	175	209	189	
						171	181	184	155	153	156	158	171	164	150	
						151	102	131	150	141	154	113	124	126	115	
						129	119	120	100	119	105	90	99	97	92	
						89	89	107	94	92	76	75	85	85	62	
						87	104	104	87	86	81	70	67	68	77	
						81	65	56	72	64	65	66	71	58	71	
						69	57	68	57	73	49	54	52	61	45	
						64	44	42	51	43	55	64	42	43	35	
						48	48	32	42	27	23	36	41	33	37	
						31	26	27	21	22	19	37	22	18	24	
						26	18	17	18	19	11	14	17	19	14	
						10	11	21	21	18	13	12	9	12	25	
						13	18	20	13	8	11	16	8	4	10	
						12	8	7	3	5	1	1	1	2	3	
						1	0	2	1	1	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "(Ortho_Ballon_Chelsea"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_chelsea_balloon_fixed_pleiades_new.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 10
				MaximumInputValue	= 193
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 241
					MaximumValue	= 0
					CellsBelowMin	= 82360
					CellsAboveMax	= 66023
					NrOfCells	= 2907534
					Bins		= {
						0	7524	0	7909	8468	0	9013	0	9343	0	
						9888	10012	0	10294	0	10951	0	11289	11311	0	
						0	11751	11982	0	12275	12654	0	0	12962	13076	
						0	13433	0	13703	0	13851	14058	0	14324	0	
						14496	0	14882	14938	0	0	15261	15245	0	15438	
						15387	0	0	15776	15576	0	15621	15601	0	0	
						15873	15952	0	15833	0	15770	0	15722	15855	0	
						15914	0	15903	0	16223	16354	0	0	16461	16615	
						0	16676	16792	0	0	16852	17310	0	17371	17223	
						0	0	17630	17569	0	17763	0	0	17665	17844	
						17686	0	17791	0	0	17978	17980	18125	0	0	
						18074	18098	0	18049	18005	0	0	17826	18188	0	
						18211	0	0	18375	18325	18488	0	18519	0	0	
						18686	18907	18936	0	19025	0	0	19052	19165	19214	
						0	0	19585	0	19549	20238	20076	0	0	20363	
						20594	0	20376	0	0	20950	21290	21642	0	22037	
						0	0	22955	22798	23629	0	0	24045	0	24732	
						25315	25771	0	0	26540	0	26579	27403	27775	0	
						0	28376	0	28708	29494	0	0	29793	30838	0	
						31666	31815	0	0	32437	32961	32972	0	0	32828	
						0	32610	32010	31336	0	0	31026	0	30432	29770	
						29283	0	0	28807	0	28059	27630	0	0	27079	
						26759	0	26012	25595	0	0	24287	23498	0	22583	
						0	21944	0	20260	19395	18020	0	0	16930	0	
						15755	14678	0	0	13824	12918	0	11782	10939	0	
						0	10026	9308	0	8549	7752	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "(Ballon_Couleur-Tyler"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= RGB
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Blue
			Description	= "Blue Layer"
			Dataset		= "MNT+Ortho_Balloon\Balloon_1_Ortho_High_Quality_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 3
					BandId Begin
						Value		= "Blue Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 254
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2352062
					Bins		= {
						6121	1348	1508	1783	0	2038	2379	2679	3095	3484	
						4027	0	4414	4859	5305	5976	6592	0	7075	7643	
						8136	8886	9638	0	9950	10620	11143	11730	12328	0	
						13061	13304	13843	14266	14594	0	14950	15450	15804	16201	
						16146	0	16666	17011	17263	17376	17699	0	17667	17745	
						18159	17788	17988	0	18449	18468	18575	18502	18437	0	
						18207	18779	18531	18352	18687	0	18639	18755	18460	18618	
						18741	0	18641	18949	18700	19171	18997	0	19300	19391	
						19750	19757	20213	0	20316	20612	20950	21224	21209	0	
						21924	21957	22191	22532	22863	0	22952	23347	24051	24475	
						24605	0	24976	25464	26066	26032	26664	0	27090	27360	
						27476	27553	27969	0	28082	27819	27562	27529	27641	0	
						26934	26478	26364	25630	25036	0	24585	23934	23183	22643	
						21999	21462	0	20673	20018	19070	18627	17598	0	17077	
						16296	15760	15308	14449	0	14040	13528	12918	12245	11875	
						0	11147	10691	10277	9841	9024	0	8787	8054	7565	
						7120	6564	0	6035	5616	5388	4875	4366	0	4099	
						3846	3463	3156	2848	0	2600	2492	2208	2014	1862	
						0	1582	1426	1306	1202	1031	0	997	759	684	
						611	507	0	446	324	320	253	206	0	150	
						152	127	112	83	0	85	51	32	47	38	
						0	38	27	20	27	23	0	24	17	20	
						15	5	0	18	15	6	13	14	0	9	
						10	15	20	19	0	22	18	20	8	16	
						0	18	9	5	6	6	8	0	9	6	
						11	20	22	0	6	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Green
			Description	= "Green Layer"
			Dataset		= "MNT+Ortho_Balloon\Balloon_1_Ortho_High_Quality_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 2
					BandId Begin
						Value		= "Green Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 254
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2352082
					Bins		= {
						11529	1980	2162	2348	2865	0	3004	3254	3663	4089	
						0	4425	4938	5371	5751	0	6225	6647	7241	7546	
						0	7943	8705	9242	9451	10204	0	10675	11229	11683	
						12256	0	12727	13350	13618	13997	0	14366	14814	15163	
						15557	0	15779	16069	16453	16875	0	17407	17272	17437	
						17573	0	17758	18234	18275	18089	18518	0	18587	18575	
						18560	18596	0	18655	18789	18757	18546	0	18503	18770	
						18601	18611	0	18321	18552	18621	18623	0	18630	18700	
						18579	18661	0	18275	18529	18653	18791	18795	0	18686	
						18923	19076	19304	0	19379	19565	19843	19924	0	20263	
						20380	20824	21041	0	21503	22017	22118	22770	0	22731	
						22891	23555	23736	0	24119	24477	24929	24889	25194	0	
						25507	25811	25966	25871	0	25929	25977	25952	26062	0	
						25797	25765	25662	25305	0	24913	24703	23892	23348	0	
						22819	21893	21504	20623	0	19717	18877	18015	17416	16556	
						0	15903	15042	14378	13864	0	13155	12238	11814	11149	
						0	10599	10140	9637	8881	0	8392	7921	7353	6855	
						0	6429	5866	5425	5046	0	4729	4276	3956	3661	
						3385	0	3167	2886	2452	2357	0	2081	1944	1711	
						1509	0	1275	1158	997	864	0	692	581	518	
						440	0	394	316	254	218	0	187	138	125	
						83	84	0	66	62	46	36	0	27	18	
						20	17	0	15	6	10	21	0	5	6	
						8	7	0	5	5	8	6	0	3	6	
						10	5	7	0	6	6	6	7	0	10	
						11	20	9	0	3	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Red
			Description	= "Red Layer"
			Dataset		= "MNT+Ortho_Balloon\Balloon_1_Ortho_High_Quality_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 254
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2352067
					Bins		= {
						13497	0	2163	2354	2680	2932	0	3328	3749	4072	
						4381	4820	0	5133	5673	6242	6510	0	6978	7404	
						7907	8267	0	8710	9182	9656	10273	10583	0	10981	
						11295	11803	12193	0	12526	12968	13155	13290	0	13987	
						14039	14064	14291	14718	0	15122	15068	15184	15314	0	
						15255	15446	15598	15654	0	15983	15513	15645	15850	15753	
						0	16042	15713	16017	15936	0	15673	15607	15466	15709	
						15388	0	15643	15440	15286	15410	0	15382	15320	15234	
						15336	0	15204	15253	15251	15481	15565	0	15389	15691	
						15688	15857	0	15917	16062	16066	16011	0	16314	16263	
						16649	16722	16925	0	17089	17317	17421	17726	0	18145	
						18253	18710	18775	0	19384	19645	19842	19968	20485	0	
						20775	21174	21357	21699	0	21746	22354	22663	22901	0	
						23139	23624	23585	23861	24191	0	24504	24422	24506	24936	
						0	24913	24984	24863	24639	24802	0	24482	24269	24433	
						23806	0	23422	23207	22624	21860	0	20928	19999	19178	
						18138	17262	0	16439	15733	14816	13922	0	13183	12478	
						11725	10906	0	10593	9899	9484	8707	8163	0	7766	
						7219	6563	6213	0	5613	5344	4866	4461	0	4005	
						3785	3431	3215	2814	0	2570	2326	2065	1780	0	
						1656	1465	1298	1153	1000	0	843	722	643	522	
						0	456	370	303	278	0	209	190	141	107	
						109	0	57	42	34	41	0	24	20	10	
						10	0	18	9	6	7	9	0	11	4	
						13	4	0	9	9	11	16	0	16	8	
						10	7	5	0	3	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "(DEM_Balloon-Tyler"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "DEM_Balloon_HighQuality"
			Dataset		= "MNT+Ortho_Balloon\Balloon_1_DEM_High_Quality_fixed_Pleiades.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 145:0:28.709894422
			SunAngle	= 43:15:5.349638946
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 91
				MaximumInputValue	= 192.80604553222656
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 153.08834838867187
					MaximumValue	= 85.873703002929687
					CellsBelowMin	= 58388
					CellsAboveMax	= 0
					NrOfCells	= 2492437
					Bins		= {
						5409	12392	17639	28008	27902	30686	32169	42832	50497	44243	
						35648	28511	25582	32299	35823	41105	40857	43883	53136	59391	
						54759	45085	39203	47525	61994	56326	35653	31781	48953	53317	
						117460	80417	65409	48881	47730	49035	46152	39910	33703	36940	
						39109	40422	38378	30921	26969	23473	21329	19903	20657	17650	
						13740	12793	11978	11270	11265	11415	10936	11390	11653	12238	
						10004	10065	9170	9644	9558	9317	8523	8024	7084	7103	
						6512	6614	6728	9069	8590	8027	6215	4267	3405	3319	
						3392	3220	3307	3006	3138	3434	3544	3702	4082	4107	
						4267	3988	3989	3977	4258	4793	4952	4042	4182	4056	
						4170	3599	3939	3936	4263	3795	3485	3425	3304	2848	
						3191	3216	3144	2933	2598	2389	2737	2604	1977	1745	
						1853	1390	844	596	505	601	548	400	447	456	
						577	544	651	632	651	657	378	350	398	516	
						387	148	134	128	140	197	292	316	296	361	
						315	280	202	60	54	37	2	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "(Ortho_Ballon_Chelsea"
		TurnedOff	= Yes
		Transparency	= 0.27999999999999997
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\Ortho_chelsea_balloon_fixed_pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 45:0:0.0
			SunAngle	= 45:0:0.0
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 180
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 304060
					Bins		= {
						12	5	8	0	9	14	13	19	18	0	
						19	21	15	23	0	42	42	48	48	60	
						0	57	80	87	110	0	137	130	181	185	
						231	0	254	265	313	338	0	342	319	340	
						310	0	336	311	339	383	352	0	327	333	
						320	292	0	279	276	266	261	229	0	244	
						289	292	307	0	319	362	341	309	348	0	
						339	418	403	401	0	451	528	511	568	0	
						586	615	598	638	614	0	656	675	724	732	
						0	804	834	885	956	1027	0	1147	1147	1151	
						1321	0	1453	1506	1559	1704	1814	0	1939	2051	
						2145	2310	0	2546	2599	2803	2895	0	3079	3232	
						3417	3507	3767	0	3991	4209	4408	4507	0	4735	
						5006	5258	5925	6113	0	6584	6751	7487	8289	0	
						8746	9525	10174	10700	0	10823	11141	11451	10912	11094	
						0	10589	9609	8524	7533	0	6281	4954	3925	2950	
						2249	0	1569	1192	811	574	0	377	285	190	
						130	83	0	55	22	36	12	0	10	5	
						1	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "(DEM_Ballon_Chelsea"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pseudo Layer"
			Dataset		= "MNT+Ortho_Balloon\dem_chelsea_balloon_fixed_pleiades.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 348:6:40.861184795
			SunAngle	= 52:49:10.182844772
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 194.13101196289062
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 160.77877807617187
					MaximumValue	= 105.22073364257812
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 45808
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	8	44	
						43	49	53	557	909	1672	1516	1224	1392	1700	
						2209	2280	1886	2752	1863	2617	3497	1979	1818	1474	
						1403	1268	1041	976	794	648	537	510	513	432	
						515	362	374	428	436	364	255	216	216	194	
						179	169	186	165	170	163	181	152	193	164	
						160	174	167	159	60	50	46	30	21	17	
						20	13	12	17	19	17	16	14	19	19	
						6	6	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "(Ortho_Balloon-Tyler"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Ortho_Balloon_HighQuality"
			Dataset		= "MNT+Ortho_Balloon\Balloon_1_Ortho_High_Quality_fixed_Pleiades.ers"
			DoStaticShade	= No
			SunAzimuth	= 144:46:56.645005244
			SunAngle	= 50:9:13.109985122
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Red Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 193
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 198
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 3
					NrOfCells	= 3004884
					Bins		= {
						2772	0	0	778	967	1138	0	1299	0	1525	
						0	1752	2115	2481	0	2883	0	3387	3974	0	
						4303	4880	0	0	5247	5915	6425	0	7297	0	
						8083	0	8621	9386	10011	0	10568	0	11193	0	
						11507	12093	12239	0	0	12710	13009	0	13241	13524	
						0	0	13806	13984	14164	14344	0	14204	0	14297	
						0	14412	14369	13967	0	0	13716	14040	0	13931	
						13897	0	0	13536	13541	13848	0	13900	14099	0	
						0	13690	14027	13714	0	13788	0	14035	0	14112	
						14138	14492	14691	0	0	14878	15179	0	15875	15761	
						0	0	16215	16442	16719	0	17174	0	17673	0	
						18073	18502	18680	0	19147	0	19503	0	19932	20430	
						20719	0	0	21417	22126	0	22518	22973	0	23495	
						0	23862	24270	25514	0	25734	0	26678	0	27139	
						27575	28574	0	0	28773	29020	0	29698	29817	0	
						0	30654	30833	31344	0	31745	32230	0	0	32641	
						33308	34409	0	34954	0	35893	36973	0	38207	39354	
						0	0	40852	41915	43108	0	44341	45220	0	0	
						45556	46345	46400	0	46811	0	47210	0	47283	47482	
						46788	0	46903	0	46308	0	46593	45669	45346	0	
						0	43994	42562	40782	0	38914	0	36436	0	33864	
						30730	27618	0	24220	0	20920	0	17841	14835	11978	
						0	0	9279	7112	0	5312	3820	0	0	2695	
						1883	1189	0	796	548	0	0	334	169	100	
						66	0	0	32	16	0	6	3	0	0	
						0	2	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Ortho_Pleiade"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			TurnedOff	= Yes
			Type		= Pseudo
			Description	= "Ortho_544"
			Dataset		= "MNT+Ortho_Pleiade\Ort_544.ers"
			DoStaticShade	= No
			SunAzimuth	= 112:37:11.5018437
			SunAngle	= 81:19:59.987576902
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 77
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			Type		= Pseudo
			Description	= "Ortho_385"
			Dataset		= "MNT+Ortho_Pleiade\Ort_385.ers"
			DoStaticShade	= No
			SunAzimuth	= 112:37:11.5018437
			SunAngle	= 81:19:59.987576902
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 11
				MaximumInputValue	= 71
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 246
					MaximumValue	= 0
					CellsBelowMin	= 4632
					CellsAboveMax	= 5105
					NrOfCells	= 801902
					Bins		= {
						2760	0	0	0	3912	0	0	0	0	5003	
						0	0	0	5830	0	0	0	6482	0	0	
						0	7216	0	0	0	0	8136	0	0	0	
						9330	0	0	0	10873	0	0	0	12631	0	
						0	0	0	14871	0	0	0	17135	0	0	
						0	19747	0	0	0	20223	0	0	0	0	
						21634	0	0	0	21662	0	0	0	22048	0	
						0	0	21962	0	0	0	0	21249	0	0	
						0	20399	0	0	0	20002	0	0	0	19652	
						0	0	0	0	19150	0	0	0	18831	0	
						0	0	18506	0	0	0	18521	0	0	0	
						0	18957	0	0	0	18646	0	0	0	19069	
						0	0	0	19185	0	0	0	0	19248	0	
						0	0	19351	0	0	0	19599	0	0	0	
						19778	0	0	0	0	19366	0	0	0	20717	
						0	0	0	19168	0	0	0	19075	0	0	
						0	0	18563	0	0	0	17631	0	0	0	
						17172	0	0	0	15817	0	0	0	0	14863	
						0	0	0	13554	0	0	0	12057	0	0	
						0	10961	0	0	0	0	9763	0	0	0	
						8281	0	0	0	7147	0	0	0	5799	0	
						0	0	0	4799	0	0	0	3842	0	0	
						0	3013	0	0	0	2367	0	0	0	0	
						1863	0	0	0	1420	0	0	0	1035	0	
						0	0	818	0	0	0	0	610	0	0	
						0	499	0	0	0	367	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
		Stream Begin
			TurnedOff	= Yes
			Type		= Pseudo
			Description	= "Ortho_063"
			Dataset		= "MNT+Ortho_Pleiade\Ort_063.ers"
			DoStaticShade	= No
			SunAzimuth	= 112:37:11.5018437
			SunAngle	= 81:19:59.987576902
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 0
				MaximumInputValue	= 255
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 255
					MaximumValue	= 0
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2834676
					Bins		= {
						65	7	12	13	19	24	24	47	56	116	
						573	7823	55530	84560	51195	27615	21415	17271	16181	15351	
						14842	16006	15129	16213	17568	19658	22350	22770	24562	27016	
						29580	35115	36278	40385	45363	50586	59713	61567	66367	71653	
						75224	78449	86271	80315	78849	77156	73769	75420	66515	62760	
						59726	56295	57359	49261	46480	42855	39696	39594	34560	32720	
						31117	29632	30822	27529	26591	25712	24692	24114	24757	22272	
						21700	21030	20174	20748	18672	17936	17017	16321	16638	14896	
						13869	13052	12221	12204	10677	9877	9281	8341	8045	6887	
						6132	5478	4932	4257	3989	3276	2874	2368	2018	1769	
						1589	1312	1297	1148	1071	892	758	652	592	567	
						442	403	404	326	343	284	280	242	255	262	
						247	240	262	232	234	260	247	225	214	221	
						230	230	227	243	247	273	213	243	247	278	
						224	245	223	218	223	186	233	187	225	217	
						236	203	205	206	212	190	215	199	201	188	
						216	219	220	221	197	223	217	219	238	249	
						253	216	255	246	246	293	240	252	237	272	
						255	281	268	283	268	276	281	281	276	270	
						201	198	183	141	156	138	102	118	139	107	
						102	114	89	107	116	88	93	110	106	111	
						111	80	103	99	99	105	103	112	106	108	
						108	101	110	120	127	110	135	113	93	113	
						107	89	91	94	76	75	75	60	75	71	
						72	63	69	64	80	79	79	54	80	64	
						77	61	68	51	43	739	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
	Surface Begin
		Name		= "Pleiade_DEM"
		TurnedOff	= Yes
		Transparency	= 0
		ColorMode	= PSEUDO
		LookupTable	= "greyscale"
		Stream Begin
			Type		= Pseudo
			Description	= "Pleiade_DEM"
			Dataset		= "MNT+Ortho_Pleiade\DEM_granite_dells_d3_resol_7500_regul_02_1t.ers"
			DoStaticShade	= Yes
			SunAzimuth	= 86:12:39.996208033
			SunAngle	= 31:17:38.747338303
			StreamInput Begin
				StreamInputID	= 1
			StreamInput End
			Formula Begin
				Description	= "Default Formula"
				Formula		= "INPUT1"
				FormulaArg Begin
					StreamInput	= 1
					BandNumber	= 1
					BandId Begin
						Value		= "Pseudo Layer"
					BandId End
				FormulaArg End
			Formula End
			Transform Begin
				Type		= Linear
				MinimumInputValue	= 21.95050048828125
				MaximumInputValue	= 132.13758850097656
				MinimumOutputValue	= 0
				MaximumOutputValue	= 255
				LinearDef Begin
					NumberOfPoints	= 2
					Points		= {
						0.000000	0.000000	
						1.000000	1.000000	
					}
				LinearDef End
				Histogram Begin
					MinimumValue	= 87.459403991699219
					MaximumValue	= 31.496555328369141
					CellsBelowMin	= 0
					CellsAboveMax	= 0
					NrOfCells	= 2657532
					Bins		= {
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	1	0	1	2	13	127	253	296	
						437	1147	1261	1527	2301	3402	7047	7299	7248	10081	
						12072	11367	13611	15090	13428	16334	16397	14608	17626	17894	
						16357	17471	15437	14354	16064	15732	15975	16732	15572	17690	
						20425	17995	21402	21603	19355	21483	22492	21369	26209	30416	
						29860	42529	49059	36175	45861	60442	48102	51617	46360	39465	
						46349	49143	47634	68455	66005	54162	59944	53701	46391	49664	
						42212	39585	43529	38997	36751	38292	32159	31455	32284	28572	
						32699	35621	28144	30709	33611	28485	32393	31609	24311	27027	
						25034	19471	17781	17481	16211	18043	17811	16632	23356	23260	
						19643	23729	19089	15048	15314	13565	11699	11484	10647	9423	
						10383	7674	7345	7107	6395	6319	5248	4021	4014	4160	
						2863	2581	2290	1647	2432	1385	791	1241	530	4	
						2	9	4	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	0	0	0	0	
						0	0	0	0	0	0	
					}
				Histogram End
				DoInRealtime	= No
			Transform End
		Stream End
	Surface End
Algorithm End
