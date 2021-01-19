libname d "!userprofile\desktop\sas\decalogue2\ret11";
rsubmit;

%macro reu_ret11_(n,putn);

proc sql;
	create table d.reu_ret11_%sysfunc(putn(&n,z3.)) as select
	date+0 as date length=4 format=yymmddn8.
	,sum(ifn(ret11=-2,value,0)*ret)/sum(ifn(ret11=-2,value,0)) as rx
		format=best8.
	%r(&n,ret11,&putn)
	,sum((ret11=-2)*ret)/sum(ret11=-2) as sx format=best8.
	%s(&n,ret11,&putn) from
	reu_ret11
	group by date order by date;
quit;

proc download;
run;

%mend;

endrsubmit;
