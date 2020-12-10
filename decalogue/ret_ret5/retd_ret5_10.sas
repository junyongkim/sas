libname r "!userprofile\desktop\sas\decalogue\ret_ret5\";

rsubmit;

proc sql;
	create table retd_ret5_10 as
		select date,
			sum(ifn(0<=ret5<=9,size1,.)*retd)/sum(ifn(0<=ret5<=9,size1,.)) as r0,
			sum(ifn(10<=ret5<=19,size1,.)*retd)/sum(ifn(10<=ret5<=19,size1,.)) as r1,
			sum(ifn(20<=ret5<=29,size1,.)*retd)/sum(ifn(20<=ret5<=29,size1,.)) as r2,
			sum(ifn(30<=ret5<=39,size1,.)*retd)/sum(ifn(30<=ret5<=39,size1,.)) as r3,
			sum(ifn(40<=ret5<=49,size1,.)*retd)/sum(ifn(40<=ret5<=49,size1,.)) as r4,
			sum(ifn(50<=ret5<=59,size1,.)*retd)/sum(ifn(50<=ret5<=59,size1,.)) as r5,
			sum(ifn(60<=ret5<=69,size1,.)*retd)/sum(ifn(60<=ret5<=69,size1,.)) as r6,
			sum(ifn(70<=ret5<=79,size1,.)*retd)/sum(ifn(70<=ret5<=79,size1,.)) as r7,
			sum(ifn(80<=ret5<=89,size1,.)*retd)/sum(ifn(80<=ret5<=89,size1,.)) as r8,
			sum(ifn(90<=ret5<=99,size1,.)*retd)/sum(ifn(90<=ret5<=99,size1,.)) as r9
		from retd_ret5
		group by date
		order by date;
quit;

proc download out=r.retd_ret5_10;
run;

endrsubmit;
