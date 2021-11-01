/*-----------------------------------------------------------------------------+
| fred.bat, fred.sas                                                           |
| junyong                                                                      |
| 211101                                                                       |
+-----------------------------------------------------------------------------*/
data i;
	length i $16;
	do j=1 to countw("%sysget(i)"," ");
		i=scan("%sysget(i)",j," ");
		output;
	end;
	drop j;
run;

data i;
	set i;
	f=cats("https://fred.stlouisfed.org/graph/fredgraph.csv?id=",i);
	infile _ url filevar=f firstobs=2 dsd truncover end=e;
	do until(e);
		input date yymmdd10. +1 v;
		if v>. then output;
	end;
run;

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
