rsubmit;

proc sql;
	create table ret5_ret6_rank as
		select permno,
			a.date,
			case when ret5>ret590 then 9
				when ret5>ret580 then 8
				when ret5>ret570 then 7
				when ret5>ret560 then 6
				when ret5>ret550 then 5
				when ret5>ret540 then 4
				when ret5>ret530 then 3
				when ret5>ret520 then 2
				when ret5>ret510 then 1
				else 0 end as ret5,
			case when ret6>ret690 then 9
				when ret6>ret680 then 8
				when ret6>ret670 then 7
				when ret6>ret660 then 6
				when ret6>ret650 then 5
				when ret6>ret640 then 4
				when ret6>ret630 then 3
				when ret6>ret620 then 2
				when ret6>ret610 then 1
				else 0 end as ret6
		from ret5_ret6 a
			join ret5_ret6_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
