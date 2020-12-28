libname j "!userprofile\desktop\french\sas7bdat";

proc sql;
	create table i as
		select *
		from i.ret_sic_all i join j.d128(rename=(date=i)) j
			on put(date,yymmn6.)=put(i,6.)
		order by date;
quit;

proc iml;
	use i;
	read all var _all_ into i;
	j=ifn(i>-99.99,i,.);
	k=do(260*161+212,260*209+260,261);
	print (corr(j,,"pairwise")[k]);
quit;
