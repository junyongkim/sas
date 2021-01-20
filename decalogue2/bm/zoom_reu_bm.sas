rsubmit;

proc sql;
	create table zoom_reu_bm as select
	i.*,
	bm from
	d.reu i join
	zoom_rank_bm on permno=lpermno & intnx("year.7",date,0)
		=intnx("month",intnx("year.6",datadate,1),1);
quit;

endrsubmit;
