rsubmit;

proc sql;
	create table mecshr_ret11_breakpoint as
		select date,mecshr,ret11
		from mecshr_ret11 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var mecshr ret11;
	output out=mecshr_ret11_breakpoint
		pctlpre=mecshr ret11
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify mecshr_ret11_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
