rsubmit;

proc sql;
	create table size6_ret11 as
		select a.permno,b.date,size6,ret11
		from size6 a join ret11 b on a.permno=b.permno and intnx("year.5",a.date,0)=intnx("year.5",b.date,0)
		order by permno,date;
quit;

endrsubmit;
