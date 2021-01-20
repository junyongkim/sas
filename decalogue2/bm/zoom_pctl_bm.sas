rsubmit;

proc sql;
	create table zoom_pctl_bm as select
	intnx("year.6",datadate,0) as datadate,
	bm from
	d.bm join
	d.exchcd(where=(exchcd=1)) on lpermno=permno & namedt<=datadate<=nameendt
	order by datadate;
quit;

proc univariate noprint;
	where bm^<0;
	by datadate;
	var bm;
	output pctlpre=bm pctlpts=&zoom pctlndec=8 out=zoom_pctl_bm;
run;

endrsubmit;
