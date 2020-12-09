libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

proc sql;
	create table ret_ret11_25 as
		select date,
			sum(ifn(ceil(ret11/4)=0,size1,.)*ret)/sum(ifn(ceil(ret11/4)=0,size1,.)) as r00,
			sum(ifn(ceil(ret11/4)=1,size1,.)*ret)/sum(ifn(ceil(ret11/4)=1,size1,.)) as r01,
			sum(ifn(ceil(ret11/4)=2,size1,.)*ret)/sum(ifn(ceil(ret11/4)=2,size1,.)) as r02,
			sum(ifn(ceil(ret11/4)=3,size1,.)*ret)/sum(ifn(ceil(ret11/4)=3,size1,.)) as r03,
			sum(ifn(ceil(ret11/4)=4,size1,.)*ret)/sum(ifn(ceil(ret11/4)=4,size1,.)) as r04,
			sum(ifn(ceil(ret11/4)=5,size1,.)*ret)/sum(ifn(ceil(ret11/4)=5,size1,.)) as r05,
			sum(ifn(ceil(ret11/4)=6,size1,.)*ret)/sum(ifn(ceil(ret11/4)=6,size1,.)) as r06,
			sum(ifn(ceil(ret11/4)=7,size1,.)*ret)/sum(ifn(ceil(ret11/4)=7,size1,.)) as r07,
			sum(ifn(ceil(ret11/4)=8,size1,.)*ret)/sum(ifn(ceil(ret11/4)=8,size1,.)) as r08,
			sum(ifn(ceil(ret11/4)=9,size1,.)*ret)/sum(ifn(ceil(ret11/4)=9,size1,.)) as r09,
			sum(ifn(ceil(ret11/4)=10,size1,.)*ret)/sum(ifn(ceil(ret11/4)=10,size1,.)) as r10,
			sum(ifn(ceil(ret11/4)=11,size1,.)*ret)/sum(ifn(ceil(ret11/4)=11,size1,.)) as r11,
			sum(ifn(ceil(ret11/4)=12,size1,.)*ret)/sum(ifn(ceil(ret11/4)=12,size1,.)) as r12,
			sum(ifn(ceil(ret11/4)=13,size1,.)*ret)/sum(ifn(ceil(ret11/4)=13,size1,.)) as r13,
			sum(ifn(ceil(ret11/4)=14,size1,.)*ret)/sum(ifn(ceil(ret11/4)=14,size1,.)) as r14,
			sum(ifn(ceil(ret11/4)=15,size1,.)*ret)/sum(ifn(ceil(ret11/4)=15,size1,.)) as r15,
			sum(ifn(ceil(ret11/4)=16,size1,.)*ret)/sum(ifn(ceil(ret11/4)=16,size1,.)) as r16,
			sum(ifn(ceil(ret11/4)=17,size1,.)*ret)/sum(ifn(ceil(ret11/4)=17,size1,.)) as r17,
			sum(ifn(ceil(ret11/4)=18,size1,.)*ret)/sum(ifn(ceil(ret11/4)=18,size1,.)) as r18,
			sum(ifn(ceil(ret11/4)=19,size1,.)*ret)/sum(ifn(ceil(ret11/4)=19,size1,.)) as r19,
			sum(ifn(ceil(ret11/4)=20,size1,.)*ret)/sum(ifn(ceil(ret11/4)=20,size1,.)) as r20,
			sum(ifn(ceil(ret11/4)=21,size1,.)*ret)/sum(ifn(ceil(ret11/4)=21,size1,.)) as r21,
			sum(ifn(ceil(ret11/4)=22,size1,.)*ret)/sum(ifn(ceil(ret11/4)=22,size1,.)) as r22,
			sum(ifn(ceil(ret11/4)=23,size1,.)*ret)/sum(ifn(ceil(ret11/4)=23,size1,.)) as r23,
			sum(ifn(ceil(ret11/4)=24,size1,.)*ret)/sum(ifn(ceil(ret11/4)=24,size1,.)) as r24
		from ret_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_ret11_25;
run;

endrsubmit;
