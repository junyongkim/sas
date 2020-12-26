rsubmit;

proc sql;
	create table ret_in_zoom as
		select a.*,in
		from ret a
			join in_zoom_rank b on permno=lpermno and intnx("year.7",date,0)=intnx("month",intnx("year.6",datadate,1),1)
		order by permno,date;
quit;

endrsubmit;
