rsubmit;

proc sql;
	create table max as
		select permno+0 as permno,
			date+0 as date,
			max(ret) as max
		from crsp.dsf(where=(ret>.z))
		group by permno,intnx("month",date,0)
		having date=max(date)
		order by permno,date;
quit;

endrsubmit;
