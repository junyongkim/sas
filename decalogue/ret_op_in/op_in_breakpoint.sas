rsubmit;

proc sql;
	create table op_in_breakpoint as
		select intnx("year.6",datadate,0,"end") as datadate,
			op,in
		from op_in a
			join exchcd(where=(exchcd=1)) b
				on lpermno=permno and namedt<=datadate<=nameendt
		order by datadate;
quit;

proc univariate noprint;
	by datadate;
	var op in;
	output out=op_in_breakpoint
		pctlpre=op in
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify op_in_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
