rsubmit;

proc sql;
	create table reu_bm as select
	i.*,
	coalesce(j.bm,-2) as bm from
	d.reu i left join
	rank_bm j on permno=lpermno & intnx("year.7",date,0)
		=intnx("month",intnx("year.6",datadate,1),1);
quit;

endrsubmit;
