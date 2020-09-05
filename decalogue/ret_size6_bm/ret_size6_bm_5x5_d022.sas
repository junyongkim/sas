libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d022 as
		select a.*,s1b1,s1b2,s1b3,s1b4,s1b5,s2b1,s2b2,s2b3,s2b4,s2b5,s3b1,s3b2,s3b3,s3b4,s3b5,s4b1,s4b2,s4b3,s4b4,s4b5,s5b1,s5b2,s5b3,s5b4,s5b5
		from f.d022 a
			join r.ret_size6_bm_5x5 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d022;
	read all var _all_ into all;
	print (corr(all)[do(51*1+27,51*25+52,52)]);
quit;
