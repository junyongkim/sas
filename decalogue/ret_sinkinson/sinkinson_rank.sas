rsubmit;

%macro i;
	%do i=98 %to 1 %by -1;
		when sinkinson>sinkinson&i then &i
	%end;
%mend;

proc sql;
	create table sinkinson_rank as
		select permno,
			a.date,
			case when sinkinson>sinkinson99 then 99
				%i
				else 0 end as sinkinson
		from sinkinson a
			join sinkinson_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
