rsubmit;

%macro i;
	%do j=%sysfunc(countw(&i,%str( ))) %to 1 %by -1;
		when res11>res11%sysfunc(tranwrd(%sysfunc(putn(%scan(&i,&j,%str( )),best11.)),.,_)) then %scan(&i,&j,%str( ))
	%end;
%mend;

proc sql;
	create table res11_zoom_rank as
		select permno,
			a.date,case
				%i
				else 0 end as res11
		from res11 a
			join res11_zoom_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
