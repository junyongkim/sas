libname d "!userprofile\desktop\sas\decalogue2\ret11";
rsubmit;

%macro ret_ret11_(n,putn);

proc sql;
	create table d.ret_ret11_%sysfunc(putn(&n,z3.)) as select
	date+0 as date format=yymmddn8.
	,sum(ifn(ret11=-2,value,0)*ret)/sum(ifn(ret11=-2,value,0)) as rx
		format=best8.
	%r(&n,ret11,&putn)
	,sum((ret11=-2)*ret)/sum(ret11=-2) as sx format=best8.
	%s(&n,ret11,&putn)
	,sum(ifn(ret11=-2,1,.)) as nx format=best8.
	%n(&n,ret11,&putn)
	,sum(ifn(ret11=-2 & ret111^=-2,value1,0))/sum(ifn(ret11=-2,value1,0)) as tx
		format=best8.
	%t(&n,ret11,&putn)
	,sum(ret11=-2 & ret111^=-2)/sum(ret11=-2) as ux format=best8.
	%u(&n,ret11,&putn) from
	ret_ret11
	group by date order by date;
quit;

proc download;
run;

%mend;

endrsubmit;
