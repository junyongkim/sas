rsubmit;

proc sql;
	create table bm_ret11_rank as
		select permno,
			a.date,
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
				else -1 end as bm,
			case when ret11>ret1190 then 9
				when ret11>ret1180 then 8
				when ret11>ret1170 then 7
				when ret11>ret1160 then 6
				when ret11>ret1150 then 5
				when ret11>ret1140 then 4
				when ret11>ret1130 then 3
				when ret11>ret1120 then 2
				when ret11>ret1110 then 1
				when ret11>. then 0 end as ret11
		from bm_ret11 a
			join bm_ret11_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
