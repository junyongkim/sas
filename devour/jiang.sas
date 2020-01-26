resetline;

proc printto log="!userprofile\desktop\devour\jiang.txt";
run;

option dlcreatedir;
libname j "!userprofile\desktop\devour\jiang\";
filename x "!userprofile\desktop\devour\jiang\_UMO_monthly_2016.xlsx";

proc http url="https://drive.google.com/uc?id=1pkF5ZTv-NroqUzQNzaoCaZL5qJKDUFA7" out=x;
run;

proc import file=x dbms=xlsx replace out=j.umo_monthly_2016;
	sheet="umo";
run;

filename x "!userprofile\desktop\devour\jiang\_UMO_daily_2016.xlsx";

proc http url="https://drive.google.com/uc?id=1mn2MCq-AdI6lnG-9fOwL31NpX0WrWLZx" out=x;
run;

proc import file=x dbms=xlsx replace out=j.umo_daily_2016;
	sheet="umo_daily";
run;

option nodlcreatedir;
libname j;
filename x;

proc printto;
run;
