libname r "!userprofile\desktop\sas\decalogue\ret_res11\";

rsubmit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(res11>=100-100/&j,size1,.)*retd)/sum(ifn(res11>=100-100/&j,size1,.))-sum(ifn(res11<100/&j,size1,.)*retd)/sum(ifn(res11<100/&j,size1,.)) as r%sysfunc(putn(&j,z3.))
	%end;
%mend;

proc sql;
	create table retd_res11_zoom_200 as
		select date
			%i
		from retd_res11_zoom
		group by date
		order by date;
quit;

proc download out=r.retd_res11_zoom_200;
run;

endrsubmit;
