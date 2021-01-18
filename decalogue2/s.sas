rsubmit;

%macro s(n,var,putn);
	%do rank=0 %to &n-1;
		,sum((floor(&var/&n)=&rank)*ret)
			/sum(floor(&var/&n)=&rank) as
			s%sysfunc(putn(&rank,&putn)) format=best8.
	%end;
%mend;

endrsubmit;
