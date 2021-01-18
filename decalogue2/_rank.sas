rsubmit;

%macro rank(var);
	%do pctl=199 %to 1 %by -1;
		when &var>&var%sysfunc(tranwrd(%sysevalf(&pctl/2),.,_)) then
			%sysevalf(&pctl/2)
	%end;
%mend;

endrsubmit;
