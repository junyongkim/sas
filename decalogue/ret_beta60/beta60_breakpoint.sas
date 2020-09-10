rsubmit;

proc sql;
	create table beta60_breakpoint as
		select date,beta60
		from beta60 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var beta60;
	output out=beta60_breakpoint
		pctlpre=beta60
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify beta60_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
