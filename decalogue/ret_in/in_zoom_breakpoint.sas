rsubmit;

proc sql;
	create table in_zoom_breakpoint as
		select intnx("year.6",datadate,0,"end") as datadate,in
		from in a
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
	var in;
	output out=in_zoom_breakpoint
		pctlpre=in
		pctlndec=8
		pctlpts=&i.;
run;

proc datasets nolist;
	modify in_zoom_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
