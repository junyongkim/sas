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
