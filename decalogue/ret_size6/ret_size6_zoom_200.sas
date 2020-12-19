libname r "!userprofile\desktop\sas\decalogue\ret_size6\";

rsubmit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(size6<100/&j,size1,.)*ret)/sum(ifn(size6<100/&j,size1,.))-sum(ifn(size6>=100-100/&j,size1,.)*ret)/sum(ifn(size6>=100-100/&j,size1,.)) as s%sysfunc(putn(&j,z3.))
	%end;
%mend;

proc sql;
	create table ret_size6_zoom_200 as
		select date
			%i
		from ret_size6_zoom
		group by date
		order by date;
quit;

proc download out=r.ret_size6_zoom_200;
run;

endrsubmit;
