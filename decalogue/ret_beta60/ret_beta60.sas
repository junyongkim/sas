rsubmit;

proc sql;
	create table ret_beta60 as
		select a.*,beta60
		from ret a
			join beta60_rank b on a.permno=b.permno and intnx("month",a.date,0)=intnx("month",b.date,1)
		order by permno,date;
quit;

endrsubmit;
