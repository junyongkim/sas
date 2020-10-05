@echo off
echo +-------------------------------------------------------------------------+
echo ! yaho.bat                                                                !
echo ! junyong                                                                 !
echo ! 201005                                                                  !
echo +-------------------------------------------------------------------------+
echo ! this file uses curl to download price data from yahoo to the desktop    !
echo +-------------------------------------------------------------------------+
echo ! to download the csv data, input                                         !
echo !  - FILENAME [ex. disney]                                                !
echo !  - TICKER [ex. dis]                                                     !
echo !  - INTERVAL [ex. 1mo 1wk 1d]                                            !
echo +-------------------------------------------------------------------------+
echo ! - USE percent five e FOR THE CARAT IN TICKER                            !
echo ! - TYPE exit TO EXIT                                                     !
echo ! - FOLLOW THE TYPING RULES TO AVOID ERRORS                               !
echo +-------------------------------------------------------------------------+
set /p i=file [ex. disney]? 
if "%i%"=="exit" (exit) else (set /p j=ticker [ex. dis]? )
if "%j%"=="exit" (exit) else (set /p k=output [ex. 1mo 1wk 1d]? )
if "%k%"=="exit" (exit) else ("%userprofile%\desktop\apps\curl-7.72.0-win64-mingw\bin\curl.exe" "https://query1.finance.yahoo.com/v7/finance/download/%j%?period1=-2177452800&period2=4133980799&interval=%k%" --output "%userprofile%\desktop\%i%.csv")
