rsubmit;

%macro r(n,var,putn);
	%do rank=0 %to &n-1;
		,sum(ifn(floor(&var*&n/100)=&rank,value,0)*ret)
			/sum(ifn(floor(&var*&n/100)=&rank,value,0)) as
			r%sysfunc(putn(&rank,&putn)) format=best8.
	%end;
%mend;

endrsubmit;
