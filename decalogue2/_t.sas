rsubmit;

%macro t(n,var,putn);
	%do rank=0 %to &n-1;
		,sum(ifn(floor(&var*&n/100)=&rank &
			floor(&var.1*&n/100)^=&rank,value1,0))
			/sum(ifn(floor(&var*&n/100)=&rank,value1,0)) as
			t%sysfunc(putn(&rank,&putn)) format=best8.
	%end;
%mend;

endrsubmit;
