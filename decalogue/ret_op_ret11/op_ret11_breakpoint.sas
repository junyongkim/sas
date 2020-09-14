rsubmit;

proc sql;
	create table op_ret11_breakpoint as
		select date,op,ret11
		from op_ret11 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc univariate noprint;
	by date;
	var op ret11;
	output out=op_ret11_breakpoint
		pctlpre=op ret11
		pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc datasets nolist;
	modify op_ret11_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
