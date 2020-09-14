libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d015 as
		select a.*,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9
		from f.d015 a
			join r.ret_in_10 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d015;
	read all var _all_ into all;
	print (corr(all)[do(29*9+20,29*18+29,30)]);
quit;
