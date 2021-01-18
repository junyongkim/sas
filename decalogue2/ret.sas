rsubmit;

proc sql;
	create table d.ret as select
	i.permno,
	date,
	(1+ret)*sum(1,dlret)-1 as RET,
	abs(prc)*shrout as VALUE1,
	calculated value1/(1+calculated ret) as VALUE from
	crsp.msf(where=(ret>.z & prc>. & shrout)) i left join
	crsp.msedelist j on i.permno=j.permno &
		intnx("month",date,0)=intnx("month",dlstdt,0);
quit;

endrsubmit;
