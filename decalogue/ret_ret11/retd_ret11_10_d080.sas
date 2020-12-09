libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d080 as
		select a.*,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9
		from f.d080 a
			join r.retd_ret11_10 b
				on put(a.date,8.)=put(b.date,yymmddn8.)
		order by date;
quit;

proc iml;
	use d080;
	read all var _all_ into all;
	print (corr(all)[do(21*1+12,21*10+21,22)]);
quit;
