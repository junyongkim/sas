rsubmit;

proc sql;
	create table ret11_zoom_breakpoint as
		select date,ret11
		from ret11 a
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
	var ret11;
	output out=ret11_zoom_breakpoint pctlpre=ret11 pctlndec=8
		pctlpts=&i.;
run;

proc datasets nolist;
	modify ret11_zoom_breakpoint;
	attrib _all_ label=" ";
run;

endrsubmit;
