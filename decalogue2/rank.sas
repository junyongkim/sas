rsubmit;

%macro rank(var);
	%do pctl=99 %to 1 %by -1;
		when &var>&var&pctl._5 then &pctl..5
		when &var>&var&pctl then &pctl
	%end;
	when &var>&var.0_5 then 0.5
%mend;

endrsubmit;
