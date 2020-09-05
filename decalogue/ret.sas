rsubmit;

proc sql;
	create table ret as
		select permno+0 as permno,
			date+0 as date,
			ret+0 as ret,
			abs(prc)*shrout/(1+ret) as size1
		from crsp.msf(where=(ret>.z))
		order by permno,date;
quit;

endrsubmit;
