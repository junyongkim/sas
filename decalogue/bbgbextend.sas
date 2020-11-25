/*************************************************
bbgbextend
extends campbell vuolteenaho rme ty pe vs
*************************************************/
/*downloads french rme*/
filename a "%sysfunc(getoption(work))\a";

proc http out=a
	url="http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/F-F_Research_Data_Factors_CSV.zip";
run;

filename a zip "%sysfunc(getoption(work))\a";

data _01;
	infile a(F-F_Research_Data_Factors.CSV) dsd truncover;
	input time mktrf smb hml rf;
	if time<lag(time) then _+1;
	if time>0;
run;

/*downloads fred ty*/
data _02;
	infile "http://fred.stlouisfed.org/graph/fredgraph.csv?id=gs10" url dsd truncover;
	input time yymmdd10. +1 gs10;
	time=input(put(time,yymmn6.),6.);
	if time>0;
run;

data _03;
	infile "http://fred.stlouisfed.org/graph/fredgraph.csv?id=gs3" url dsd truncover;
	input time yymmdd10. +1 gs3;
	time=input(put(time,yymmn6.),6.);
	if time>0;
run;

data _04;
	infile "http://fred.stlouisfed.org/graph/fredgraph.csv?id=gs1" url dsd truncover;
	input time yymmdd10. +1 gs1;
	time=input(put(time,yymmn6.),6.);
	if time>0;
run;

/*downloads shiller pe*/
filename b "%sysfunc(getoption(work))\b";

proc http out=b
	url="http://www.econ.yale.edu/~shiller/data/ie_data.xls";
run;

proc import file=b dbms=xls out=_05 replace;
	sheet="Data";
run;

proc transpose out=_05;
	where substr(a,1,1) in ("1","2");
	by a;
	var _all_;
run;

data _05;
	set _05;
	time=input(a,16.)*100;
	if col1 not in ("",".","NA") then col2=input(col1,16.);
run;

proc transpose out=_05(drop=a _name_);
	by time;
	var col2;
run;

/*downloads french vs*/
filename c "%sysfunc(getoption(work))\c";

proc http out=c
	url="http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/6_Portfolios_2x3_CSV.zip";
run;

filename c zip "%sysfunc(getoption(work))\c";

data _06;
	infile c(6_Portfolios_2x3.CSV) dsd truncover;
	input time sl sm sh bl bm bh;
	if time<lag(time) then _+1;
	if time>0;
run;

/*merges rme ty pe vs*/
data _07;
	merge bbgbdata(rename=(date=time rm=rm0 ty=ty0 pe=pe0 vs=vs0))
		_01(where=(_=0))
		_02
		_03
		_04
		_05
		_06(keep=time _ sl sh rename=(sl=sl_ sh=sh_) where=(_=7))
		_06(where=(_=0));
	by time;
	rm=log(1+mktrf/100);
	ty=gs10-mean(gs3,gs1);
	pe=log(m);
	retain vs;
	if mod(time,100)=7 then vs=log(sh_/sl_);
	vs=vs+log(1+sl/100)-log(1+sh/100);
	time2=input(put(time,6.),yymmn6.);
run;

data bbgbextend(rename=(time=date));
	set _07;
	where sum(rm,ty,pe,vs)>.;
	keep time rm ty pe vs;
run;

proc delete data=_01-_07;
run;

quit;
