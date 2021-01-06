rsubmit;

proc sql;
	create table retd_res11_zoom as
		select a.*,res11
		from retd a
			join res11_zoom_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
