rsubmit;

proc sql;
	create table ret11_breakpoint as
		select date,ret11
		from ret11 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var ret11;
	output out=ret11_breakpoint
		pctlpre=ret11
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify ret11_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
