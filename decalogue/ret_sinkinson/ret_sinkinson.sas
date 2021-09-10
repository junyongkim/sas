rsubmit;

proc sql;
	create table ret_sinkinson as
		select a.*,sinkinson
		from ret a
			join sinkinson_rank b on a.permno=b.permno and intnx("quarter",a.date,0)=intnx("quarter",b.date,1)
		order by permno,date;
quit;

endrsubmit;
