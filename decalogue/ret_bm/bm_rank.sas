rsubmit;

proc sql;
	create table bm_rank as
		select lpermno,
			a.datadate,
			case when bm>bm90 then 9
				when bm>bm80 then 8
				when bm>bm70 then 7
				when bm>bm60 then 6
				when bm>bm50 then 5
				when bm>bm40 then 4
				when bm>bm30 then 3
				when bm>bm20 then 2
				when bm>bm10 then 1
				when bm>0 then 0
				else -1 end as bm
		from bm a
			join bm_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
