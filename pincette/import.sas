libname i "!userprofile\desktop\pincette\import\";

%macro import(file,dbms,out,range,delimiter);

proc import file="!userprofile\desktop\pincette\http\&file." dbms=&dbms. replace out=&out.;
	%if %length(&range.)>0 %then %do;
	range="&range.";
	%end;
	%if %length(&delimiter.)>0 %then %do;
	delimiter=&delimiter.;
	%end;
run;

%mend;

%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,i.babefd_bab,BAB Factors$A19:AD23693)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,i.babefd_mkt,MKT$A19:AD25002)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,i.babefd_smb,SMB$A19:AD25002)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,i.babefd_hml,HML FF$A19:AD25022)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,i.babefd_hmd,HML Devil$A19:AD25022)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,i.babefd_umd,UMD$A19:AD24852)
%import(Betting-Against-Beta-Equity-Factors-Daily.xlsx,xlsx,i.babefd_rf,RF$A19:B25589)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_bab,BAB Factors$A19:AD1089)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_mkt,MKT$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_smb,SMB$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_hml,HML FF$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_hmd,HML Devil$A19:AD1142)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_umd,UMD$A19:AD1136)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_me,ME(t-1)$A19:AD1143)
%import(Betting-Against-Beta-Equity-Factors-Monthly.xlsx,xlsx,i.babefm_rf,RF$A19:B1143)
%import(Quality-Minus-Junk-Factors-Daily.xlsx,xlsx,i.qmjfd,QMJ Factors$A19:AD16093)
%import(Quality-Minus-Junk-Factors-Monthly.xlsx,xlsx,i.qmjfm,QMJ Factors$A19:AD770)

%import(M4.csv,csv,i.m4)
%import(M4d.csv,csv,i.m4d)

%import(FTS_Dummies.xls,xls,i.fts_dummies,data$A1:X9266)

%import(CONSUMPTION_DATA_2018.xls,xls,i.consumption_data_2018_a,ANNUAL_FREQUENCY$A1:O92)
%import(CONSUMPTION_DATA_2018.xls,xls,i.consumption_data_2018_q,QUARTERLY_FREQUENCY$A1:J281)

%import(cay_current.csv,csv,i.cay_current)

%import(monthly_risk_aversion_BEX_20181031.xlsx,xlsx,i.bexmra,Monthly Risk Aversion Index$A1:B346)
%import(daily_risk_aversion_BEX_20181101.xlsx,xlsx,i.bexdra,Sheet1$A1:B7641)
%import(monthly_economic_uncertainty_BEX_2019012.xlsx,xlsx,i.bexmeu,Sheet1$A1:B346)
%import(daily_economic_uncertainty_BEX_20190124.xlsx,xlsx,i.bexdeu,Sheet1$A1:B7641)

%import(dmrs_factor_portfolios_monthly.txt,dlm,i.dmrs_factor_portfolios_monthly,,"09"x)
%import(dmrs_factor_portfolios_daily.txt,dlm,i.dmrs_factor_portfolios_daily,,"09"x)
%import(dmrs_hedge_portfolios_monthly.txt,dlm,i.dmrs_hedge_portfolios_monthly,,"09"x)
%import(dmrs_hedge_portfolios_daily.txt,dlm,i.dmrs_hedge_portfolios_daily,,"09"x)
%import(DHS_factors.xlsx,xlsx,i.dhs_factors,DHS factors$A1:C559)

%import(UMO_monthly_2016.xlsx,xlsx,i.umo_monthly,UMO$A1:E535)
%import(UMO_daily_2016.xlsx,xlsx,i.umo_daily,UMO_daily$A1:D11266)
