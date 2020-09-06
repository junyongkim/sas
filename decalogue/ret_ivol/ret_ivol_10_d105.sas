libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d105 as
		select a.*,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9
		from f.d105 a
			join r.ret_ivol_10 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d105;
	read all var _all_ into all;
	print (corr(all)[do(26*6+17,26*15+26,27)]);
quit;
