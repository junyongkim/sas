libname r "!userprofile\desktop\ret_mecshr\";

rsubmit;

proc sql;
	create table ret_mecshr_10 as
		select date,
			sum(ifn(mecshr=0,size1,.)*ret)/sum(ifn(mecshr=0,size1,.)) as c0,
			sum(ifn(mecshr=1,size1,.)*ret)/sum(ifn(mecshr=1,size1,.)) as c1,
			sum(ifn(mecshr=2,size1,.)*ret)/sum(ifn(mecshr=2,size1,.)) as c2,
			sum(ifn(mecshr=3,size1,.)*ret)/sum(ifn(mecshr=3,size1,.)) as c3,
			sum(ifn(mecshr=4,size1,.)*ret)/sum(ifn(mecshr=4,size1,.)) as c4,
			sum(ifn(mecshr=5,size1,.)*ret)/sum(ifn(mecshr=5,size1,.)) as c5,
			sum(ifn(mecshr=6,size1,.)*ret)/sum(ifn(mecshr=6,size1,.)) as c6,
			sum(ifn(mecshr=7,size1,.)*ret)/sum(ifn(mecshr=7,size1,.)) as c7,
			sum(ifn(mecshr=8,size1,.)*ret)/sum(ifn(mecshr=8,size1,.)) as c8,
			sum(ifn(mecshr=9,size1,.)*ret)/sum(ifn(mecshr=9,size1,.)) as c9
		from ret_mecshr
		group by date
		order by date;
quit;

proc download out=r.ret_mecshr_10;
run;

endrsubmit;
