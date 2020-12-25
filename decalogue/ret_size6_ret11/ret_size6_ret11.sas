rsubmit;

proc sql;
	create table ret_size6_ret11 as
		select a.*,size6,ret11
		from ret a
			join size6_ret11_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
