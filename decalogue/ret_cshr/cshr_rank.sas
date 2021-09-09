rsubmit;

proc sql;
	create table cshr_rank as
		select lpermno,
			a.datadate,
			case when cshr>cshr90 then 9
				when cshr>cshr80 then 8
				when cshr>cshr70 then 7
				when cshr>cshr60 then 6
				when cshr>cshr50 then 5
				when cshr>cshr40 then 4
				when cshr>cshr30 then 3
				when cshr>cshr20 then 2
				when cshr>cshr10 then 1
				else 0 end as cshr
		from cshr a
			join cshr_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
