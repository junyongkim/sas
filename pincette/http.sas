libname h "!userprofile\desktop\pincette\http\";

%macro http(filename,url);

filename j "!userprofile\desktop\pincette\http\&filename.";

proc http url="&url." out=j;
run;

%mend;

%http(Betting-Against-Beta-Equity-Factors-Daily.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Betting-Against-Beta-Equity-Factors-Daily.xlsx)
%http(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Betting-Against-Beta-Equity-Factors-Monthly.xlsx)
%http(Quality-Minus-Junk-Factors-Daily.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Quality-Minus-Junk-Factors-Daily.xlsx)
%http(Quality-Minus-Junk-Factors-Monthly.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Quality-Minus-Junk-Factors-Monthly.xlsx)

%http(M4.csv,http://finance.wharton.upenn.edu/~stambaug/M4.csv)
%http(M4d.csv,http://finance.wharton.upenn.edu/~stambaug/M4d.csv)

%http(FTS_Dummies.xls,http://sites.google.com/site/lievenbaele/FTS_Dummies.xls)

%http(CONSUMPTION_DATA_2018.xls,https://drive.google.com/uc?id=1AdOENh6SFIfzaA724iUosfBvl7M8xI8Z)

%http(cay_current.csv,https://drive.google.com/uc?id=1iju5xUGE0l7ZnFHMZtFDzunI0V85Zi5y)
