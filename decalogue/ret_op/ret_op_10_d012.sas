libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d012 as
		select a.*,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9
		from f.d012 a
			join r.ret_op_10 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d012;
	read all var _all_ into all;
	print (corr(all)[do(29*9+20,29*18+29,30)]);
quit;
