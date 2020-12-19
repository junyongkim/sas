rsubmit;

%macro i;
	%do j=%sysfunc(countw(&i,%str( ))) %to 1 %by -1;
		when ret11>ret11%sysfunc(tranwrd(%sysfunc(putn(%scan(&i,&j,%str( )),best11.)),.,_)) then %scan(&i,&j,%str( ))
	%end;
%mend;

proc sql;
	create table ret11_zoom_rank as
		select permno,
			a.date,case
				%i
				else 0 end as ret11
		from ret11 a
			join ret11_zoom_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
