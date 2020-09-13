rsubmit;

proc sql;
	create table op_rank as
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
				else 0 end as op
		from op a
			join op_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
