rsubmit;

%macro i;
	%do j=%sysfunc(countw(&i.,%str( ))) %to 1 %by -1;
		when in>in%sysfunc(tranwrd(%sysfunc(putn(%scan(&i.,&j.,%str( )),best11.)),.,_)) then %scan(&i.,&j.,%str( ))
	%end;
%mend;

proc sql;
	create table in_zoom_rank as
		select lpermno,
			a.datadate,case
				%i
				else 0 end as in
		from in a
			join in_zoom_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
