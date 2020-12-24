rsubmit;

%macro i;
	%do i=98 %to 1 %by -1;
		when size6>size6&i then &i
	%end;
%mend;

proc sql;
	create table size6_rank as
		select permno,
			a.date,
			case when size6>size699 then 99
				%i
				else 0 end as size6
		from size6 a
			join size6_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
