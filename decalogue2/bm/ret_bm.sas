rsubmit;

proc sql;
	create table ret_bm as select
	i.*,
	coalesce(j.bm,-2) as bm,
	coalesce(k.bm,-2) as bm1 from
	d.ret i left join
	rank_bm j on permno=lpermno & intnx("year.7",date,0)
		=intnx("month",intnx("year.6",datadate,1),1) left join
	rank_bm k on permno=k.lpermno & intnx("year.6",date,0)
		=intnx("year.6",k.datadate,1);
quit;

endrsubmit;
