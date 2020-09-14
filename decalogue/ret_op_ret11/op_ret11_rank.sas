rsubmit;

proc sql;
	create table op_ret11_rank as
		select permno,
			a.date,
			case when op>op90 then 9
				when op>op80 then 8
				when op>op70 then 7
				when op>op60 then 6
				when op>op50 then 5
				when op>op40 then 4
				when op>op30 then 3
				when op>op20 then 2
				when op>op10 then 1
				else 0 end as op,
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
		from op_ret11 a
			join op_ret11_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
