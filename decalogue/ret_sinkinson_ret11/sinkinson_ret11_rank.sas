rsubmit;

proc sql;
	create table sinkinson_ret11_rank as
		select permno,
			a.date,
			case when sinkinson>sinkinson90 then 9
				when sinkinson>sinkinson80 then 8
				when sinkinson>sinkinson70 then 7
				when sinkinson>sinkinson60 then 6
				when sinkinson>sinkinson50 then 5
				when sinkinson>sinkinson40 then 4
				when sinkinson>sinkinson30 then 3
				when sinkinson>sinkinson20 then 2
				when sinkinson>sinkinson10 then 1
				else 0 end as sinkinson,
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
		from sinkinson_ret11 a
			join sinkinson_ret11_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
