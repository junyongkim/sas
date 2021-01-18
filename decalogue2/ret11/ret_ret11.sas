rsubmit;

proc sql;
	create table ret_ret11 as select
	i.*,
	coalesce(j.ret11,-2) as ret11,
	coalesce(k.ret11,-2) as ret111 from
	d.ret i left join
	rank_ret11 j on i.permno=j.permno & intnx("month",i.date,0)
		=intnx("month",j.date,2) left join
	rank_ret11 k on i.permno=k.permno & intnx("month",i.date,0)
		=intnx("month",k.date,1);
quit;

endrsubmit;
