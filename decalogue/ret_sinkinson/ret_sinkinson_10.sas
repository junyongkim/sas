libname r "!userprofile\desktop\sas\decalogue\ret_sinkinson\";

rsubmit;

%macro i;
	%do i=0 %to 9;
		,sum(ifn(floor(sinkinson/10)=&i,size1,.)*ret)/sum(ifn(floor(sinkinson/10)=&i,size1,.)) as s&i
	%end;
%mend;

proc sql;
	create table ret_sinkinson_10 as
		select date
			%i
		from ret_sinkinson
		group by date
		order by date;
quit;

proc download out=r.ret_sinkinson_10;
run;

endrsubmit;
