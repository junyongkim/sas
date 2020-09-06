libname r "!userprofile\desktop\sas\decalogue\ret_ivol\";

rsubmit;

proc sql;
	create table ret_ivol_10 as
		select date,
			sum(ifn(ivol=0,size1,.)*ret)/sum(ifn(ivol=0,size1,.)) as i0,
			sum(ifn(ivol=1,size1,.)*ret)/sum(ifn(ivol=1,size1,.)) as i1,
			sum(ifn(ivol=2,size1,.)*ret)/sum(ifn(ivol=2,size1,.)) as i2,
			sum(ifn(ivol=3,size1,.)*ret)/sum(ifn(ivol=3,size1,.)) as i3,
			sum(ifn(ivol=4,size1,.)*ret)/sum(ifn(ivol=4,size1,.)) as i4,
			sum(ifn(ivol=5,size1,.)*ret)/sum(ifn(ivol=5,size1,.)) as i5,
			sum(ifn(ivol=6,size1,.)*ret)/sum(ifn(ivol=6,size1,.)) as i6,
			sum(ifn(ivol=7,size1,.)*ret)/sum(ifn(ivol=7,size1,.)) as i7,
			sum(ifn(ivol=8,size1,.)*ret)/sum(ifn(ivol=8,size1,.)) as i8,
			sum(ifn(ivol=9,size1,.)*ret)/sum(ifn(ivol=9,size1,.)) as i9
		from ret_ivol
		group by date
		order by date;
quit;

proc download out=r.ret_ivol_10;
run;

endrsubmit;
