rsubmit;

proc sql;
	create table rank_ret11 as select
	permno,
	i.date,
	case %rank(ret11) else 0 end as ret11 from
	d.ret11 i join
	pctl_ret11 j on i.date=j.date;
quit;

endrsubmit;
