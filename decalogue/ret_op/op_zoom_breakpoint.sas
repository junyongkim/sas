rsubmit;

proc sql;
	create table op_zoom_breakpoint as
		select intnx("year.6",datadate,0,"end") as datadate,op
		from op a
			join exchcd(where=(exchcd=1)) b
				on lpermno=permno and namedt<=datadate<=nameendt
		order by datadate;
quit;

proc iml;
	i=(20/(40:1))||(100-20/(1:40));
	call symputx("i",rowcat(char(i,11,8)+" "));
quit;

proc univariate noprint;
	by datadate;
	var op;
	output out=op_zoom_breakpoint
		pctlpre=op
		pctlndec=8
		pctlpts=&i.;
run;

proc datasets nolist;
	modify op_zoom_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
