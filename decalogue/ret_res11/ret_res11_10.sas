libname r "!userprofile\desktop\sas\decalogue\ret_res11\";

rsubmit;

proc sql;
	create table ret_res11_10 as
		select date,
			sum(ifn(0<=res11<=9,size1,.)*ret)/sum(ifn(0<=res11<=9,size1,.)) as r0,
			sum(ifn(10<=res11<=19,size1,.)*ret)/sum(ifn(10<=res11<=19,size1,.)) as r1,
			sum(ifn(20<=res11<=29,size1,.)*ret)/sum(ifn(20<=res11<=29,size1,.)) as r2,
			sum(ifn(30<=res11<=39,size1,.)*ret)/sum(ifn(30<=res11<=39,size1,.)) as r3,
			sum(ifn(40<=res11<=49,size1,.)*ret)/sum(ifn(40<=res11<=49,size1,.)) as r4,
			sum(ifn(50<=res11<=59,size1,.)*ret)/sum(ifn(50<=res11<=59,size1,.)) as r5,
			sum(ifn(60<=res11<=69,size1,.)*ret)/sum(ifn(60<=res11<=69,size1,.)) as r6,
			sum(ifn(70<=res11<=79,size1,.)*ret)/sum(ifn(70<=res11<=79,size1,.)) as r7,
			sum(ifn(80<=res11<=89,size1,.)*ret)/sum(ifn(80<=res11<=89,size1,.)) as r8,
			sum(ifn(90<=res11<=99,size1,.)*ret)/sum(ifn(90<=res11<=99,size1,.)) as r9
		from ret_res11
		group by date
		order by date;
quit;

proc download out=r.ret_res11_10;
run;

endrsubmit;
