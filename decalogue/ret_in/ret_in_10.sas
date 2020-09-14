libname r "!userprofile\desktop\sas\decalogue\ret_in\";

rsubmit;

proc sql;
	create table ret_in_10 as
		select date,
			sum(ifn(in=0,size1,.)*ret)/sum(ifn(in=0,size1,.)) as i0,
			sum(ifn(in=1,size1,.)*ret)/sum(ifn(in=1,size1,.)) as i1,
			sum(ifn(in=2,size1,.)*ret)/sum(ifn(in=2,size1,.)) as i2,
			sum(ifn(in=3,size1,.)*ret)/sum(ifn(in=3,size1,.)) as i3,
			sum(ifn(in=4,size1,.)*ret)/sum(ifn(in=4,size1,.)) as i4,
			sum(ifn(in=5,size1,.)*ret)/sum(ifn(in=5,size1,.)) as i5,
			sum(ifn(in=6,size1,.)*ret)/sum(ifn(in=6,size1,.)) as i6,
			sum(ifn(in=7,size1,.)*ret)/sum(ifn(in=7,size1,.)) as i7,
			sum(ifn(in=8,size1,.)*ret)/sum(ifn(in=8,size1,.)) as i8,
			sum(ifn(in=9,size1,.)*ret)/sum(ifn(in=9,size1,.)) as i9
		from ret_in
		group by date
		order by date;
quit;

proc download out=r.ret_in_10;
run;

endrsubmit;
