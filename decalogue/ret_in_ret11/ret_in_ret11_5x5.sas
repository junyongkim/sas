libname r "!userprofile\desktop\sas\decalogue\ret_in_ret11\";

rsubmit;

proc sql;
	create table ret_in_ret11_5x5 as
		select date,
			sum(ifn(in in (0,1) and ret11 in (0,1),size1,.)*ret)/sum(ifn(in in (0,1) and ret11 in (0,1),size1,.)) as i1r1,
			sum(ifn(in in (0,1) and ret11 in (2,3),size1,.)*ret)/sum(ifn(in in (0,1) and ret11 in (2,3),size1,.)) as i1r2,
			sum(ifn(in in (0,1) and ret11 in (4,5),size1,.)*ret)/sum(ifn(in in (0,1) and ret11 in (4,5),size1,.)) as i1r3,
			sum(ifn(in in (0,1) and ret11 in (6,7),size1,.)*ret)/sum(ifn(in in (0,1) and ret11 in (6,7),size1,.)) as i1r4,
			sum(ifn(in in (0,1) and ret11 in (8,9),size1,.)*ret)/sum(ifn(in in (0,1) and ret11 in (8,9),size1,.)) as i1r5,
			sum(ifn(in in (2,3) and ret11 in (0,1),size1,.)*ret)/sum(ifn(in in (2,3) and ret11 in (0,1),size1,.)) as i2r1,
			sum(ifn(in in (2,3) and ret11 in (2,3),size1,.)*ret)/sum(ifn(in in (2,3) and ret11 in (2,3),size1,.)) as i2r2,
			sum(ifn(in in (2,3) and ret11 in (4,5),size1,.)*ret)/sum(ifn(in in (2,3) and ret11 in (4,5),size1,.)) as i2r3,
			sum(ifn(in in (2,3) and ret11 in (6,7),size1,.)*ret)/sum(ifn(in in (2,3) and ret11 in (6,7),size1,.)) as i2r4,
			sum(ifn(in in (2,3) and ret11 in (8,9),size1,.)*ret)/sum(ifn(in in (2,3) and ret11 in (8,9),size1,.)) as i2r5,
			sum(ifn(in in (4,5) and ret11 in (0,1),size1,.)*ret)/sum(ifn(in in (4,5) and ret11 in (0,1),size1,.)) as i3r1,
			sum(ifn(in in (4,5) and ret11 in (2,3),size1,.)*ret)/sum(ifn(in in (4,5) and ret11 in (2,3),size1,.)) as i3r2,
			sum(ifn(in in (4,5) and ret11 in (4,5),size1,.)*ret)/sum(ifn(in in (4,5) and ret11 in (4,5),size1,.)) as i3r3,
			sum(ifn(in in (4,5) and ret11 in (6,7),size1,.)*ret)/sum(ifn(in in (4,5) and ret11 in (6,7),size1,.)) as i3r4,
			sum(ifn(in in (4,5) and ret11 in (8,9),size1,.)*ret)/sum(ifn(in in (4,5) and ret11 in (8,9),size1,.)) as i3r5,
			sum(ifn(in in (6,7) and ret11 in (0,1),size1,.)*ret)/sum(ifn(in in (6,7) and ret11 in (0,1),size1,.)) as i4r1,
			sum(ifn(in in (6,7) and ret11 in (2,3),size1,.)*ret)/sum(ifn(in in (6,7) and ret11 in (2,3),size1,.)) as i4r2,
			sum(ifn(in in (6,7) and ret11 in (4,5),size1,.)*ret)/sum(ifn(in in (6,7) and ret11 in (4,5),size1,.)) as i4r3,
			sum(ifn(in in (6,7) and ret11 in (6,7),size1,.)*ret)/sum(ifn(in in (6,7) and ret11 in (6,7),size1,.)) as i4r4,
			sum(ifn(in in (6,7) and ret11 in (8,9),size1,.)*ret)/sum(ifn(in in (6,7) and ret11 in (8,9),size1,.)) as i4r5,
			sum(ifn(in in (8,9) and ret11 in (0,1),size1,.)*ret)/sum(ifn(in in (8,9) and ret11 in (0,1),size1,.)) as i5r1,
			sum(ifn(in in (8,9) and ret11 in (2,3),size1,.)*ret)/sum(ifn(in in (8,9) and ret11 in (2,3),size1,.)) as i5r2,
			sum(ifn(in in (8,9) and ret11 in (4,5),size1,.)*ret)/sum(ifn(in in (8,9) and ret11 in (4,5),size1,.)) as i5r3,
			sum(ifn(in in (8,9) and ret11 in (6,7),size1,.)*ret)/sum(ifn(in in (8,9) and ret11 in (6,7),size1,.)) as i5r4,
			sum(ifn(in in (8,9) and ret11 in (8,9),size1,.)*ret)/sum(ifn(in in (8,9) and ret11 in (8,9),size1,.)) as i5r5
		from ret_in_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_in_ret11_5x5;
run;

endrsubmit;
