rsubmit;

proc iml;
	i=(20/(40:1))||(100-20/(1:40));
	call symputx("zoom",rowcat(char(i,11,8)+" "));
quit;

%macro zoom_rank(var);
	%do i=80 %to 1 %by -1;
		%let j=%sysfunc(putn(%scan(&zoom,&i,%str( )),best11.));
		when &var>&var%sysfunc(tranwrd(&j,.,_)) then &j
	%end;
%mend;

%macro zoom_r(var,i);
	%if &i= %then %do;
		%do j=5 %to 200 %by 5;
			,sum(ifn(&var>=100-100/&j,value,0)*ret)
				/sum(ifn(&var>=100-100/&j,value,0))
				-sum(ifn(&var<100/&j,value,0)*ret)/sum(ifn(&var<100/&j,value,0))
				as r%sysfunc(putn(&j,z3.)) format=best8.
		%end;
	%end;
	%else %do;
		%do j=5 %to 200 %by 5;
			,sum(ifn(&var<100/&j,value,0)*ret)/sum(ifn(&var<100/&j,value,0))
				-sum(ifn(&var>=100-100/&j,value,0)*ret)
				/sum(ifn(&var>=100-100/&j,value,0)) as r%sysfunc(putn(&j,z3.))
				format=best8.
		%end;
	%end;
%mend;

%macro zoom_s(var,i);
	%if &i= %then %do;
		%do j=5 %to 200 %by 5;
			,sum((&var>=100-100/&j)*ret)/sum(&var>=100-100/&j)
				-sum((&var<100/&j)*ret)/sum(&var<100/&j) as
				s%sysfunc(putn(&j,z3.)) format=best8.
		%end;
	%end;
	%else %do;
		%do j=5 %to 200 %by 5;
			,sum((&var<100/&j)*ret)/sum(&var<100/&j)-sum((&var>=100-100/&j)*ret)
				/sum(&var>=100-100/&j) as s%sysfunc(putn(&j,z3.)) format=best8.
		%end;
	%end;
%mend;

endrsubmit;
