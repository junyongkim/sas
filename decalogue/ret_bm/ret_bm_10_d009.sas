libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d009 as
		select a.*,bn,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9
		from f.d009 a
			join r.ret_bm_10 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d009;
	read all var _all_ into all;
	print (corr(all)[31*1+21||do(31*10+22,31*19+31,32)]);
quit;
