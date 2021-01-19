rsubmit;

proc sql;
	create table zoom_ret_ret11 as select
	i.*,
	ret11 from
	d.ret i join
	zoom_rank_ret11 j on i.permno=j.permno & intnx("month",i.date,0)
		=intnx("month",j.date,2);
quit;

endrsubmit;
