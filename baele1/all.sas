option dlcreatedir;
libname b "!userprofile\desktop\baele1\";
option nodlcreatedir;
filename f temp;

proc http url="https://sites.google.com/site/lievenbaele/FTS_Dummies.xls" out=f;
run;

proc import file=f dbms=xls replace out=f;
	sheet="data";
run;

proc transpose out=f;
	by dates;
	var us--pt;
run;

data f;
	set f;
	DATE=input(put(dates,yymmddn8.),8.);
	if col1^="NaN" then col=col1+0;
run;

proc transpose data=f(drop=_label_) out=b.fts_dummy(drop=_name_);
	by date;
	var col;
run;
