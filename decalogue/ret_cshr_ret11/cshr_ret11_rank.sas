rsubmit;

proc sql;
	create table cshr_ret11_rank as
		select permno,
			a.date,
			case when cshr>cshr90 then 9
				when cshr>cshr80 then 8
				when cshr>cshr70 then 7
				when cshr>cshr60 then 6
				when cshr>cshr50 then 5
				when cshr>cshr40 then 4
				when cshr>cshr30 then 3
				when cshr>cshr20 then 2
				when cshr>cshr10 then 1
				else 0 end as cshr,
			case when ret11>ret1190 then 9
				when ret11>ret1180 then 8
				when ret11>ret1170 then 7
				when ret11>ret1160 then 6
				when ret11>ret1150 then 5
				when ret11>ret1140 then 4
				when ret11>ret1130 then 3
				when ret11>ret1120 then 2
				when ret11>ret1110 then 1
				else 0 end as ret11
		from cshr_ret11 a
			join cshr_ret11_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
