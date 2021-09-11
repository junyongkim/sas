rsubmit;

proc sql;
	create table sinkinson_ret11_breakpoint as
		select date,sinkinson,ret11
		from sinkinson_ret11 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var sinkinson ret11;
	output out=sinkinson_ret11_breakpoint
		pctlpre=sinkinson ret11
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify sinkinson_ret11_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
