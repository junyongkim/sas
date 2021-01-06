libname r "!userprofile\desktop\sas\decalogue\ret_res6\";

rsubmit;

proc sql;
	create table retd_res6_10 as
		select date,
			sum(ifn(0<=res6<=9,size1,.)*retd)/sum(ifn(0<=res6<=9,size1,.)) as r0,
			sum(ifn(10<=res6<=19,size1,.)*retd)/sum(ifn(10<=res6<=19,size1,.)) as r1,
			sum(ifn(20<=res6<=29,size1,.)*retd)/sum(ifn(20<=res6<=29,size1,.)) as r2,
			sum(ifn(30<=res6<=39,size1,.)*retd)/sum(ifn(30<=res6<=39,size1,.)) as r3,
			sum(ifn(40<=res6<=49,size1,.)*retd)/sum(ifn(40<=res6<=49,size1,.)) as r4,
			sum(ifn(50<=res6<=59,size1,.)*retd)/sum(ifn(50<=res6<=59,size1,.)) as r5,
			sum(ifn(60<=res6<=69,size1,.)*retd)/sum(ifn(60<=res6<=69,size1,.)) as r6,
			sum(ifn(70<=res6<=79,size1,.)*retd)/sum(ifn(70<=res6<=79,size1,.)) as r7,
			sum(ifn(80<=res6<=89,size1,.)*retd)/sum(ifn(80<=res6<=89,size1,.)) as r8,
			sum(ifn(90<=res6<=99,size1,.)*retd)/sum(ifn(90<=res6<=99,size1,.)) as r9
		from retd_res6
		group by date
		order by date;
quit;

proc download out=r.retd_res6_10;
run;

endrsubmit;
