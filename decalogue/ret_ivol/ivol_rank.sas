rsubmit;

proc sql;
	create table ivol_rank as
		select permno,
			a.date,
			case when ivol>ivol90 then 9
				when ivol>ivol80 then 8
				when ivol>ivol70 then 7
				when ivol>ivol60 then 6
				when ivol>ivol50 then 5
				when ivol>ivol40 then 4
				when ivol>ivol30 then 3
				when ivol>ivol20 then 2
				when ivol>ivol10 then 1
				else 0 end as ivol
		from ivol a
			join ivol_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
