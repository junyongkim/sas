libname r "!userprofile\desktop\sas\decalogue\ret_ret5_ret6\";

rsubmit;

proc sql;
	create table ret_ret5_ret6_5x5 as
		select date,
			sum(ifn(ret5 in (0,1) and ret6 in (0,1),size1,.)*ret)/sum(ifn(ret5 in (0,1) and ret6 in (0,1),size1,.)) as r1i1,
			sum(ifn(ret5 in (0,1) and ret6 in (2,3),size1,.)*ret)/sum(ifn(ret5 in (0,1) and ret6 in (2,3),size1,.)) as r1i2,
			sum(ifn(ret5 in (0,1) and ret6 in (4,5),size1,.)*ret)/sum(ifn(ret5 in (0,1) and ret6 in (4,5),size1,.)) as r1i3,
			sum(ifn(ret5 in (0,1) and ret6 in (6,7),size1,.)*ret)/sum(ifn(ret5 in (0,1) and ret6 in (6,7),size1,.)) as r1i4,
			sum(ifn(ret5 in (0,1) and ret6 in (8,9),size1,.)*ret)/sum(ifn(ret5 in (0,1) and ret6 in (8,9),size1,.)) as r1i5,
			sum(ifn(ret5 in (2,3) and ret6 in (0,1),size1,.)*ret)/sum(ifn(ret5 in (2,3) and ret6 in (0,1),size1,.)) as r2i1,
			sum(ifn(ret5 in (2,3) and ret6 in (2,3),size1,.)*ret)/sum(ifn(ret5 in (2,3) and ret6 in (2,3),size1,.)) as r2i2,
			sum(ifn(ret5 in (2,3) and ret6 in (4,5),size1,.)*ret)/sum(ifn(ret5 in (2,3) and ret6 in (4,5),size1,.)) as r2i3,
			sum(ifn(ret5 in (2,3) and ret6 in (6,7),size1,.)*ret)/sum(ifn(ret5 in (2,3) and ret6 in (6,7),size1,.)) as r2i4,
			sum(ifn(ret5 in (2,3) and ret6 in (8,9),size1,.)*ret)/sum(ifn(ret5 in (2,3) and ret6 in (8,9),size1,.)) as r2i5,
			sum(ifn(ret5 in (4,5) and ret6 in (0,1),size1,.)*ret)/sum(ifn(ret5 in (4,5) and ret6 in (0,1),size1,.)) as r3i1,
			sum(ifn(ret5 in (4,5) and ret6 in (2,3),size1,.)*ret)/sum(ifn(ret5 in (4,5) and ret6 in (2,3),size1,.)) as r3i2,
			sum(ifn(ret5 in (4,5) and ret6 in (4,5),size1,.)*ret)/sum(ifn(ret5 in (4,5) and ret6 in (4,5),size1,.)) as r3i3,
			sum(ifn(ret5 in (4,5) and ret6 in (6,7),size1,.)*ret)/sum(ifn(ret5 in (4,5) and ret6 in (6,7),size1,.)) as r3i4,
			sum(ifn(ret5 in (4,5) and ret6 in (8,9),size1,.)*ret)/sum(ifn(ret5 in (4,5) and ret6 in (8,9),size1,.)) as r3i5,
			sum(ifn(ret5 in (6,7) and ret6 in (0,1),size1,.)*ret)/sum(ifn(ret5 in (6,7) and ret6 in (0,1),size1,.)) as r4i1,
			sum(ifn(ret5 in (6,7) and ret6 in (2,3),size1,.)*ret)/sum(ifn(ret5 in (6,7) and ret6 in (2,3),size1,.)) as r4i2,
			sum(ifn(ret5 in (6,7) and ret6 in (4,5),size1,.)*ret)/sum(ifn(ret5 in (6,7) and ret6 in (4,5),size1,.)) as r4i3,
			sum(ifn(ret5 in (6,7) and ret6 in (6,7),size1,.)*ret)/sum(ifn(ret5 in (6,7) and ret6 in (6,7),size1,.)) as r4i4,
			sum(ifn(ret5 in (6,7) and ret6 in (8,9),size1,.)*ret)/sum(ifn(ret5 in (6,7) and ret6 in (8,9),size1,.)) as r4i5,
			sum(ifn(ret5 in (8,9) and ret6 in (0,1),size1,.)*ret)/sum(ifn(ret5 in (8,9) and ret6 in (0,1),size1,.)) as r5i1,
			sum(ifn(ret5 in (8,9) and ret6 in (2,3),size1,.)*ret)/sum(ifn(ret5 in (8,9) and ret6 in (2,3),size1,.)) as r5i2,
			sum(ifn(ret5 in (8,9) and ret6 in (4,5),size1,.)*ret)/sum(ifn(ret5 in (8,9) and ret6 in (4,5),size1,.)) as r5i3,
			sum(ifn(ret5 in (8,9) and ret6 in (6,7),size1,.)*ret)/sum(ifn(ret5 in (8,9) and ret6 in (6,7),size1,.)) as r5i4,
			sum(ifn(ret5 in (8,9) and ret6 in (8,9),size1,.)*ret)/sum(ifn(ret5 in (8,9) and ret6 in (8,9),size1,.)) as r5i5
		from ret_ret5_ret6
		group by date
		order by date;
quit;

proc download out=r.ret_ret5_ret6_5x5;
run;

endrsubmit;
