rsubmit;

proc sql;
	create table max_rank as
		select permno,
			a.date,
			case when max>max90 then 9
				when max>max80 then 8
				when max>max70 then 7
				when max>max60 then 6
				when max>max50 then 5
				when max>max40 then 4
				when max>max30 then 3
				when max>max20 then 2
				when max>max10 then 1
				else 0 end as max
		from max a
			join max_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
