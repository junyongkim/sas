rsubmit;

proc sql;
	create table retd as
		select permno+0 as permno,
			date+0 as date,
			ret+0 as retd,
			abs(prc)*shrout/(1+ret) as size1
		from crsp.dsf(where=(ret>.z))
		order by permno,date;
quit;

endrsubmit;
