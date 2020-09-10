libname r "!userprofile\desktop\sas\decalogue\ret_beta60\";

rsubmit;

proc sql;
	create table ret_beta60_10 as
		select date,
			sum(ifn(beta60=0,size1,.)*ret)/sum(ifn(beta60=0,size1,.)) as b0,
			sum(ifn(beta60=1,size1,.)*ret)/sum(ifn(beta60=1,size1,.)) as b1,
			sum(ifn(beta60=2,size1,.)*ret)/sum(ifn(beta60=2,size1,.)) as b2,
			sum(ifn(beta60=3,size1,.)*ret)/sum(ifn(beta60=3,size1,.)) as b3,
			sum(ifn(beta60=4,size1,.)*ret)/sum(ifn(beta60=4,size1,.)) as b4,
			sum(ifn(beta60=5,size1,.)*ret)/sum(ifn(beta60=5,size1,.)) as b5,
			sum(ifn(beta60=6,size1,.)*ret)/sum(ifn(beta60=6,size1,.)) as b6,
			sum(ifn(beta60=7,size1,.)*ret)/sum(ifn(beta60=7,size1,.)) as b7,
			sum(ifn(beta60=8,size1,.)*ret)/sum(ifn(beta60=8,size1,.)) as b8,
			sum(ifn(beta60=9,size1,.)*ret)/sum(ifn(beta60=9,size1,.)) as b9
		from ret_beta60
		group by date
		order by date;
quit;

proc download out=r.ret_beta60_10;
run;

endrsubmit;
