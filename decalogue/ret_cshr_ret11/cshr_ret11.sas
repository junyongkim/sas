rsubmit;

proc sql;
	create table cshr_ret11 as
		select permno,date,cshr,ret11
		from cshr join ret11 on lpermno=permno and intnx("year.6",datadate,0,"end")=intnx("year.6",intnx("month",date,1),-1,"end")
		order by permno,date;
quit;

endrsubmit;
