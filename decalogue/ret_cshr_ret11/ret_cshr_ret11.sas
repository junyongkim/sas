rsubmit;

proc sql;
	create table ret_cshr_ret11 as
		select a.*,cshr,ret11
		from ret a
			join cshr_ret11_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
