libname r "!userprofile\desktop\sas\decalogue\ret_ret6\";

rsubmit;

proc sql;
	create table ret_ret6_10 as
		select date,
			sum(ifn(0<=ret6<=9,size1,.)*ret)/sum(ifn(0<=ret6<=9,size1,.)) as r0,
			sum(ifn(10<=ret6<=19,size1,.)*ret)/sum(ifn(10<=ret6<=19,size1,.)) as r1,
			sum(ifn(20<=ret6<=29,size1,.)*ret)/sum(ifn(20<=ret6<=29,size1,.)) as r2,
			sum(ifn(30<=ret6<=39,size1,.)*ret)/sum(ifn(30<=ret6<=39,size1,.)) as r3,
			sum(ifn(40<=ret6<=49,size1,.)*ret)/sum(ifn(40<=ret6<=49,size1,.)) as r4,
			sum(ifn(50<=ret6<=59,size1,.)*ret)/sum(ifn(50<=ret6<=59,size1,.)) as r5,
			sum(ifn(60<=ret6<=69,size1,.)*ret)/sum(ifn(60<=ret6<=69,size1,.)) as r6,
			sum(ifn(70<=ret6<=79,size1,.)*ret)/sum(ifn(70<=ret6<=79,size1,.)) as r7,
			sum(ifn(80<=ret6<=89,size1,.)*ret)/sum(ifn(80<=ret6<=89,size1,.)) as r8,
			sum(ifn(90<=ret6<=99,size1,.)*ret)/sum(ifn(90<=ret6<=99,size1,.)) as r9
		from ret_ret6
		group by date
		order by date;
quit;

proc download out=r.ret_ret6_10;
run;

endrsubmit;
