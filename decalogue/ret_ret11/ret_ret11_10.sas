libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

proc sql;
	create table ret_ret11_10 as
		select date,
			sum(ifn(0<=ret11<=9,size1,.)*ret)/sum(ifn(0<=ret11<=9,size1,.)) as r0,
			sum(ifn(10<=ret11<=19,size1,.)*ret)/sum(ifn(10<=ret11<=19,size1,.)) as r1,
			sum(ifn(20<=ret11<=29,size1,.)*ret)/sum(ifn(20<=ret11<=29,size1,.)) as r2,
			sum(ifn(30<=ret11<=39,size1,.)*ret)/sum(ifn(30<=ret11<=39,size1,.)) as r3,
			sum(ifn(40<=ret11<=49,size1,.)*ret)/sum(ifn(40<=ret11<=49,size1,.)) as r4,
			sum(ifn(50<=ret11<=59,size1,.)*ret)/sum(ifn(50<=ret11<=59,size1,.)) as r5,
			sum(ifn(60<=ret11<=69,size1,.)*ret)/sum(ifn(60<=ret11<=69,size1,.)) as r6,
			sum(ifn(70<=ret11<=79,size1,.)*ret)/sum(ifn(70<=ret11<=79,size1,.)) as r7,
			sum(ifn(80<=ret11<=89,size1,.)*ret)/sum(ifn(80<=ret11<=89,size1,.)) as r8,
			sum(ifn(90<=ret11<=99,size1,.)*ret)/sum(ifn(90<=ret11<=99,size1,.)) as r9
		from ret_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_ret11_10;
run;

endrsubmit;
