rsubmit;

proc sql;
	create table retd_bm_ret11 as
		select a.*,bm,ret11
		from retd a
			join bm_ret11_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
