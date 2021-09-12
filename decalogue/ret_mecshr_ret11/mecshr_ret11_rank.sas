rsubmit;

proc sql;
	create table mecshr_ret11_rank as
		select permno,
			a.date,
			case when mecshr>mecshr90 then 9
				when mecshr>mecshr80 then 8
				when mecshr>mecshr70 then 7
				when mecshr>mecshr60 then 6
				when mecshr>mecshr50 then 5
				when mecshr>mecshr40 then 4
				when mecshr>mecshr30 then 3
				when mecshr>mecshr20 then 2
				when mecshr>mecshr10 then 1
				else 0 end as mecshr,
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
		from mecshr_ret11 a
			join mecshr_ret11_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
