rsubmit;

proc sql;
	create table ret5_ret6 as
		select a.permno,a.date,ret5,ret6
		from ret5 a join ret6 b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,5)
		order by permno,date;
quit;

endrsubmit;
