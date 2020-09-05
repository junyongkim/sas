rsubmit;

proc sql;
	create table size6_bm_rank as
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
				else 0 end as size6,
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
		from size6_bm a
			join size6_bm_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
