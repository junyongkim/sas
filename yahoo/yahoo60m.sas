%let f=%sysget(f).csv;
%let t=%sysget(t);
%let d="%sysget(d)"d;

data i;
	input @@;
	_infile_=resolve(_infile_);
	input t $ @@;
	if &d.=intnx("mon",&d.,0,"e") then do;
		p=intnx("mon",&d.,-60);
		q=&d.;
	end;
	else do;
		p=intnx("mon",&d.,-61);
		q=intnx("mon",&d.,-1,"e");
	end;
	f=compress("https://"||
		"query1.finance.yahoo.com/"||
		"v7/finance/download/"||
		t||
		"?period1="||
		dhms(p,0,0,0)-315619200||
		'&period2='||
		dhms(q,23,59,59)-315619200||
		'&interval=1mo');
	infile _ url filevar=f firstobs=2 dsd end=e;
	do until(e);
		input d yymmdd10. +1 o h l c a v;
		output;
	end;
cards;
^gspc ^irx &t.
;

proc sql;
	create table o as
		select i.t,
			i.d as date,
			i.a,
			j.a as sp500,
			k.a as tb13
		from i(where=(t^="^gspc" & t^="^irx"))
			join i(where=(t="^gspc")) j
				on i.d=j.d
			join i(where=(t="^irx")) k
				on i.d=k.d
		order by t,date;
quit;

proc expand method=none out=o;
	by t;
	id date;
	convert a/tout=(pctdif);
	convert sp500/tout=(pctdif);
	convert tb13/tout=(lag /12);
run;

proc sort;
	by date t;
run;

proc transpose out=o(drop=_name_);
	where a>.;
	id t;
	by date sp500 tb13;
	format date yymmn6. sp500 tb13 a 12.4;
run;

proc export
	replace
	file="!userprofile\desktop\&f.";
run;
