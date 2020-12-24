rsubmit;

proc sql;
	create table size6_breakpoint as
		select date,size6
		from size6 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	where size6>0;
	by date;
	var size6;
	output pctlpre=size6 pctlpts=1 to 99 out=size6_breakpoint;
run;

proc datasets nolist;
	modify size6_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
