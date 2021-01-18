libname d "!userprofile\desktop\sas\decalogue2\bm";
libname s "!userprofile\desktop\french\sas7bdat";

proc sql;
	create table i as select
	i.*,rn,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9 from
	s.d011 i join
	d.reu_bm_010 j on i.date=input(put(j.date,yymmddn8.),8.)
	order by date;
quit;

proc iml;
	use i;
	read all var _all_ into i;
	print (corr(i)[31*1+21||do(31*10+22,31*19+31,32)]);
quit;
