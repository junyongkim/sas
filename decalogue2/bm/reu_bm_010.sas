libname d "!userprofile\desktop\sas\decalogue2\bm";
rsubmit;

proc sql;
	create table d.reu_bm_010 as select
	date+0 as date length=4 format=yymmddn8.
	,sum(ifn(bm=-2,value,0)*ret)/sum(ifn(bm=-2,value,0)) as rx format=best8.
	,sum(ifn(bm=-1,value,0)*ret)/sum(ifn(bm=-1,value,0)) as rn format=best8.
	%r(10,bm,z1.)
	,sum((bm=-2)*ret)/sum(bm=-2) as sx format=best8.
	,sum((bm=-1)*ret)/sum(bm=-1) as sn format=best8.
	%s(10,bm,z1.) from
	reu_bm
	group by date order by date;
quit;

proc download out=d.reu_bm_010;
run;

endrsubmit;
