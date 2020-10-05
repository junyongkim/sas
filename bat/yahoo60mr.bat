@echo off
echo +-------------------------------------------------------------------------+
echo ! yahoo60mr.bat, yahoo60mr.R                                              !
echo ! junyong                                                                 !
echo ! 201003                                                                  !
echo +-------------------------------------------------------------------------+
echo ! these files use R to download                                           !
echo !  - 60 monthly stock returns                                             !
echo !  - market returns [sp500], riskfree rates [tb13]                        !
echo ! from yahoo to the desktop                                               !
echo +-------------------------------------------------------------------------+
echo ! to download the csv data, input                                         !
echo !  - FILENAME [ex. hello world]                                           !
echo !  - spaced TICKERs [ex. ba dis ko]                                       !
echo !  - the last DATE [ex. 2020-10-03]                                       !
echo +-------------------------------------------------------------------------+
echo ! - TYPE exit TO EXIT                                                     !
echo ! - FOLLOW THE TYPING RULES TO AVOID ERRORS                               !
echo +-------------------------------------------------------------------------+
set /p f=file [ex. hello world]=
if "%f%"=="exit" (exit) else (set /p t=ticker [ex. ba dis ko]=)
if "%t%"=="exit" (exit) else (set /p d=date [ex. 2020-10-03]=)
if "%d%"=="exit" (exit) else (^
  "%userprofile%\desktop\apps\r-portable\app\r-portable\bin\rscript"^
  "%userprofile%\desktop\yahoo60mr.R" "%f%" %d% %t%)
