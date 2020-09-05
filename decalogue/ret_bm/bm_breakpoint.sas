rsubmit;

proc sql;
	create table bm_breakpoint as
		select intnx("year.6",datadate,0,"end") as datadate,
			bm
		from bm a
			join exchcd(where=(exchcd=1)) b
				on lpermno=permno and namedt<=datadate<=nameendt
		order by datadate;
quit;

proc univariate noprint;
	where bm>0;
	by datadate;
	var bm;
	output out=bm_breakpoint pctlpre=bm pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify bm_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
