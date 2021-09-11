rsubmit;

proc sql;
	create table sinkinson_ret11 as
		select a.permno,b.date,sinkinson,ret11
		from sinkinson a join ret11 b on a.permno=b.permno and intnx("quarter.2",a.date,0)=intnx("quarter.2",b.date,0)
		order by permno,date;
quit;

endrsubmit;
