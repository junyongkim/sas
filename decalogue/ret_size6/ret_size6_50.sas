libname r "!userprofile\desktop\sas\decalogue\ret_size6\";

rsubmit;

%macro i;
	%do i=0 %to 49;
		,sum(ifn(floor(size6/2)=&i,size1,.)*ret)/sum(ifn(floor(size6/2)=&i,size1,.)) as s%sysfunc(putn(&i,z2.))
	%end;
%mend;

proc sql;
	create table ret_size6_50 as
		select date
			%i
		from ret_size6
		group by date
		order by date;
quit;

proc download out=r.ret_size6_50;
run;

endrsubmit;
