rsubmit;

proc sql;
	create table in_rank as
		select lpermno,
			a.datadate,
			case when in>in90 then 9
				when in>in80 then 8
				when in>in70 then 7
				when in>in60 then 6
				when in>in50 then 5
				when in>in40 then 4
				when in>in30 then 3
				when in>in20 then 2
				when in>in10 then 1
				else 0 end as in
		from in a
			join in_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
