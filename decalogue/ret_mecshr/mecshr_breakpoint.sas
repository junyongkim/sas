rsubmit;

proc sql;
	create table mecshr_breakpoint as
		select intnx("year.6",datadate,0,"end") as datadate,
			mecshr
		from mecshr a
			join exchcd(where=(exchcd=1)) b
				on lpermno=permno and namedt<=datadate<=nameendt
		order by datadate;
quit;

proc univariate noprint;
	by datadate;
	var mecshr;
	output out=mecshr_breakpoint pctlpre=mecshr pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify mecshr_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
