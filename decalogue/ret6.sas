rsubmit;

proc sql;
	create table ret6 as
		select permno+0 as permno,
			date+0 as date,
			ret+0 as ret6
		from crsp.msf
		group by permno
		having n(ret)
		order by permno,date;
quit;

proc expand method=none out=ret6(where=(ret6>.));
	by permno;
	id date;
	convert ret6/tout=(+1 nomiss movprod 6 trimleft 5 -1);
run;

endrsubmit;
