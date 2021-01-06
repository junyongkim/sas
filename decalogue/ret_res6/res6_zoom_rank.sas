rsubmit;

%macro i;
	%do j=%sysfunc(countw(&i,%str( ))) %to 1 %by -1;
		when res6>res6%sysfunc(tranwrd(%sysfunc(putn(%scan(&i,&j,%str( )),best11.)),.,_)) then %scan(&i,&j,%str( ))
	%end;
%mend;

proc sql;
	create table res6_zoom_rank as
		select permno,
			a.date,case
				%i
				else 0 end as res6
		from res6 a
			join res6_zoom_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
