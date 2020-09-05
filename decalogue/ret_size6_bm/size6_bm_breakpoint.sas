rsubmit;

proc sql;
	create table size6_bm_breakpoint as
		select date,size6,bm
		from size6_bm a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	where size6>0 and bm>0;
	by date;
	var size6 bm;
	output out=size6_bm_breakpoint
		pctlpre=size6 bm
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify size6_bm_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
