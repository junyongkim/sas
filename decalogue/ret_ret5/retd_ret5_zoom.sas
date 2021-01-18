rsubmit;

proc sql;
	create table retd_ret5_zoom as
		select a.*,ret5
		from retd a
			join ret5_zoom_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,2)
		order by permno,date;
quit;

endrsubmit;
