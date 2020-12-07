libname r "!userprofile\desktop\sas\decalogue\ret_beta60\";

rsubmit;

proc sql;
	create table ret_beta60_10 as
		select date,
			sum(ifn(0<=beta60<=9,size1,.)*ret)/sum(ifn(0<=beta60<=9,size1,.)) as b0,
			sum(ifn(10<=beta60<=19,size1,.)*ret)/sum(ifn(10<=beta60<=19,size1,.)) as b1,
			sum(ifn(20<=beta60<=29,size1,.)*ret)/sum(ifn(20<=beta60<=29,size1,.)) as b2,
			sum(ifn(30<=beta60<=39,size1,.)*ret)/sum(ifn(30<=beta60<=39,size1,.)) as b3,
			sum(ifn(40<=beta60<=49,size1,.)*ret)/sum(ifn(40<=beta60<=49,size1,.)) as b4,
			sum(ifn(50<=beta60<=59,size1,.)*ret)/sum(ifn(50<=beta60<=59,size1,.)) as b5,
			sum(ifn(60<=beta60<=69,size1,.)*ret)/sum(ifn(60<=beta60<=69,size1,.)) as b6,
			sum(ifn(70<=beta60<=79,size1,.)*ret)/sum(ifn(70<=beta60<=79,size1,.)) as b7,
			sum(ifn(80<=beta60<=89,size1,.)*ret)/sum(ifn(80<=beta60<=89,size1,.)) as b8,
			sum(ifn(90<=beta60<=99,size1,.)*ret)/sum(ifn(90<=beta60<=99,size1,.)) as b9
		from ret_beta60
		group by date
		order by date;
quit;

proc download out=r.ret_beta60_10;
run;

endrsubmit;
