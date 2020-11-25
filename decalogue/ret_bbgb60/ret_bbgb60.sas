rsubmit;

proc sql;
	create table ret_bbgb60 as
		select a.*,bb60,gb60
		from ret a
			join bbgb60_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,1)
		order by permno,date;
quit;

endrsubmit;
