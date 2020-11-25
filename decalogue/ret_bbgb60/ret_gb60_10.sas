libname r "!userprofile\desktop\sas\decalogue\ret_bbgb60\";

rsubmit;

proc sql;
	create table ret_gb60_10 as
		select date,
			sum(ifn(gb60=0,size1,.)*ret)/sum(ifn(gb60=0,size1,.)) as b0,
			sum(ifn(gb60=1,size1,.)*ret)/sum(ifn(gb60=1,size1,.)) as b1,
			sum(ifn(gb60=2,size1,.)*ret)/sum(ifn(gb60=2,size1,.)) as b2,
			sum(ifn(gb60=3,size1,.)*ret)/sum(ifn(gb60=3,size1,.)) as b3,
			sum(ifn(gb60=4,size1,.)*ret)/sum(ifn(gb60=4,size1,.)) as b4,
			sum(ifn(gb60=5,size1,.)*ret)/sum(ifn(gb60=5,size1,.)) as b5,
			sum(ifn(gb60=6,size1,.)*ret)/sum(ifn(gb60=6,size1,.)) as b6,
			sum(ifn(gb60=7,size1,.)*ret)/sum(ifn(gb60=7,size1,.)) as b7,
			sum(ifn(gb60=8,size1,.)*ret)/sum(ifn(gb60=8,size1,.)) as b8,
			sum(ifn(gb60=9,size1,.)*ret)/sum(ifn(gb60=9,size1,.)) as b9
		from ret_bbgb60
		group by date
		order by date;
quit;

proc download out=r.ret_gb60_10;
run;

endrsubmit;
