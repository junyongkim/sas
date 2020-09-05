libname f "!userprofile\desktop\french\sas7bdat\";

proc sql;
	create table d079 as
		select a.*,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9
		from f.d079 a
			join h.ret_ret11_10 b
				on put(a.date,6.)=put(b.date,yymmn6.)
		order by date;
quit;

proc iml;
	use d079;
	read all var _all_ into all;
	print (corr(all)[do(21*1+12,21*10+21,22)]);
quit;
