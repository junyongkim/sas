rsubmit;

proc sql;
	create table ret_res5 as
		select a.*,res5
		from ret a
			join res5_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
