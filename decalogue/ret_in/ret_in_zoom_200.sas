libname r "!userprofile\desktop\sas\decalogue\ret_in\";

rsubmit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(0<=in<100/&j.,size1,.)*ret)/sum(ifn(0<=in<100/&j.,size1,.))-sum(ifn(in>=100-100/&j.,size1,.)*ret)/sum(ifn(in>=100-100/&j.,size1,.)) as i%sysfunc(putn(&j.,z3.))
	%end;
%mend;

proc sql;
	create table ret_in_zoom_200 as
		select date
			%i
		from ret_in_zoom
		group by date
		order by date;
quit;

proc download out=r.ret_in_zoom_200;
run;

endrsubmit;
