rsubmit;

proc sql;
	create table ivol_breakpoint as
		select date,ivol
		from ivol a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var ivol;
	output out=ivol_breakpoint
		pctlpre=ivol
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify ivol_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
