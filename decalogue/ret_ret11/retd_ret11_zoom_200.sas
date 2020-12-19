libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(ret11>=100-100/&j,size1,.)*retd)/sum(ifn(ret11>=100-100/&j,size1,.))-sum(ifn(ret11<100/&j,size1,.)*retd)/sum(ifn(ret11<100/&j,size1,.)) as r%sysfunc(putn(&j,z3.))
	%end;
%mend;

proc sql;
	create table retd_ret11_zoom_200 as
		select date
			%i
		from retd_ret11_zoom
		group by date
		order by date;
quit;

proc download out=r.retd_ret11_zoom_200;
run;

endrsubmit;
