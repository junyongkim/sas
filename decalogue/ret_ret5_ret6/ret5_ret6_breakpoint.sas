rsubmit;

proc sql;
	create table ret5_ret6_breakpoint as
		select date,ret5,ret6
		from ret5_ret6 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var ret5 ret6;
	output out=ret5_ret6_breakpoint
		pctlpre=ret5 ret6
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify ret5_ret6_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
