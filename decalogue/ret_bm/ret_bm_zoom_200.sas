libname r "!userprofile\desktop\sas\decalogue\ret_bm\";

rsubmit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(bm>=100-100/&j.,size1,.)*ret)/sum(ifn(bm>=100-100/&j.,size1,.))-sum(ifn(0<=bm<100/&j.,size1,.)*ret)/sum(ifn(0<=bm<100/&j.,size1,.)) as b%sysfunc(putn(&j.,z3.))
	%end;
%mend;

proc sql;
	create table ret_bm_zoom_200 as
		select date
			%i
		from ret_bm_zoom
		group by date
		order by date;
quit;

proc download out=r.ret_bm_zoom_200;
run;

endrsubmit;
