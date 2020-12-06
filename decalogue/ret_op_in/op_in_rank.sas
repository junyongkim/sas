rsubmit;

proc sql;
	create table op_in_rank as
		select lpermno,
			a.datadate,
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
			case when in>in90 then 9
				when in>in80 then 8
				when in>in70 then 7
				when in>in60 then 6
				when in>in50 then 5
				when in>in40 then 4
				when in>in30 then 3
				when in>in20 then 2
				when in>in10 then 1
				else 0 end as in
		from op_in a
			join op_in_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
