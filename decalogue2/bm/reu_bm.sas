rsubmit;

proc sql;
	create table reu_bm as select
	i.*,
	coalesce(bm,-2) as bm from
	d.reu i left join
	rank_bm on permno=lpermno & intnx("year.7",date,0)
		=intnx("month",intnx("year.6",datadate,1),1);
quit;

endrsubmit;
