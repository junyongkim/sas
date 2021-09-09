libname r "!userprofile\desktop\sas\decalogue\ret_cshr\";

rsubmit;

proc sql;
	create table ret_cshr_10 as
		select date,
			sum(ifn(cshr=0,size1,.)*ret)/sum(ifn(cshr=0,size1,.)) as c0,
			sum(ifn(cshr=1,size1,.)*ret)/sum(ifn(cshr=1,size1,.)) as c1,
			sum(ifn(cshr=2,size1,.)*ret)/sum(ifn(cshr=2,size1,.)) as c2,
			sum(ifn(cshr=3,size1,.)*ret)/sum(ifn(cshr=3,size1,.)) as c3,
			sum(ifn(cshr=4,size1,.)*ret)/sum(ifn(cshr=4,size1,.)) as c4,
			sum(ifn(cshr=5,size1,.)*ret)/sum(ifn(cshr=5,size1,.)) as c5,
			sum(ifn(cshr=6,size1,.)*ret)/sum(ifn(cshr=6,size1,.)) as c6,
			sum(ifn(cshr=7,size1,.)*ret)/sum(ifn(cshr=7,size1,.)) as c7,
			sum(ifn(cshr=8,size1,.)*ret)/sum(ifn(cshr=8,size1,.)) as c8,
			sum(ifn(cshr=9,size1,.)*ret)/sum(ifn(cshr=9,size1,.)) as c9
		from ret_cshr
		group by date
		order by date;
quit;

proc download out=r.ret_cshr_10;
run;

endrsubmit;
