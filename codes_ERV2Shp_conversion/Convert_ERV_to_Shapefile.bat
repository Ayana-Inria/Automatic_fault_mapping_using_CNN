@ECHO OFF
set to_convert_directory="to_convert"
set converted_directory="converted"

for %%f in (.\%to_convert_directory%\*.erv) do (
	echo Converting %%~nf
	C:\Users\amercier\AppData\Local\Microsoft\WindowsApps\python.exe Convert_ERV_to_Shapefile_standalone.py %to_convert_directory%\%%~nf %converted_directory%\%%~nf 
	)
pause