rsubmit;

proc sql;
	create table ret_op as
		select a.*,op
		from ret a
			join op_rank b on permno=lpermno and intnx("year.7",date,0)=intnx("month",intnx("year.6",datadate,1),1)
		order by permno,date;
quit;

endrsubmit;
