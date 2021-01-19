rsubmit;

%macro n(n,var,putn);
	%do rank=0 %to &n-1;
		,sum(ifn(floor(&var*&n/100)=&rank,1,.)) as n%sysfunc(putn(&rank,&putn))
			length=3 format=best8.
	%end;
%mend;

endrsubmit;
