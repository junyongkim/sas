rsubmit;

proc sql;
	create table ret5 as
		select permno+0 as permno,
			date+0 as date,
			ret+0 as ret5
		from crsp.msf
		group by permno
		having n(ret)
		order by permno,date;
quit;

proc expand method=none out=ret5(where=(ret5>.));
	by permno;
	id date;
	convert ret5/tout=(+1 nomiss movprod 5 trimleft 4 -1);
run;

endrsubmit;
