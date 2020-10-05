@echo off
echo +-------------------------------------------------------------------------+
echo ! fred.bat, fred.sas                                                      !
echo ! junyong                                                                 !
echo ! 2010004                                                                 !
echo +-------------------------------------------------------------------------+
echo ! these files use sas to download data from fred to desktop               !
echo +-------------------------------------------------------------------------+
echo ! to download the csv data, input                                         !
echo !  - FILENAME [ex. hello world]                                           !
echo !  - spaced IDs [ex. will5000indfc indpro usrecm]                         !
echo +-------------------------------------------------------------------------+
echo ! - TYPE exit TO EXIT                                                     !
echo ! - FOLLOW THE TYPING RULES TO AVOID ERRORS                               !
echo +-------------------------------------------------------------------------+
set /p f=file [ex. hello world]=
if "%f%"=="exit" (exit) else (set /p i=id [ex. will5000indfc indpro usrecm]=)
if "%i%"=="exit" (exit) else (^
  "%programfiles%\sashome\sasfoundation\9.4\sas.exe"^
  "%userprofile%\desktop\sas\bat\fred.sas" -nosplash -icon -nolog -set f "%f%"^
  -set i "%i%")
