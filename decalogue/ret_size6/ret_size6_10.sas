libname r "!userprofile\desktop\sas\decalogue\ret_size6\";

rsubmit;

proc sql;
	create table ret_size6_10 as
		select date,
			sum(ifn(size6=0,size1,.)*ret)/sum(ifn(size6=0,size1,.)) as s0,
			sum(ifn(size6=1,size1,.)*ret)/sum(ifn(size6=1,size1,.)) as s1,
			sum(ifn(size6=2,size1,.)*ret)/sum(ifn(size6=2,size1,.)) as s2,
			sum(ifn(size6=3,size1,.)*ret)/sum(ifn(size6=3,size1,.)) as s3,
			sum(ifn(size6=4,size1,.)*ret)/sum(ifn(size6=4,size1,.)) as s4,
			sum(ifn(size6=5,size1,.)*ret)/sum(ifn(size6=5,size1,.)) as s5,
			sum(ifn(size6=6,size1,.)*ret)/sum(ifn(size6=6,size1,.)) as s6,
			sum(ifn(size6=7,size1,.)*ret)/sum(ifn(size6=7,size1,.)) as s7,
			sum(ifn(size6=8,size1,.)*ret)/sum(ifn(size6=8,size1,.)) as s8,
			sum(ifn(size6=9,size1,.)*ret)/sum(ifn(size6=9,size1,.)) as s9
		from ret_size6
		group by date
		order by date;
quit;

proc download out=r.ret_size6_10;
run;

endrsubmit;
