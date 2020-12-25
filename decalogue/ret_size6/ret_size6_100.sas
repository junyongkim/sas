libname r "!userprofile\desktop\sas\decalogue\ret_size6\";

rsubmit;

%macro i;
	%do i=0 %to 99;
		,sum(ifn(size6=&i,size1,.)*ret)/sum(ifn(size6=&i,size1,.)) as s%sysfunc(putn(&i,z2.))
	%end;
%mend;

proc sql;
	create table ret_size6_100 as
		select date
			%i
		from ret_size6
		group by date
		order by date;
quit;

proc download out=r.ret_size6_100;
run;

endrsubmit;
