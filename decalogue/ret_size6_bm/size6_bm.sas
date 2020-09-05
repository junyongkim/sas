rsubmit;

proc sql;
	create table size6_bm as
		select permno,date,size6,bm
		from size6 join bm on permno=lpermno and intnx("month",date,-1,"end")=intnx("year.6",datadate,0,"end")
		order by permno,date;
quit;

endrsubmit;
