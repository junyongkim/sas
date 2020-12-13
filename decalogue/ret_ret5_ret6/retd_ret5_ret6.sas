rsubmit;

proc sql;
	create table retd_ret5_ret6 as
		select a.*,ret5,ret6
		from retd a
			join ret5_ret6_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
