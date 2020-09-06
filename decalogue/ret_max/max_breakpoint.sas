rsubmit;

proc sql;
	create table max_breakpoint as
		select date,max
		from max a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var max;
	output out=max_breakpoint
		pctlpre=max
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify max_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
