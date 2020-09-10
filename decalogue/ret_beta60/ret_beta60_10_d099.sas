libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d099 as
		select a.*,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9
		from f.d099 a
			join r.ret_beta60_10 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d099;
	read all var _all_ into all;
	print (corr(all)[do(26*6+17,26*15+26,27)]);
quit;
