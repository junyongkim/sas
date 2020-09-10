rsubmit;

proc sql;
	create table beta60_rank as
		select permno,
			a.date,
			case when beta60>beta6090 then 9
				when beta60>beta6080 then 8
				when beta60>beta6070 then 7
				when beta60>beta6060 then 6
				when beta60>beta6050 then 5
				when beta60>beta6040 then 4
				when beta60>beta6030 then 3
				when beta60>beta6020 then 2
				when beta60>beta6010 then 1
				else 0 end as beta60
		from beta60 a
			join beta60_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
