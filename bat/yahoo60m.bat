@echo off
echo +-------------------------------------------------------------------------+
echo ! yahoo60m.bat, yahoo60m.sas                                              !
echo ! junyong                                                                 !
echo ! 201002                                                                  !
echo +-------------------------------------------------------------------------+
echo ! these files use sas to download                                         !
echo !  - 60 monthly stock returns                                             !
echo !  - market returns [sp500], risk-free rates [tbill13]                    !
echo ! from yahoo to the desktop                                               !
echo +-------------------------------------------------------------------------+
echo ! to download the csv data, input                                         !
echo !  - FILENAME [ex. hello world]                                           !
echo !  - spaced TICKERs [ex. ba dis ko]                                       !
echo !  - the last DATE [ex. 2oct2020]                                         !
echo +-------------------------------------------------------------------------+
echo ! - TYPE exit TO EXIT                                                     !
echo ! - FOLLOW THE TYPING RULES TO AVOID ERRORS                               !
echo +-------------------------------------------------------------------------+
set /p f=file [ex. hello world]=
if "%f%"=="exit" (exit) else (set /p t=ticker [ex. ba dis ko]=)
if "%t%"=="exit" (exit) else (set /p d=date [ex. 2oct2020]=)
if "%d%"=="exit" (exit) else (^
  "%programfiles%\sashome\sasfoundation\9.4\sas.exe"^
  "%userprofile%\desktop\sas\bat\yahoo60m.sas" -nosplash -icon -nolog -set f^
  "%f%" -set t "%t%" -set d %d%)
