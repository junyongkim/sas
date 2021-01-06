rsubmit;

proc sql;
	create table ret_res11 as
		select a.*,res11
		from ret a
			join res11_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
