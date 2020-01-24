resetline;

proc printto log="!userprofile\desktop\devour\lettau.txt";
run;

option dlcreatedir;
libname l "!userprofile\desktop\devour\lettau\";
option nodlcreatedir;

filename c "!userprofile\desktop\cay_current.csv";

proc http url="https://drive.google.com/u/0/uc?id=1upTaL-6iv-9BI8TI_qgKxyCMk1nkVX7L" out=c;
run;

data l.cay_current;
	infile c dsd truncover firstobs=3;
	input date c a y cay;
run;

filename c "!userprofile\desktop\cay_ms_current.csv";

proc http url="https://drive.google.com/u/0/uc?id=1hzhSVWLOEIiRIo4Tbttd0NyTQts2T4Gp" out=c;
run;

data l.cay_ms_current;
	infile c dsd truncover firstobs=2;
	input date cay_ms_all_sm_mo cay_ms_all_sp_mo c w y;
run;

libname l;
filename c;

proc printto;
run;
