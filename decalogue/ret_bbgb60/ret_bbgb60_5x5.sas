libname r "!userprofile\desktop\sas\decalogue\ret_bbgb60\";

rsubmit;

proc sql;
	create table ret_bbgb60_5x5 as
		select date,
			sum(ifn(bb60 in (0,1) and gb60 in (0,1),size1,.)*ret)/sum(ifn(bb60 in (0,1) and gb60 in (0,1),size1,.)) as b1g1,
			sum(ifn(bb60 in (0,1) and gb60 in (2,3),size1,.)*ret)/sum(ifn(bb60 in (0,1) and gb60 in (2,3),size1,.)) as b1g2,
			sum(ifn(bb60 in (0,1) and gb60 in (4,5),size1,.)*ret)/sum(ifn(bb60 in (0,1) and gb60 in (4,5),size1,.)) as b1g3,
			sum(ifn(bb60 in (0,1) and gb60 in (6,7),size1,.)*ret)/sum(ifn(bb60 in (0,1) and gb60 in (6,7),size1,.)) as b1g4,
			sum(ifn(bb60 in (0,1) and gb60 in (8,9),size1,.)*ret)/sum(ifn(bb60 in (0,1) and gb60 in (8,9),size1,.)) as b1g5,
			sum(ifn(bb60 in (2,3) and gb60 in (0,1),size1,.)*ret)/sum(ifn(bb60 in (2,3) and gb60 in (0,1),size1,.)) as b2g1,
			sum(ifn(bb60 in (2,3) and gb60 in (2,3),size1,.)*ret)/sum(ifn(bb60 in (2,3) and gb60 in (2,3),size1,.)) as b2g2,
			sum(ifn(bb60 in (2,3) and gb60 in (4,5),size1,.)*ret)/sum(ifn(bb60 in (2,3) and gb60 in (4,5),size1,.)) as b2g3,
			sum(ifn(bb60 in (2,3) and gb60 in (6,7),size1,.)*ret)/sum(ifn(bb60 in (2,3) and gb60 in (6,7),size1,.)) as b2g4,
			sum(ifn(bb60 in (2,3) and gb60 in (8,9),size1,.)*ret)/sum(ifn(bb60 in (2,3) and gb60 in (8,9),size1,.)) as b2g5,
			sum(ifn(bb60 in (4,5) and gb60 in (0,1),size1,.)*ret)/sum(ifn(bb60 in (4,5) and gb60 in (0,1),size1,.)) as b3g1,
			sum(ifn(bb60 in (4,5) and gb60 in (2,3),size1,.)*ret)/sum(ifn(bb60 in (4,5) and gb60 in (2,3),size1,.)) as b3g2,
			sum(ifn(bb60 in (4,5) and gb60 in (4,5),size1,.)*ret)/sum(ifn(bb60 in (4,5) and gb60 in (4,5),size1,.)) as b3g3,
			sum(ifn(bb60 in (4,5) and gb60 in (6,7),size1,.)*ret)/sum(ifn(bb60 in (4,5) and gb60 in (6,7),size1,.)) as b3g4,
			sum(ifn(bb60 in (4,5) and gb60 in (8,9),size1,.)*ret)/sum(ifn(bb60 in (4,5) and gb60 in (8,9),size1,.)) as b3g5,
			sum(ifn(bb60 in (6,7) and gb60 in (0,1),size1,.)*ret)/sum(ifn(bb60 in (6,7) and gb60 in (0,1),size1,.)) as b4g1,
			sum(ifn(bb60 in (6,7) and gb60 in (2,3),size1,.)*ret)/sum(ifn(bb60 in (6,7) and gb60 in (2,3),size1,.)) as b4g2,
			sum(ifn(bb60 in (6,7) and gb60 in (4,5),size1,.)*ret)/sum(ifn(bb60 in (6,7) and gb60 in (4,5),size1,.)) as b4g3,
			sum(ifn(bb60 in (6,7) and gb60 in (6,7),size1,.)*ret)/sum(ifn(bb60 in (6,7) and gb60 in (6,7),size1,.)) as b4g4,
			sum(ifn(bb60 in (6,7) and gb60 in (8,9),size1,.)*ret)/sum(ifn(bb60 in (6,7) and gb60 in (8,9),size1,.)) as b4g5,
			sum(ifn(bb60 in (8,9) and gb60 in (0,1),size1,.)*ret)/sum(ifn(bb60 in (8,9) and gb60 in (0,1),size1,.)) as b5g1,
			sum(ifn(bb60 in (8,9) and gb60 in (2,3),size1,.)*ret)/sum(ifn(bb60 in (8,9) and gb60 in (2,3),size1,.)) as b5g2,
			sum(ifn(bb60 in (8,9) and gb60 in (4,5),size1,.)*ret)/sum(ifn(bb60 in (8,9) and gb60 in (4,5),size1,.)) as b5g3,
			sum(ifn(bb60 in (8,9) and gb60 in (6,7),size1,.)*ret)/sum(ifn(bb60 in (8,9) and gb60 in (6,7),size1,.)) as b5g4,
			sum(ifn(bb60 in (8,9) and gb60 in (8,9),size1,.)*ret)/sum(ifn(bb60 in (8,9) and gb60 in (8,9),size1,.)) as b5g5
		from ret_bbgb60
		group by date
		order by date;
quit;

proc download out=r.ret_bbgb60_5x5;
run;

endrsubmit;
