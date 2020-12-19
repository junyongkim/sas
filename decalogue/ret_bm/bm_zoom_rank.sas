rsubmit;

%macro i;
	%do j=%sysfunc(countw(&i.,%str( ))) %to 1 %by -1;
		when bm>bm%sysfunc(tranwrd(%sysfunc(putn(%scan(&i.,&j.,%str( )),best11.)),.,_)) then %scan(&i.,&j.,%str( ))
	%end;
%mend;

proc sql;
	create table bm_zoom_rank as
		select lpermno,
			a.datadate,case
				%i
				when bm>0 then 0 else -1 end as bm
		from bm a
			join bm_zoom_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
