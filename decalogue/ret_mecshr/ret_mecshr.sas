rsubmit;

proc sql;
	create table ret_mecshr as
		select a.*,mecshr
		from ret a
			join mecshr_rank b on permno=lpermno and intnx("year.7",date,0)=intnx("month",intnx("year.6",datadate,1),1)
		order by permno,date;
quit;

endrsubmit;
