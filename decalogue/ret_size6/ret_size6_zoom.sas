rsubmit;

proc sql;
	create table ret_size6_zoom as
		select a.*,size6
		from ret a
			join size6_zoom_rank b on a.permno=b.permno and intnx("year.7",a.date,0)=intnx("year.7",b.date,1)
		order by permno,date;
quit;

endrsubmit;
