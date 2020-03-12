/*************************************************
kozak
ludvigson shiller nagel polk
michigan ritter koijen
*************************************************/
libname h "!userprofile\desktop\pincette\http\";

%macro http(filename,url);

filename j "!userprofile\desktop\pincette\&filename.";

proc http url="&url." out=j;
run;

%mend;

%http(http\Betting-Against-Beta-Equity-Factors-Daily.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Betting-Against-Beta-Equity-Factors-Daily.xlsx)
%http(http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Betting-Against-Beta-Equity-Factors-Monthly.xlsx)
%http(http\Quality-Minus-Junk-Factors-Daily.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Quality-Minus-Junk-Factors-Daily.xlsx)
%http(http\Quality-Minus-Junk-Factors-Monthly.xlsx,https://images.aqr.com/-/media/AQR/Documents/Insights/Data-Sets/Quality-Minus-Junk-Factors-Monthly.xlsx)

%http(http\M4.csv,http://finance.wharton.upenn.edu/~stambaug/M4.csv)
%http(http\M4d.csv,http://finance.wharton.upenn.edu/~stambaug/M4d.csv)

%http(http\FTS_Dummies.xls,http://sites.google.com/site/lievenbaele/FTS_Dummies.xls)

%http(http\CONSUMPTION_DATA_2018.xls,https://drive.google.com/uc?id=1AdOENh6SFIfzaA724iUosfBvl7M8xI8Z)

%http(http\cay_current.csv,https://drive.google.com/uc?id=1iju5xUGE0l7ZnFHMZtFDzunI0V85Zi5y)

%http(http\monthly_risk_aversion_BEX_20181031.xlsx,https://00d45e45-360f-43e4-a918-f4397267026f.filesusr.com/ugd/efd0b7_2b80487ed59b44928d2cfdca41d55b55.xlsx?dn=monthly_risk_aversion_BEX_20181031.xlsx)
%http(http\daily_risk_aversion_BEX_20181101.xlsx,https://00d45e45-360f-43e4-a918-f4397267026f.filesusr.com/ugd/efd0b7_3ddfcdd9a16a4a0d80e42c8d5aaa5437.xlsx?dn=daily_risk_aversion_BEX_20181101.xlsx)
%http(http\monthly_economic_uncertainty_BEX_2019012.xlsx,https://00d45e45-360f-43e4-a918-f4397267026f.filesusr.com/ugd/efd0b7_b5530f5233ee44c499683dce57e01c1e.xlsx?dn=monthly_economic_uncertainty_BEX_2019012.xlsx)
%http(http\daily_economic_uncertainty_BEX_20190124.xlsx,https://00d45e45-360f-43e4-a918-f4397267026f.filesusr.com/ugd/efd0b7_30fa3107998345628d4d9117bdb9bdbf.xlsx?dn=daily_economic_uncertainty_BEX_20190124.xlsx)

%http(http\dmrs_factor_portfolios_monthly.txt,http://www.kentdaniel.net/data/dmrs/dmrs_factor_portfolios_monthly.txt)
%http(http\dmrs_factor_portfolios_daily.txt,http://www.kentdaniel.net/data/dmrs/dmrs_factor_portfolios_daily.txt)
%http(http\dmrs_hedge_portfolios_monthly.txt,http://www.kentdaniel.net/data/dmrs/dmrs_hedge_portfolios_monthly.txt)
%http(http\dmrs_hedge_portfolios_daily.txt,http://www.kentdaniel.net/data/dmrs/dmrs_hedge_portfolios_daily.txt)
%http(http\DHS_factors.xlsx,http://www.kentdaniel.net/data/DHS_factors.xlsx)

%http(http\UMO_monthly_2016.xlsx,https://drive.google.com/uc?id=1pkF5ZTv-NroqUzQNzaoCaZL5qJKDUFA7)
%http(http\UMO_daily_2016.xlsx,https://drive.google.com/uc?id=1mn2MCq-AdI6lnG-9fOwL31NpX0WrWLZx)
