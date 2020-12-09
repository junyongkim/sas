libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

proc sql;
	create table ret_ret11_20 as
		select date,
			sum(ifn(floor(ret11/5)=0,size1,.)*ret)/sum(ifn(floor(ret11/5)=0,size1,.)) as r00,
			sum(ifn(floor(ret11/5)=1,size1,.)*ret)/sum(ifn(floor(ret11/5)=1,size1,.)) as r01,
			sum(ifn(floor(ret11/5)=2,size1,.)*ret)/sum(ifn(floor(ret11/5)=2,size1,.)) as r02,
			sum(ifn(floor(ret11/5)=3,size1,.)*ret)/sum(ifn(floor(ret11/5)=3,size1,.)) as r03,
			sum(ifn(floor(ret11/5)=4,size1,.)*ret)/sum(ifn(floor(ret11/5)=4,size1,.)) as r04,
			sum(ifn(floor(ret11/5)=5,size1,.)*ret)/sum(ifn(floor(ret11/5)=5,size1,.)) as r05,
			sum(ifn(floor(ret11/5)=6,size1,.)*ret)/sum(ifn(floor(ret11/5)=6,size1,.)) as r06,
			sum(ifn(floor(ret11/5)=7,size1,.)*ret)/sum(ifn(floor(ret11/5)=7,size1,.)) as r07,
			sum(ifn(floor(ret11/5)=8,size1,.)*ret)/sum(ifn(floor(ret11/5)=8,size1,.)) as r08,
			sum(ifn(floor(ret11/5)=9,size1,.)*ret)/sum(ifn(floor(ret11/5)=9,size1,.)) as r09,
			sum(ifn(floor(ret11/5)=10,size1,.)*ret)/sum(ifn(floor(ret11/5)=10,size1,.)) as r10,
			sum(ifn(floor(ret11/5)=11,size1,.)*ret)/sum(ifn(floor(ret11/5)=11,size1,.)) as r11,
			sum(ifn(floor(ret11/5)=12,size1,.)*ret)/sum(ifn(floor(ret11/5)=12,size1,.)) as r12,
			sum(ifn(floor(ret11/5)=13,size1,.)*ret)/sum(ifn(floor(ret11/5)=13,size1,.)) as r13,
			sum(ifn(floor(ret11/5)=14,size1,.)*ret)/sum(ifn(floor(ret11/5)=14,size1,.)) as r14,
			sum(ifn(floor(ret11/5)=15,size1,.)*ret)/sum(ifn(floor(ret11/5)=15,size1,.)) as r15,
			sum(ifn(floor(ret11/5)=16,size1,.)*ret)/sum(ifn(floor(ret11/5)=16,size1,.)) as r16,
			sum(ifn(floor(ret11/5)=17,size1,.)*ret)/sum(ifn(floor(ret11/5)=17,size1,.)) as r17,
			sum(ifn(floor(ret11/5)=18,size1,.)*ret)/sum(ifn(floor(ret11/5)=18,size1,.)) as r18,
			sum(ifn(floor(ret11/5)=19,size1,.)*ret)/sum(ifn(floor(ret11/5)=19,size1,.)) as r19
		from ret_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_ret11_20;
run;

endrsubmit;
