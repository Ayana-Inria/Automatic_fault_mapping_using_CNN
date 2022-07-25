@ECHO OFF
set to_convert_directory="to_convert"
set converted_directory="converted"

for %%f in (.\%to_convert_directory%\*.shp) do (
	echo Converting %%~nf
	C:\Python27\python.exe Convert_Shapefile_to_ERV_standalone.py %to_convert_directory%\%%~nf %converted_directory%\%%~nf 
	)
pause