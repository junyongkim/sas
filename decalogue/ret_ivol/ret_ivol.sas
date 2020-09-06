rsubmit;

proc sql;
	create table ret_ivol as
		select a.*,ivol
		from ret a
			join ivol_rank b on a.permno=b.permno and intck("month",a.date,b.date)=-1
		order by permno,date;
quit;

endrsubmit;
