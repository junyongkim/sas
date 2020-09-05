libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d006 as
		select a.*,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9
		from f.d006 a
			join h.ret_size6_10 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d006;
	read all var _all_ into all;
	print (corr(all)[do(30*10+21,30*19+30,31)]);
quit;
