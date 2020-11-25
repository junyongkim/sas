rsubmit;

proc sql;
	create table bbgb60_breakpoint as
		select date,bb60,gb60
		from bbgb60 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var bb60 gb60;
	output out=bbgb60_breakpoint
		pctlpre=bb60 gb60
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify bbgb60_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
