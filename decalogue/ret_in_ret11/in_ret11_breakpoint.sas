rsubmit;

proc sql;
	create table in_ret11_breakpoint as
		select date,in,ret11
		from in_ret11 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var in ret11;
	output out=in_ret11_breakpoint
		pctlpre=in ret11
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify in_ret11_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
