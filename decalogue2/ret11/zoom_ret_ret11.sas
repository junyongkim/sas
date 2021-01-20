rsubmit;

proc sql;
	create table zoom_ret_ret11 as select
	i.*,
	j.ret11,
	k.ret11 as ret111 from
	d.ret i join
	zoom_rank_ret11 j on i.permno=j.permno & intnx("month",i.date,0)
		=intnx("month",j.date,2) left join
	zoom_rank_ret11 k on i.permno=k.permno & intnx("month",i.date,0)
		=intnx("month",k.date,1);
quit;

endrsubmit;
