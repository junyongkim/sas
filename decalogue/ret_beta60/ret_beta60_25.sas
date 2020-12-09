libname r "!userprofile\desktop\sas\decalogue\ret_beta60\";

rsubmit;

proc sql;
	create table ret_beta60_25 as
		select date,
			sum(ifn(floor(beta60/4)=0,size1,.)*ret)/sum(ifn(floor(beta60/4)=0,size1,.)) as b00,
			sum(ifn(floor(beta60/4)=1,size1,.)*ret)/sum(ifn(floor(beta60/4)=1,size1,.)) as b01,
			sum(ifn(floor(beta60/4)=2,size1,.)*ret)/sum(ifn(floor(beta60/4)=2,size1,.)) as b02,
			sum(ifn(floor(beta60/4)=3,size1,.)*ret)/sum(ifn(floor(beta60/4)=3,size1,.)) as b03,
			sum(ifn(floor(beta60/4)=4,size1,.)*ret)/sum(ifn(floor(beta60/4)=4,size1,.)) as b04,
			sum(ifn(floor(beta60/4)=5,size1,.)*ret)/sum(ifn(floor(beta60/4)=5,size1,.)) as b05,
			sum(ifn(floor(beta60/4)=6,size1,.)*ret)/sum(ifn(floor(beta60/4)=6,size1,.)) as b06,
			sum(ifn(floor(beta60/4)=7,size1,.)*ret)/sum(ifn(floor(beta60/4)=7,size1,.)) as b07,
			sum(ifn(floor(beta60/4)=8,size1,.)*ret)/sum(ifn(floor(beta60/4)=8,size1,.)) as b08,
			sum(ifn(floor(beta60/4)=9,size1,.)*ret)/sum(ifn(floor(beta60/4)=9,size1,.)) as b09,
			sum(ifn(floor(beta60/4)=10,size1,.)*ret)/sum(ifn(floor(beta60/4)=10,size1,.)) as b10,
			sum(ifn(floor(beta60/4)=11,size1,.)*ret)/sum(ifn(floor(beta60/4)=11,size1,.)) as b11,
			sum(ifn(floor(beta60/4)=12,size1,.)*ret)/sum(ifn(floor(beta60/4)=12,size1,.)) as b12,
			sum(ifn(floor(beta60/4)=13,size1,.)*ret)/sum(ifn(floor(beta60/4)=13,size1,.)) as b13,
			sum(ifn(floor(beta60/4)=14,size1,.)*ret)/sum(ifn(floor(beta60/4)=14,size1,.)) as b14,
			sum(ifn(floor(beta60/4)=15,size1,.)*ret)/sum(ifn(floor(beta60/4)=15,size1,.)) as b15,
			sum(ifn(floor(beta60/4)=16,size1,.)*ret)/sum(ifn(floor(beta60/4)=16,size1,.)) as b16,
			sum(ifn(floor(beta60/4)=17,size1,.)*ret)/sum(ifn(floor(beta60/4)=17,size1,.)) as b17,
			sum(ifn(floor(beta60/4)=18,size1,.)*ret)/sum(ifn(floor(beta60/4)=18,size1,.)) as b18,
			sum(ifn(floor(beta60/4)=19,size1,.)*ret)/sum(ifn(floor(beta60/4)=19,size1,.)) as b19,
			sum(ifn(floor(beta60/4)=20,size1,.)*ret)/sum(ifn(floor(beta60/4)=20,size1,.)) as b20,
			sum(ifn(floor(beta60/4)=21,size1,.)*ret)/sum(ifn(floor(beta60/4)=21,size1,.)) as b21,
			sum(ifn(floor(beta60/4)=22,size1,.)*ret)/sum(ifn(floor(beta60/4)=22,size1,.)) as b22,
			sum(ifn(floor(beta60/4)=23,size1,.)*ret)/sum(ifn(floor(beta60/4)=23,size1,.)) as b23,
			sum(ifn(floor(beta60/4)=24,size1,.)*ret)/sum(ifn(floor(beta60/4)=24,size1,.)) as b24
		from ret_beta60
		group by date
		order by date;
quit;

proc download out=r.ret_beta60_25;
run;

endrsubmit;
