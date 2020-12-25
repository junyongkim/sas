rsubmit;

proc sql;
	create table size6_ret11_breakpoint as
		select date,size6,ret11
		from size6_ret11 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	where size6>0;
	by date;
	var size6 ret11;
	output out=size6_ret11_breakpoint
		pctlpre=size6 ret11
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify size6_ret11_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
