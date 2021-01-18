rsubmit;

proc sql;
	create table retd_ret6_zoom as
		select a.*,ret6
		from retd a
			join ret6_zoom_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,7)
		order by permno,date;
quit;

endrsubmit;
