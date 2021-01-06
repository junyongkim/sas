rsubmit;

proc sql;
	create table res6_zoom_breakpoint as
		select date,res6
		from res6 a
			join exchcd(where=(exchcd=1)) b
				on a.permno=b.permno and namedt<=date<=nameendt
		order by date;
quit;

proc iml;
	i=(20/(40:1))||(100-20/(1:40));
	call symputx("i",rowcat(char(i,11,8)+" "));
quit;

proc univariate noprint;
	by date;
	var res6;
	output out=res6_zoom_breakpoint pctlpre=res6 pctlndec=8
		pctlpts=&i.;
run;

proc datasets nolist;
	modify res6_zoom_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
