rsubmit;

proc sql;
	create table sinkinson_breakpoint as
		select date,sinkinson
		from sinkinson a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var sinkinson;
	output pctlpre=sinkinson pctlpts=1 to 99 out=sinkinson_breakpoint;
run;

proc datasets nolist;
	modify sinkinson_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
