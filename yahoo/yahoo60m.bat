@echo off
echo +------------------------------------------------+
echo ! yahoo60m.bat and yahoo60m.sas                  !
echo ! junyong kim                                    !
echo ! 201002                                         !
echo +------------------------------------------------+
echo ! these files use sas to download 60 monthly     !
echo ! returns from yahoo to the desktop              !
echo +------------------------------------------------+
echo ! LOCATE THESE FILES TO THE DESKTOP              !
echo +------------------------------------------------+
set /p f=file [ex. filename_without_space]=
if "%f%"=="exit" (exit) else (set /p t=ticker [ex. ba dis ko]=)
if "%t%"=="exit" (exit) else (set /p d=date [ex. 2oct2020]=)
if "%d%"=="exit" (exit) else ("%programfiles%\sashome\sasfoundation\9.4\sas.exe" "%userprofile%\desktop\yahoo60m.sas" -set f '%f%' -set t '%t%' -set d '%d%' -nosplash -icon -nolog)
