libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d078 as
		select a.*,s1r1,s1r2,s1r3,s1r4,s1r5,s2r1,s2r2,s2r3,s2r4,s2r5,s3r1,s3r2,s3r3,s3r4,s3r5,s4r1,s4r2,s4r3,s4r4,s4r5,s5r1,s5r2,s5r3,s5r4,s5r5
		from f.d078 a
			join r.retd_size6_ret11_5x5 b
				on put(a.date,8.)=put(b.date,yymmddn8.)
		order by date;
quit;

proc iml;
	use d078;
	read all var _all_ into all;
	print (corr(all)[do(51*1+27,51*25+52,52)]);
quit;
