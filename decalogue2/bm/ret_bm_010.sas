libname d "!userprofile\desktop\decalogue2\bm";
rsubmit;

proc sql;
	create table d.ret_bm_010 as select
	date+0 as date length=4 format=yymmddn8.
	,sum(ifn(bm=-2,value,0)*ret)/sum(ifn(bm=-2,value,0)) as rx format=best8.
	,sum(ifn(bm=-1,value,0)*ret)/sum(ifn(bm=-1,value,0)) as rn format=best8.
	%r(10,bm,z1.)
	,sum((bm=-2)*ret)/sum(bm=-2) as sx format=best8.
	,sum((bm=-1)*ret)/sum(bm=-1) as sn format=best8.
	%s(10,bm,z1.)
	,sum(ifn(bm=-2,1,.)) as nx length=3 format=best8.
	,sum(ifn(bm=-1,1,.)) as nn length=3 format=best8.
	%n(10,bm,z1.)
	,sum(ifn(bm=-2 & bm1^=-2,value1,0))
		/sum(ifn(bm=-2,value1,0)) as tx format=best8.
	,sum(ifn(bm=-1 & bm1^=-1,value1,0))
		/sum(ifn(bm=-1,value1,0)) as tn format=best8.
	%t(10,bm,z1.)
	,sum(bm=-2 & bm1^=-2)/sum(bm=-2) as ux format=best8.
	,sum(bm=-1 & bm1^=-1)/sum(bm=-1) as un format=best8.
	%u(10,bm,z1.) from
	ret_bm
	group by date order by date;
quit;

proc download out=d.ret_bm_010;
run;

endrsubmit;
