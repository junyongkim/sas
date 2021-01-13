rsubmit;

proc sql;
	create table ret5_zoom_breakpoint as
		select date,ret5
		from ret5 a
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
	var ret5;
	output out=ret5_zoom_breakpoint pctlpre=ret5 pctlndec=8
		pctlpts=&i.;
run;

proc datasets nolist;
	modify ret5_zoom_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
