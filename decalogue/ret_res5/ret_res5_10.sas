libname r "!userprofile\desktop\sas\decalogue\ret_res5\";

rsubmit;

proc sql;
	create table ret_res5_10 as
		select date,
			sum(ifn(0<=res5<=9,size1,.)*ret)/sum(ifn(0<=res5<=9,size1,.)) as r0,
			sum(ifn(10<=res5<=19,size1,.)*ret)/sum(ifn(10<=res5<=19,size1,.)) as r1,
			sum(ifn(20<=res5<=29,size1,.)*ret)/sum(ifn(20<=res5<=29,size1,.)) as r2,
			sum(ifn(30<=res5<=39,size1,.)*ret)/sum(ifn(30<=res5<=39,size1,.)) as r3,
			sum(ifn(40<=res5<=49,size1,.)*ret)/sum(ifn(40<=res5<=49,size1,.)) as r4,
			sum(ifn(50<=res5<=59,size1,.)*ret)/sum(ifn(50<=res5<=59,size1,.)) as r5,
			sum(ifn(60<=res5<=69,size1,.)*ret)/sum(ifn(60<=res5<=69,size1,.)) as r6,
			sum(ifn(70<=res5<=79,size1,.)*ret)/sum(ifn(70<=res5<=79,size1,.)) as r7,
			sum(ifn(80<=res5<=89,size1,.)*ret)/sum(ifn(80<=res5<=89,size1,.)) as r8,
			sum(ifn(90<=res5<=99,size1,.)*ret)/sum(ifn(90<=res5<=99,size1,.)) as r9
		from ret_res5
		group by date
		order by date;
quit;

proc download out=r.ret_res5_10;
run;

endrsubmit;
