rsubmit;

proc sql;
	create table pctl_ret11 as select
	date,
	ret11 from
	d.ret11 i join
	d.exchcd(where=(exchcd=1)) j on i.permno=j.permno & namedt<=date<=nameendt
	order by date;
quit;

proc univariate noprint;
	by date;
	var ret11;
	output pctlpre=ret11 pctlpts=0.5 to 99.5 by 0.5 out=pctl_ret11;
run;

endrsubmit;
