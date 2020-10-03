@echo off
echo +------------------------------------------------+
echo ! - yahoo60m.bat                                 !
echo ! - yahoo60m.sas                                 !
echo ! junyong                                        !
echo ! 201002                                         !
echo +------------------------------------------------+
echo ! these files use sas to download                !
echo !  - 60 monthly stock returns                    !
echo !  - market returns (sp 500)                     !
echo !  - riskfree rates (tbill 13)                   !
echo ! from yahoo to the desktop                      !
echo +------------------------------------------------+
echo ! please input                                   !
echo !  - non-spaced FILENAME [ex. name_no_space]     !
echo !  - spaced TICKERs [ex. ba dis ko]              !
echo !  - the last DATE [ex. 2oct2020]                !
echo ! to download the csv data                       !
echo +------------------------------------------------+
echo ! - TYPE exit TO EXIT                            !
echo ! - FOLLOW THE TYPING RULES TO AVOID ERRORS      !
echo ! - LOCATE THE TWO FILES TO THE DESKTOP          !
echo +------------------------------------------------+
set /p f=file [ex. filename_without_space]=
if "%f%"=="exit" (exit) else (set /p t=ticker [ex. ba dis ko]=)
if "%t%"=="exit" (exit) else (set /p d=date [ex. 2oct2020]=)
if "%d%"=="exit" (exit) else ("%programfiles%\sashome\sasfoundation\9.4\sas.exe" "%userprofile%\desktop\yahoo60m.sas" -set f '%f%' -set t '%t%' -set d '%d%' -nosplash -icon -nolog)
