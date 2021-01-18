libname d "!userprofile\desktop\sas\decalogue2\ret11";
rsubmit;

proc sql;
	create table d.ret_ret11_010 as select
	date+0 as date length=4 format=yymmddn8.
	,sum(ifn(ret11=-2,value,0)*ret)/sum(ifn(ret11=-2,value,0)) as rx
		format=best8.
	%r(10,ret11,z1.)
	,sum((ret11=-2)*ret)/sum(ret11=-2) as sx format=best8.
	%s(10,ret11,z1.)
	,sum(ifn(ret11=-2,1,.)) as nx length=3 format=best8.
	%n(10,ret11,z1.)
	,sum(ifn(ret11=-2 & ret111^=-2,value1,0))/sum(ifn(ret11=-2,value1,0)) as tx
		format=best8.
	%t(10,ret11,z1.)
	,sum(ret11=-2 & ret111^=-2)/sum(ret11=-2) as ux format=best8.
	%u(10,ret11,z1.) from
	ret_ret11
	group by date order by date;
quit;

proc download out=d.ret_ret11_010;
run;

endrsubmit;
