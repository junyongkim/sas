libname r "!userprofile\desktop\sas\decalogue\ret_size6\";

rsubmit;

%macro i;
	%do i=0 %to 9;
		,sum(ifn(floor(size6/10)=&i,size1,.)*ret)/sum(ifn(floor(size6/10)=&i,size1,.)) as s&i
	%end;
%mend;

proc sql;
	create table ret_size6_10 as
		select date
			%i
		from ret_size6
		group by date
		order by date;
quit;

proc download out=r.ret_size6_10;
run;

endrsubmit;
