rsubmit;

proc sql;
	create table ret_max as
		select a.*,max
		from ret a
			join max_rank b on a.permno=b.permno and intck("month",a.date,b.date)=-1
		order by permno,date;
quit;

endrsubmit;
