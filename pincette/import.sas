libname i "!userprofile\desktop\pincette\import\";

%macro import(file,dbms,out,range,delimiter);

proc import file="!userprofile\desktop\pincette\http\&file." dbms=&dbms. replace out=i.&out.;
	%if %length(&range.)>0 %then %do;
	range="&range.";
	%end;
	%if %length(&delimiter.)>0 %then %do;
	delimiter=&delimiter.;
	%end;
run;

%mend;

%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,babefd_bab,BAB Factors$A19:AD23693)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,babefd_mkt,MKT$A19:AD25002)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,babefd_smb,SMB$A19:AD25002)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,babefd_hml,HML FF$A19:AD25022)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,babefd_hmd,HML Devil$A19:AD25022)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,babefd_umd,UMD$A19:AD24852)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,babefd_rf,RF$A19:B25589)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_bab,BAB Factors$A19:AD1089)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_mkt,MKT$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_smb,SMB$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_hml,HML FF$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_hmd,HML Devil$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_umd,UMD$A19:AD1136)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_me,ME(t-1)$A19:AD1143)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,babefm_rf,RF$A19:B1143)
%import(Quality-Minus-Junk-Factors-Daily.xlsx,xlsx,qmjfd,QMJ Factors$A19:AD16093)
%import(Quality-Minus-Junk-Factors-Monthly.xlsx,xlsx,qmjfm,QMJ Factors$A19:AD770)

%import(M4.csv,csv,m4)
%import(M4d.csv,csv,m4d)

%import(FTS_Dummies.xls,xls,fts_dummies,data$A1:X9266)

%import(CONSUMPTION_DATA_2018.xls,xls,consumption_data_2018_a,ANNUAL_FREQUENCY$A1:O92)
%import(CONSUMPTION_DATA_2018.xls,xls,consumption_data_2018_q,QUARTERLY_FREQUENCY$A1:J281)

%import(cay_current.csv,csv,cay_current)

%import(monthly_risk_aversion_BEX_20181031.xlsx,xlsx,bexmra,Monthly Risk Aversion Index$A1:B346)
%import(daily_risk_aversion_BEX_20181101.xlsx,xlsx,bexdra,Sheet1$A1:B7641)
%import(monthly_economic_uncertainty_BEX_2019012.xlsx,xlsx,bexmeu,Sheet1$A1:B346)
%import(daily_economic_uncertainty_BEX_20190124.xlsx,xlsx,bexdeu,Sheet1$A1:B7641)

%import(dmrs_factor_portfolios_monthly.txt,dlm,dmrs_factor_portfolios_monthly,,"09"x)
%import(dmrs_factor_portfolios_daily.txt,dlm,dmrs_factor_portfolios_daily,,"09"x)
%import(dmrs_hedge_portfolios_monthly.txt,dlm,dmrs_hedge_portfolios_monthly,,"09"x)
%import(dmrs_hedge_portfolios_daily.txt,dlm,dmrs_hedge_portfolios_daily,,"09"x)
