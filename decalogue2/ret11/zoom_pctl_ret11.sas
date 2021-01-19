rsubmit;

proc sql;
	create table zoom_pctl_ret11 as select
	date,
	ret11 from
	d.ret11 i join
	d.exchcd(where=(exchcd=1)) j on i.permno=j.permno & namedt<=date<=nameendt
	order by date;
quit;

proc univariate noprint;
	by date;
	var ret11;
	output pctlpre=ret11 pctlpts=&zoom pctlndec=8 out=zoom_pctl_ret11;
run;

endrsubmit;
