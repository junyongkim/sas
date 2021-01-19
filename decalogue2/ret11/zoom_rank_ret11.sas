rsubmit;

proc sql;
	create table zoom_rank_ret11 as select
	permno,
	i.date,
	case %zoom_rank(ret11) else 0 end as ret11 from
	d.ret11 i join
	zoom_pctl_ret11 j on i.date=j.date;
quit;

endrsubmit;
