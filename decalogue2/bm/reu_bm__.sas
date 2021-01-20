libname d "!userprofile\desktop\sas\decalogue2\bm";
rsubmit;

%macro reu_bm_(n,putn);

proc sql;
	create table d.reu_bm_%sysfunc(putn(&n,z3.)) as select
	date+0 as date format=yymmddn8.
	,sum(ifn(bm=-2,value,0)*ret)/sum(ifn(bm=-2,value,0)) as rx format=best8.
	,sum(ifn(bm=-1,value,0)*ret)/sum(ifn(bm=-1,value,0)) as rn format=best8.
	%r(&n,bm,&putn)
	,sum((bm=-2)*ret)/sum(bm=-2) as sx format=best8.
	,sum((bm=-1)*ret)/sum(bm=-1) as sn format=best8.
	%s(&n,bm,&putn) from
	reu_bm
	group by date order by date;
quit;

proc download;
run;

%mend;

endrsubmit;
