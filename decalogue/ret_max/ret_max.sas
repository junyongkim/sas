rsubmit;

proc sql;
	create table ret_max as
		select a.*,max
		from ret a
			join max_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,1)
		order by permno,date;
quit;

endrsubmit;
