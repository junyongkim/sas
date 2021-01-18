libname d "!userprofile\desktop\sas\decalogue2\ret11";
libname s "!userprofile\desktop\french\sas7bdat";

proc sql;
	create table d079 as select
	i.*,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9 from
	s.d079 i join
	d.ret_ret11_010 j on i.date=input(put(j.date,yymmn6.),6.)
	order by date;
quit;

proc iml;
	use d079;
	read all var _all_ into i;
	print (corr(i)[do(21*1+12,21*10+21,22)]);
quit;
