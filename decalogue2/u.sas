rsubmit;

%macro u(n,var,putn);
	%do rank=0 %to &n-1;
		,sum(floor(&var/&n)=&rank & floor(&var.1/&n)^=&rank)
			/sum(floor(&var/&n)=&rank) as
			u%sysfunc(putn(&rank,&putn)) format=best8.
	%end;
%mend;

endrsubmit;
