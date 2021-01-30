rsubmit;

proc sql;
	create table d.join as select
	j.date,
	ret-rf as ret,
	bm,
	ret11 from
	d.ret i join
	ff.factors_monthly on i.date=dateff left join
	d.bm on permno=lpermno & intnx("year.7",i.date,0)
		=intnx("month",intnx("year.6",datadate,1),1) left join
	d.ret11 j on i.permno=j.permno & intnx("month",i.date,0)
		=intnx("month",j.date,2)
	order by date;
quit;

endrsubmit;
