/*-----------------------------------------------------------------------------+
| yahoo61m.bat, yahoo61m.sas                                                   |
| junyong                                                                      |
| 211101                                                                       |
+-----------------------------------------------------------------------------*/
data i;
	length t $16;
	do i=-1 to countw("%sysget(t)"," ");
		if i=-1 then t="^gspc";
		else if i=0 then t="^irx";
		else t=scan("%sysget(t)",i," ");
		output;
	end;
	drop i;
run;

data i;
	set i;
	if "%sysget(d)"d=intnx("mon","%sysget(d)"d,0,"end") then do;
		p=intnx("month","%sysget(d)"d,-60);
		q="%sysget(d)"d;
	end;
	else do;
		p=intnx("month","%sysget(d)"d,-61);
		q=intnx("month","%sysget(d)"d,-1,"end");
	end;
	f=cats("https://query1.finance.yahoo.com/v7/finance/download/",t,
		"?period1=",dhms(p,0,0,0)-315619200,
		'&period2=',dhms(q,23,59,59)-315619200,
		'&interval=1mo');
	infile _ url filevar=f firstobs=2 dsd end=e;
	do until(e);
		input d yymmdd10. +1 o h l c a v;
		output;
	end;
run;

proc sql;
	create table o as
		select i.t,i.d as date,i.a,j.a as sp500,k.a as tb13
		from i(where=(t^="^gspc" & t^="^irx"))
			join i(where=(t="^gspc")) j on i.d=j.d
			join i(where=(t="^irx")) k on i.d=k.d
		order by t,date;
quit;

proc sort;
	by date t;
run;

proc transpose out=o(drop=_name_);
	where a>.;
	id t;
	by date sp500 tb13;
	format date yymmn6. sp500 tb13 a 12.4;
run;

proc export replace file="!userprofile\desktop\%sysget(f).csv";
run;
