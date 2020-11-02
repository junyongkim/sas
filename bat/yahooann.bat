@echo off
echo +-------------------------------------------------------------------------+
echo ! yahooann.bat, yahooann.sas                                              !
echo ! junyong                                                                 !
echo ! 201101                                                                  !
echo +-------------------------------------------------------------------------+
echo ! these files use sas to download                                         !
echo !  - annual stock returns                                                 !
echo !  - market returns [sp500], risk-free rates [tb13]                       !
echo ! from yahoo to the desktop                                               !
echo +-------------------------------------------------------------------------+
echo ! to download the csv data, input                                         !
echo !  - FILENAME [ex. hello world]                                           !
echo !  - spaced TICKERs [ex. ba dis ko]                                       !
echo +-------------------------------------------------------------------------+
echo ! - TYPE exit TO EXIT                                                     !
echo ! - FOLLOW THE TYPING RULES TO AVOID ERRORS                               !
echo +-------------------------------------------------------------------------+
set /p f=file [ex. hello world]=
if "%f%"=="exit" (exit) else (set /p t=ticker [ex. ba dis ko]=)
if "%d%"=="exit" (exit) else (^
  "%programfiles%\sashome\sasfoundation\9.4\sas.exe"^
  "%userprofile%\desktop\sas\bat\yahooann.sas" -nosplash -icon -nolog -set f^
  "%f%" -set t "%t%")
