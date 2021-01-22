rsubmit;

proc sql;
	create table d.ret as select
	i.permno,
	date,
	(1+ret)*sum(1,dlret)-1 as ret,
	abs(prc)*shrout as val1,
	case when dlret then calculated val1 else calculated val1/(1+calculated ret)
		end as val from
	crsp.msf(where=(ret>.z & prc & shrout)) i left join
	crsp.msedelist j on i.permno=j.permno &
		intnx("month",date,0)=intnx("month",dlstdt,0);
quit;

endrsubmit;
