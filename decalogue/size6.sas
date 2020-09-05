rsubmit;

proc sql;
	create table size6 as
		select permno+0 as permno,
			date+0 as date,
			abs(prc)*shrout as size6
		from crsp.msf(where=(month(date)=6 and prc>.z and shrout>.z))
		order by permno,date;
quit;

endrsubmit;
