libname d "!userprofile\desktop\sas\decalogue2\bm";
rsubmit;

%macro ret_bm_(n,putn);

proc sql;
	create table d.ret_bm_%sysfunc(putn(&n,z3.)) as select
	date+0 as date format=yymmddn8.
	,sum(ifn(bm=-2,val,0)*ret)/sum(ifn(bm=-2,val,0)) as rx format=best8.
	,sum(ifn(bm=-1,val,0)*ret)/sum(ifn(bm=-1,val,0)) as rn format=best8.
	%r(&n,bm,&putn)
	,sum((bm=-2)*ret)/sum(bm=-2) as sx format=best8.
	,sum((bm=-1)*ret)/sum(bm=-1) as sn format=best8.
	%s(&n,bm,&putn)
	,sum(ifn(bm=-2,1,.)) as nx format=best8.
	,sum(ifn(bm=-1,1,.)) as nn format=best8.
	%n(&n,bm,&putn)
	,sum(ifn(bm=-2 & bm1^=-2,val1,0))/sum(ifn(bm=-2,val1,0)) as tx format=best8.
	,sum(ifn(bm=-1 & bm1^=-1,val1,0))/sum(ifn(bm=-1,val1,0)) as tn format=best8.
	%t(&n,bm,&putn)
	,sum(bm=-2 & bm1^=-2)/sum(bm=-2) as ux format=best8.
	,sum(bm=-1 & bm1^=-1)/sum(bm=-1) as un format=best8.
	%u(&n,bm,&putn) from
	ret_bm
	group by date order by date;
quit;

proc download;
run;

%mend;

endrsubmit;
