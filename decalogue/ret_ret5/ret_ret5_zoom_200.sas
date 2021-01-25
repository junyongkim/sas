libname r "!userprofile\desktop\sas\decalogue\ret_ret5\";

rsubmit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(ret5>=100-100/&j,size1,.)*ret)/sum(ifn(ret5>=100-100/&j,size1,.))-sum(ifn(ret5<100/&j,size1,.)*ret)/sum(ifn(ret5<100/&j,size1,.)) as r%sysfunc(putn(&j,z3.))
	%end;
%mend;

proc sql;
	create table ret_ret5_zoom_200 as
		select date
			%i
		from ret_ret5_zoom
		group by date
		order by date;
quit;

proc download out=r.ret_ret5_zoom_200;
run;

endrsubmit;