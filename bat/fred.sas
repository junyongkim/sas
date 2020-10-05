/*-----------------------------------------------------------------------------+
| fred.bat, fred.sas                                                           |
| junyong                                                                      |
| 201004                                                                       |
+-----------------------------------------------------------------------------*/
data i;
	input @@;
	_infile_=resolve(_infile_);
	input i :$16. @@;
	f=compress("https://fred.stlouisfed.org/graph/fredgraph.csv?id="||i);
	infile _ url filevar=f firstobs=2 dsd truncover end=e;
	do until(e);
		input date yymmdd10. +1 v;
		if v>. then output;
	end;
cards;
%sysget(i)
;

proc sort;
	by date i;
run;

proc transpose out=o(drop=_name_);
	by date;
	id i;
	var v;
	format date yymmddn8.;
run;

proc export replace file="!userprofile\desktop\%sysget(f).csv";
run;
