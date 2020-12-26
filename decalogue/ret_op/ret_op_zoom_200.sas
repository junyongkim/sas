libname r "!userprofile\desktop\sas\decalogue\ret_op\";

rsubmit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(op>=100-100/&j.,size1,.)*ret)/sum(ifn(op>=100-100/&j.,size1,.))-sum(ifn(0<=op<100/&j.,size1,.)*ret)/sum(ifn(0<=op<100/&j.,size1,.)) as o%sysfunc(putn(&j.,z3.))
	%end;
%mend;

proc sql;
	create table ret_op_zoom_200 as
		select date
			%i
		from ret_op_zoom
		group by date
		order by date;
quit;

proc download out=r.ret_op_zoom_200;
run;

endrsubmit;
