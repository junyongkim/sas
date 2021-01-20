rsubmit;

proc sql;
	create table zoom_ret_bm as select
	i.*,
	j.bm,
	k.bm as bm1 from
	d.ret i join
	zoom_rank_bm j on permno=lpermno & intnx("year.7",date,0)
		=intnx("month",intnx("year.6",datadate,1),1) left join
	zoom_rank_bm k on permno=k.lpermno & intnx("year.6",date,0)
		=intnx("year.6",k.datadate,1);
quit;

endrsubmit;
