rsubmit;

proc sql;
	create table ret_bm as
		select a.*,bm
		from ret a
			join bm_rank b on permno=lpermno and intnx("year.7",date,0)=intnx("year.7",intnx("year.6",datadate,0),2)
		order by permno,date;
quit;

endrsubmit;
