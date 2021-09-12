rsubmit;

proc sql;
	create table mecshr_rank as
		select lpermno,
			a.datadate,
			case when mecshr>mecshr90 then 9
				when mecshr>mecshr80 then 8
				when mecshr>mecshr70 then 7
				when mecshr>mecshr60 then 6
				when mecshr>mecshr50 then 5
				when mecshr>mecshr40 then 4
				when mecshr>mecshr30 then 3
				when mecshr>mecshr20 then 2
				when mecshr>mecshr10 then 1
				else 0 end as mecshr
		from mecshr a
			join mecshr_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
