rsubmit;

proc sql;
	create table bbgb60_rank as
		select permno,
			a.date,
			case when bb60>bb6090 then 9
				when bb60>bb6080 then 8
				when bb60>bb6070 then 7
				when bb60>bb6060 then 6
				when bb60>bb6050 then 5
				when bb60>bb6040 then 4
				when bb60>bb6030 then 3
				when bb60>bb6020 then 2
				when bb60>bb6010 then 1
				else 0 end as bb60,
			case when gb60>gb6090 then 9
				when gb60>gb6080 then 8
				when gb60>gb6070 then 7
				when gb60>gb6060 then 6
				when gb60>gb6050 then 5
				when gb60>gb6040 then 4
				when gb60>gb6030 then 3
				when gb60>gb6020 then 2
				when gb60>gb6010 then 1
				else 0 end as gb60
		from bbgb60 a
			join bbgb60_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
