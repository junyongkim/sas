rsubmit;

proc sql;
	create table ret_ret11 as
		select a.*,ret11
		from ret a
			join ret11_rank b on a.permno=b.permno and intck("month",a.date,b.date)=-2
		order by permno,date;
quit;

endrsubmit;
