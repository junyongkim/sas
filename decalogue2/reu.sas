rsubmit;

proc sql;
	create table d.reu as select
	i.permno,
	date,
	(1+ret)*sum(1,dlret)-1 as ret,
	case when dlret then abs(prc)*shrout else abs(prc)*shrout/(1+calculated ret)
		end as value from
	crsp.dsf(where=(ret>.z & prc & shrout)) i left join
	crsp.dsedelist j on i.permno=j.permno & date=dlstdt;
quit;

endrsubmit;
