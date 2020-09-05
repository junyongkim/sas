rsubmit;

proc sql;
	create table size6_rank as
		select permno,
			a.date,
			case when size6>size690 then 9
				when size6>size680 then 8
				when size6>size670 then 7
				when size6>size660 then 6
				when size6>size650 then 5
				when size6>size640 then 4
				when size6>size630 then 3
				when size6>size620 then 2
				when size6>size610 then 1
				else 0 end as size6
		from size6 a
			join size6_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
