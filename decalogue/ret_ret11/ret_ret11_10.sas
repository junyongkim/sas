libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

proc sql;
	create table ret_ret11_10 as
		select date,
			sum(ifn(ret11=0,size1,.)*ret)/sum(ifn(ret11=0,size1,.)) as r0,
			sum(ifn(ret11=1,size1,.)*ret)/sum(ifn(ret11=1,size1,.)) as r1,
			sum(ifn(ret11=2,size1,.)*ret)/sum(ifn(ret11=2,size1,.)) as r2,
			sum(ifn(ret11=3,size1,.)*ret)/sum(ifn(ret11=3,size1,.)) as r3,
			sum(ifn(ret11=4,size1,.)*ret)/sum(ifn(ret11=4,size1,.)) as r4,
			sum(ifn(ret11=5,size1,.)*ret)/sum(ifn(ret11=5,size1,.)) as r5,
			sum(ifn(ret11=6,size1,.)*ret)/sum(ifn(ret11=6,size1,.)) as r6,
			sum(ifn(ret11=7,size1,.)*ret)/sum(ifn(ret11=7,size1,.)) as r7,
			sum(ifn(ret11=8,size1,.)*ret)/sum(ifn(ret11=8,size1,.)) as r8,
			sum(ifn(ret11=9,size1,.)*ret)/sum(ifn(ret11=9,size1,.)) as r9
		from ret_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_ret11_10;
run;

endrsubmit;
