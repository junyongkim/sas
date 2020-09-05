rsubmit;

proc sql;
	create table ret_size6 as
		select a.*,size6
		from ret a
			join size6_rank b on a.permno=b.permno and intck("year.7",a.date,b.date)=-1
		order by permno,date;
quit;

endrsubmit;
