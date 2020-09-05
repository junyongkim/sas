libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d018 as
		select a.*,s1b1,s1b2,s1b3,s2b1,s2b2,s2b3
		from f.d018 a
			join r.ret_size6_bm_2x3 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d018;
	read all var _all_ into all;
	print (corr(all)[do(13*1+8,13*6+13,14)]);
quit;
