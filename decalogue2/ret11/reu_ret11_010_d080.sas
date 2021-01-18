libname d "!userprofile\desktop\sas\decalogue2\ret11";
libname s "!userprofile\desktop\french\sas7bdat";

proc sql;
	create table i as select
	i.*,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9 from
	s.d080 i join
	d.reu_ret11_010 j on i.date=input(put(j.date,yymmddn8.),8.)
	order by date;
quit;

proc iml;
	use i;
	read all var _all_ into i;
	print (corr(i)[do(21*1+12,21*10+21,22)]);
quit;
