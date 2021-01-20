rsubmit;

proc sql;
	create table zoom_rank_bm as select
	lpermno,
	i.datadate,
	case %zoom_rank(bm) else 0 end as bm from
	d.bm i join
	zoom_pctl_bm j on intnx("year.6",i.datadate,0)=j.datadate where bm^<0;
quit;

endrsubmit;
