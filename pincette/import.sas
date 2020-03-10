libname i "!userprofile\desktop\pincette\import\";

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Daily.xlsx" dbms=xlsx replace out=i.babefd_bab;
	range="BAB Factors$A19:AD23693";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Daily.xlsx" dbms=xlsx replace out=i.babefd_mkt;
	range="MKT$A19:AD25002";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Daily.xlsx" dbms=xlsx replace out=i.babefd_smb;
	range="SMB$A19:AD25002";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Daily.xlsx" dbms=xlsx replace out=i.babefd_hml;
	range="HML FF$A19:AD25022";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Daily.xlsx" dbms=xlsx replace out=i.babefd_hmd;
	range="HML Devil$A19:AD25022";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Daily.xlsx" dbms=xlsx replace out=i.babefd_umd;
	range="UMD$A19:AD24852";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Daily.xlsx" dbms=xlsx replace out=i.babefd_rf;
	range="RF$A19:B25589";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_bab;
	range="BAB Factors$A19:AD1089";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_mkt;
	range="MKT$A19:AD1142";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_smb;
	range="SMB$A19:AD1142";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_hml;
	range="HML FF$A19:AD1142";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_hmd;
	range="HML Devil$A19:AD1142";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_umd;
	range="UMD$A19:AD1136";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_me;
	range="ME(t-1)$A19:AD1143";
run;

proc import file="!userprofile\desktop\pincette\http\Betting-Against-Beta-Equity-Factors-Monthly.xlsx" dbms=xlsx replace out=i.babefm_rf;
	range="RF$A19:B1143";
run;

proc import file="!userprofile\desktop\pincette\http\Quality-Minus-Junk-Factors-Daily.xlsx" dbms=xlsx replace out=i.qmjfd;
	range="QMJ Factors$A19:AD16093";
run;

proc import file="!userprofile\desktop\pincette\http\Quality-Minus-Junk-Factors-Monthly.xlsx" dbms=xlsx replace out=i.qmjfm;
	range="QMJ Factors$A19:AD770";
run;
