libname r "!userprofile\desktop\sas\decalogue\ret_max\";

rsubmit;

proc sql;
	create table ret_max_10 as
		select date,
			sum(ifn(max=0,size1,.)*ret)/sum(ifn(max=0,size1,.)) as m0,
			sum(ifn(max=1,size1,.)*ret)/sum(ifn(max=1,size1,.)) as m1,
			sum(ifn(max=2,size1,.)*ret)/sum(ifn(max=2,size1,.)) as m2,
			sum(ifn(max=3,size1,.)*ret)/sum(ifn(max=3,size1,.)) as m3,
			sum(ifn(max=4,size1,.)*ret)/sum(ifn(max=4,size1,.)) as m4,
			sum(ifn(max=5,size1,.)*ret)/sum(ifn(max=5,size1,.)) as m5,
			sum(ifn(max=6,size1,.)*ret)/sum(ifn(max=6,size1,.)) as m6,
			sum(ifn(max=7,size1,.)*ret)/sum(ifn(max=7,size1,.)) as m7,
			sum(ifn(max=8,size1,.)*ret)/sum(ifn(max=8,size1,.)) as m8,
			sum(ifn(max=9,size1,.)*ret)/sum(ifn(max=9,size1,.)) as m9
		from ret_max
		group by date
		order by date;
quit;

proc download out=r.ret_max_10;
run;

endrsubmit;
