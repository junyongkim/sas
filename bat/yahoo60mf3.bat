@echo off
echo +-------------------------------------------------------------------------+
echo ! yahoo60mf3.bat, yahoo60mf3.sas                                          !
echo ! junyong                                                                 !
echo ! 201003                                                                  !
echo +-------------------------------------------------------------------------+
echo ! these files use sas to download                                         !
echo !  - 60 monthly stock returns                                             !
echo !  - fama-french 3 factors [cons mktrf smb hml rf]                        !
echo ! from yahoo and french to the desktop                                    !
echo +-------------------------------------------------------------------------+
echo ! to download the csv data, input                                         !
echo !  - FILENAME [ex. hello world]                                           !
echo !  - spaced TICKERs [ex. ba dis ko]                                       !
echo !  - the last DATE [ex. 2oct2020]                                         !
echo +-------------------------------------------------------------------------+
echo ! - TYPE exit TO EXIT                                                     !
echo ! - FOLLOW THE TYPING RULES TO AVOID ERRORS                               !
echo +-------------------------------------------------------------------------+
echo ! - THE LAST MONTH-END FAMA-FRENCH FACTORS ARE OFTEN IMPOSSIBLE           !
echo +-------------------------------------------------------------------------+
set /p f=file [ex. filename_without_space]=
if "%f%"=="exit" (exit) else (set /p t=ticker [ex. ba dis ko]=)
if "%t%"=="exit" (exit) else (set /p d=date [ex. 2oct2020]=)
if "%d%"=="exit" (exit) else (^
  "%programfiles%\sashome\sasfoundation\9.4\sas.exe"^
  "%userprofile%\desktop\sas\bat\yahoo60mf3.sas" -set f "%f%" -set t "%t%" -set^
  d %d% -nosplash -icon -nolog)
