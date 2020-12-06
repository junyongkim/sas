rsubmit;

proc sql;
	create table ret_op_in as
		select a.*,op,in
		from ret a
			join op_in_rank b on permno=lpermno and intnx("year.7",date,0)=intnx("month",intnx("year.6",datadate,1),1)
		order by permno,date;
quit;

endrsubmit;
