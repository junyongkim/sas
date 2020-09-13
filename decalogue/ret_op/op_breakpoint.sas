rsubmit;

proc sql;
	create table op_breakpoint as
		select intnx("year.6",datadate,0,"end") as datadate,
			op
		from op a
			join exchcd(where=(exchcd=1)) b
				on lpermno=permno and namedt<=datadate<=nameendt
		order by datadate;
quit;

proc univariate noprint;
	by datadate;
	var op;
	output out=op_breakpoint pctlpre=op pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify op_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
