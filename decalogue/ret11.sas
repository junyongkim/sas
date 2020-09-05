rsubmit;

proc sql;
	create table ret11 as
		select permno+0 as permno,
			date+0 as date,
			ret+0 as ret11
		from crsp.msf
		group by permno
		having n(ret)
		order by permno,date;
quit;

proc expand method=none out=ret11(where=(ret11>.));
	by permno;
	id date;
	convert ret11/tout=(+1 nomiss movprod 11 trimleft 10 -1);
run;

endrsubmit;
