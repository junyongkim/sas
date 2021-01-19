rsubmit;

proc sql;
	create table reu_ret11 as select
	i.*,
	coalesce(ret11,-2) as ret11 from
	d.reu i left join
	rank_ret11 j on i.permno=j.permno & intnx("month",i.date,0)
		=intnx("month",j.date,2);
quit;

endrsubmit;
