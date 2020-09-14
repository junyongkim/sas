rsubmit;

proc sql;
	create table op_ret11 as
		select permno,date,op,ret11
		from op join ret11 on lpermno=permno and intnx("year.6",datadate,0,"end")=intnx("year.6",intnx("month",date,1),-1,"end")
		order by permno,date;
quit;

endrsubmit;
