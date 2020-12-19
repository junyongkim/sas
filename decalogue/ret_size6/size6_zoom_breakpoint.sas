rsubmit;

proc sql;
	create table size6_zoom_breakpoint as
		select date,size6
		from size6 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc iml;
	i=(20/(40:1))||(100-20/(1:40));
	call symputx("i",rowcat(char(i,11,8)+" "));
quit;

proc univariate noprint;
	where size6>0;
	by date;
	var size6;
	output out=size6_zoom_breakpoint
		pctlpre=size6
		pctlndec=8
		pctlpts=&i.;
run;

proc datasets nolist;
	modify size6_zoom_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
