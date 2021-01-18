libname d "!userprofile\desktop\sas\decalogue2\bm";
libname s "!userprofile\desktop\french\sas7bdat";

proc sql;
	create table d009 as select
	i.*,rn,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9 from
	s.d009 i join
	d.ret_bm_010 j on i.date=input(put(j.date,yymmn6.),6.)
	order by date;
quit;

proc iml;
	use d009;
	read all var _all_ into i;
	print (corr(i)[31*1+21||do(31*10+22,31*19+31,32)]);
quit;
