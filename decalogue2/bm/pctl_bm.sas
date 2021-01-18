rsubmit;

proc sql;
	create table pctl_bm as select
	intnx("year.6",datadate,0) as datadate,
	bm from
	d.bm join
	d.exchcd(where=(exchcd=1)) on lpermno=permno & namedt<=datadate<=nameendt
	order by datadate;
quit;

proc univariate noprint;
	where bm>0;
	by datadate;
	var bm;
	output pctlpre=bm pctlpts=0.5 to 99.5 by 0.5 out=pctl_bm;
run;

endrsubmit;
