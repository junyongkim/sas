rsubmit;

proc sql;
	create table i as select
	* from
	bm
	group by lpermno,intnx("year.6",datadate,0) having datadate=max(datadate);
quit;

proc sql;
	create table d.join as select
	j.date,
	ret-rf as ret,
	bm,
	ret11 from
	d.ret j join
	ff.factors_monthly on j.date=dateff left join
	i on permno=lpermno & intnx("year.7",j.date,0)
		=intnx("month",intnx("year.6",datadate,1),1) left join
	d.ret11 k on j.permno=k.permno & intnx("month",j.date,0)
		=intnx("month",k.date,2)
	order by date;
quit;

endrsubmit;
