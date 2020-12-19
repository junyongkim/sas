rsubmit;

%macro i;
	%do j=%sysfunc(countw(&i,%str( ))) %to 1 %by -1;
		when size6>size6%sysfunc(tranwrd(%sysfunc(putn(%scan(&i,&j,%str( )),best11.)),.,_)) then %scan(&i,&j,%str( ))
	%end;
%mend;

proc sql;
	create table size6_zoom_rank as
		select permno,
			a.date,case
				%i
				else 0 end as size6
		from size6 a
			join size6_zoom_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
