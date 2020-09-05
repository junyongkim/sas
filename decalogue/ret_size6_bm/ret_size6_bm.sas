rsubmit;

proc sql;
	create table ret_size6_bm as
		select a.*,size6,bm
		from ret a
			join size6_bm_rank b on a.permno=b.permno and intck("year.7",a.date,b.date)=-1
		order by permno,date;
quit;

endrsubmit;
