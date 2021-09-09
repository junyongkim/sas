rsubmit;

proc sql;
	create table cshr_breakpoint as
		select intnx("year.6",datadate,0,"end") as datadate,
			cshr
		from cshr a
			join exchcd(where=(exchcd=1)) b
				on lpermno=permno and namedt<=datadate<=nameendt
		order by datadate;
quit;

proc univariate noprint;
	by datadate;
	var cshr;
	output out=cshr_breakpoint pctlpre=cshr pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify cshr_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
