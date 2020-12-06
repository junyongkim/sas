libname r "!userprofile\desktop\sas\decalogue\ret_op_in\";

rsubmit;

proc sql;
	create table ret_op_in_5x5 as
		select date,
			sum(ifn(op in (0,1) and in in (0,1),size1,.)*ret)/sum(ifn(op in (0,1) and in in (0,1),size1,.)) as o1i1,
			sum(ifn(op in (0,1) and in in (2,3),size1,.)*ret)/sum(ifn(op in (0,1) and in in (2,3),size1,.)) as o1i2,
			sum(ifn(op in (0,1) and in in (4,5),size1,.)*ret)/sum(ifn(op in (0,1) and in in (4,5),size1,.)) as o1i3,
			sum(ifn(op in (0,1) and in in (6,7),size1,.)*ret)/sum(ifn(op in (0,1) and in in (6,7),size1,.)) as o1i4,
			sum(ifn(op in (0,1) and in in (8,9),size1,.)*ret)/sum(ifn(op in (0,1) and in in (8,9),size1,.)) as o1i5,
			sum(ifn(op in (2,3) and in in (0,1),size1,.)*ret)/sum(ifn(op in (2,3) and in in (0,1),size1,.)) as o2i1,
			sum(ifn(op in (2,3) and in in (2,3),size1,.)*ret)/sum(ifn(op in (2,3) and in in (2,3),size1,.)) as o2i2,
			sum(ifn(op in (2,3) and in in (4,5),size1,.)*ret)/sum(ifn(op in (2,3) and in in (4,5),size1,.)) as o2i3,
			sum(ifn(op in (2,3) and in in (6,7),size1,.)*ret)/sum(ifn(op in (2,3) and in in (6,7),size1,.)) as o2i4,
			sum(ifn(op in (2,3) and in in (8,9),size1,.)*ret)/sum(ifn(op in (2,3) and in in (8,9),size1,.)) as o2i5,
			sum(ifn(op in (4,5) and in in (0,1),size1,.)*ret)/sum(ifn(op in (4,5) and in in (0,1),size1,.)) as o3i1,
			sum(ifn(op in (4,5) and in in (2,3),size1,.)*ret)/sum(ifn(op in (4,5) and in in (2,3),size1,.)) as o3i2,
			sum(ifn(op in (4,5) and in in (4,5),size1,.)*ret)/sum(ifn(op in (4,5) and in in (4,5),size1,.)) as o3i3,
			sum(ifn(op in (4,5) and in in (6,7),size1,.)*ret)/sum(ifn(op in (4,5) and in in (6,7),size1,.)) as o3i4,
			sum(ifn(op in (4,5) and in in (8,9),size1,.)*ret)/sum(ifn(op in (4,5) and in in (8,9),size1,.)) as o3i5,
			sum(ifn(op in (6,7) and in in (0,1),size1,.)*ret)/sum(ifn(op in (6,7) and in in (0,1),size1,.)) as o4i1,
			sum(ifn(op in (6,7) and in in (2,3),size1,.)*ret)/sum(ifn(op in (6,7) and in in (2,3),size1,.)) as o4i2,
			sum(ifn(op in (6,7) and in in (4,5),size1,.)*ret)/sum(ifn(op in (6,7) and in in (4,5),size1,.)) as o4i3,
			sum(ifn(op in (6,7) and in in (6,7),size1,.)*ret)/sum(ifn(op in (6,7) and in in (6,7),size1,.)) as o4i4,
			sum(ifn(op in (6,7) and in in (8,9),size1,.)*ret)/sum(ifn(op in (6,7) and in in (8,9),size1,.)) as o4i5,
			sum(ifn(op in (8,9) and in in (0,1),size1,.)*ret)/sum(ifn(op in (8,9) and in in (0,1),size1,.)) as o5i1,
			sum(ifn(op in (8,9) and in in (2,3),size1,.)*ret)/sum(ifn(op in (8,9) and in in (2,3),size1,.)) as o5i2,
			sum(ifn(op in (8,9) and in in (4,5),size1,.)*ret)/sum(ifn(op in (8,9) and in in (4,5),size1,.)) as o5i3,
			sum(ifn(op in (8,9) and in in (6,7),size1,.)*ret)/sum(ifn(op in (8,9) and in in (6,7),size1,.)) as o5i4,
			sum(ifn(op in (8,9) and in in (8,9),size1,.)*ret)/sum(ifn(op in (8,9) and in in (8,9),size1,.)) as o5i5
		from ret_op_in
		group by date
		order by date;
quit;

proc download out=r.ret_op_in_5x5;
run;

endrsubmit;
