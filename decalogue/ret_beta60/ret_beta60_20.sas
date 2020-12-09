libname r "!userprofile\desktop\sas\decalogue\ret_beta60\";

rsubmit;

proc sql;
	create table ret_beta60_20 as
		select date,
			sum(ifn(ceil(beta60/5)=0,size1,.)*ret)/sum(ifn(ceil(beta60/5)=0,size1,.)) as b00,
			sum(ifn(ceil(beta60/5)=1,size1,.)*ret)/sum(ifn(ceil(beta60/5)=1,size1,.)) as b01,
			sum(ifn(ceil(beta60/5)=2,size1,.)*ret)/sum(ifn(ceil(beta60/5)=2,size1,.)) as b02,
			sum(ifn(ceil(beta60/5)=3,size1,.)*ret)/sum(ifn(ceil(beta60/5)=3,size1,.)) as b03,
			sum(ifn(ceil(beta60/5)=4,size1,.)*ret)/sum(ifn(ceil(beta60/5)=4,size1,.)) as b04,
			sum(ifn(ceil(beta60/5)=5,size1,.)*ret)/sum(ifn(ceil(beta60/5)=5,size1,.)) as b05,
			sum(ifn(ceil(beta60/5)=6,size1,.)*ret)/sum(ifn(ceil(beta60/5)=6,size1,.)) as b06,
			sum(ifn(ceil(beta60/5)=7,size1,.)*ret)/sum(ifn(ceil(beta60/5)=7,size1,.)) as b07,
			sum(ifn(ceil(beta60/5)=8,size1,.)*ret)/sum(ifn(ceil(beta60/5)=8,size1,.)) as b08,
			sum(ifn(ceil(beta60/5)=9,size1,.)*ret)/sum(ifn(ceil(beta60/5)=9,size1,.)) as b09,
			sum(ifn(ceil(beta60/5)=10,size1,.)*ret)/sum(ifn(ceil(beta60/5)=10,size1,.)) as b10,
			sum(ifn(ceil(beta60/5)=11,size1,.)*ret)/sum(ifn(ceil(beta60/5)=11,size1,.)) as b11,
			sum(ifn(ceil(beta60/5)=12,size1,.)*ret)/sum(ifn(ceil(beta60/5)=12,size1,.)) as b12,
			sum(ifn(ceil(beta60/5)=13,size1,.)*ret)/sum(ifn(ceil(beta60/5)=13,size1,.)) as b13,
			sum(ifn(ceil(beta60/5)=14,size1,.)*ret)/sum(ifn(ceil(beta60/5)=14,size1,.)) as b14,
			sum(ifn(ceil(beta60/5)=15,size1,.)*ret)/sum(ifn(ceil(beta60/5)=15,size1,.)) as b15,
			sum(ifn(ceil(beta60/5)=16,size1,.)*ret)/sum(ifn(ceil(beta60/5)=16,size1,.)) as b16,
			sum(ifn(ceil(beta60/5)=17,size1,.)*ret)/sum(ifn(ceil(beta60/5)=17,size1,.)) as b17,
			sum(ifn(ceil(beta60/5)=18,size1,.)*ret)/sum(ifn(ceil(beta60/5)=18,size1,.)) as b18,
			sum(ifn(ceil(beta60/5)=19,size1,.)*ret)/sum(ifn(ceil(beta60/5)=19,size1,.)) as b19
		from ret_beta60
		group by date
		order by date;
quit;

proc download out=r.ret_beta60_20;
run;

endrsubmit;
