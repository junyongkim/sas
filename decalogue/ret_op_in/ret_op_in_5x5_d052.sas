libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d052 as
		select a.*,o1i1,o1i2,o1i3,o1i4,o1i5,o2i1,o2i2,o2i3,o2i4,o2i5,o3i1,o3i2,o3i3,o3i4,o3i5,o4i1,o4i2,o4i3,o4i4,o4i5,o5i1,o5i2,o5i3,o5i4,o5i5
		from f.d052 a
			join r.ret_op_in_5x5 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d052;
	read all var _all_ into all;
	print (corr(all)[do(51*1+27,51*25+52,52)]);
quit;
