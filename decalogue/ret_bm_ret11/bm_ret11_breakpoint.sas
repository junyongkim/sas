rsubmit;

proc sql;
	create table bm_ret11_breakpoint as
		select date,bm,ret11
		from bm_ret11 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	where bm>0;
	by date;
	var bm ret11;
	output out=bm_ret11_breakpoint
		pctlpre=bm ret11
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify bm_ret11_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
