rsubmit;

proc sql;
	create table ret_mecshr_ret11 as
		select a.*,mecshr,ret11
		from ret a
			join mecshr_ret11_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
