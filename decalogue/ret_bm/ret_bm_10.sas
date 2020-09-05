libname r "!userprofile\desktop\sas\decalogue\ret_bm\";

rsubmit;

proc sql;
	create table ret_bm_10 as
		select date,
			sum(ifn(bm=-1,size1,.)*ret)/sum(ifn(bm=-1,size1,.)) as bn,
			sum(ifn(bm=0,size1,.)*ret)/sum(ifn(bm=0,size1,.)) as b0,
			sum(ifn(bm=1,size1,.)*ret)/sum(ifn(bm=1,size1,.)) as b1,
			sum(ifn(bm=2,size1,.)*ret)/sum(ifn(bm=2,size1,.)) as b2,
			sum(ifn(bm=3,size1,.)*ret)/sum(ifn(bm=3,size1,.)) as b3,
			sum(ifn(bm=4,size1,.)*ret)/sum(ifn(bm=4,size1,.)) as b4,
			sum(ifn(bm=5,size1,.)*ret)/sum(ifn(bm=5,size1,.)) as b5,
			sum(ifn(bm=6,size1,.)*ret)/sum(ifn(bm=6,size1,.)) as b6,
			sum(ifn(bm=7,size1,.)*ret)/sum(ifn(bm=7,size1,.)) as b7,
			sum(ifn(bm=8,size1,.)*ret)/sum(ifn(bm=8,size1,.)) as b8,
			sum(ifn(bm=9,size1,.)*ret)/sum(ifn(bm=9,size1,.)) as b9
		from ret_bm
		group by date
		order by date;
quit;

proc download out=r.ret_bm_10;
run;

endrsubmit;
