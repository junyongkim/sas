rsubmit;

proc sql;
	create table rank_bm as select
	lpermno,
	i.datadate,
	case %rank(bm) when bm>0 then 0 else -1 end as bm from
	d.bm i join
	pctl_bm j on intnx("year.6",i.datadate,0)=j.datadate;
quit;

endrsubmit;
