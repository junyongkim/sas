rsubmit;

proc sql;
	create table ret_res6_zoom as
		select a.*,res6
		from ret a
			join res6_zoom_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,7)
		order by permno,date;
quit;

endrsubmit;
