libname r "!userprofile\desktop\sas\decalogue\ret_op_ret11\";

rsubmit;

proc sql;
	create table retd_op_ret11_5x5 as
		select date,
			sum(ifn(op in (0,1) and ret11 in (0,1),size1,.)*retd)/sum(ifn(op in (0,1) and ret11 in (0,1),size1,.)) as o1r1,
			sum(ifn(op in (0,1) and ret11 in (2,3),size1,.)*retd)/sum(ifn(op in (0,1) and ret11 in (2,3),size1,.)) as o1r2,
			sum(ifn(op in (0,1) and ret11 in (4,5),size1,.)*retd)/sum(ifn(op in (0,1) and ret11 in (4,5),size1,.)) as o1r3,
			sum(ifn(op in (0,1) and ret11 in (6,7),size1,.)*retd)/sum(ifn(op in (0,1) and ret11 in (6,7),size1,.)) as o1r4,
			sum(ifn(op in (0,1) and ret11 in (8,9),size1,.)*retd)/sum(ifn(op in (0,1) and ret11 in (8,9),size1,.)) as o1r5,
			sum(ifn(op in (2,3) and ret11 in (0,1),size1,.)*retd)/sum(ifn(op in (2,3) and ret11 in (0,1),size1,.)) as o2r1,
			sum(ifn(op in (2,3) and ret11 in (2,3),size1,.)*retd)/sum(ifn(op in (2,3) and ret11 in (2,3),size1,.)) as o2r2,
			sum(ifn(op in (2,3) and ret11 in (4,5),size1,.)*retd)/sum(ifn(op in (2,3) and ret11 in (4,5),size1,.)) as o2r3,
			sum(ifn(op in (2,3) and ret11 in (6,7),size1,.)*retd)/sum(ifn(op in (2,3) and ret11 in (6,7),size1,.)) as o2r4,
			sum(ifn(op in (2,3) and ret11 in (8,9),size1,.)*retd)/sum(ifn(op in (2,3) and ret11 in (8,9),size1,.)) as o2r5,
			sum(ifn(op in (4,5) and ret11 in (0,1),size1,.)*retd)/sum(ifn(op in (4,5) and ret11 in (0,1),size1,.)) as o3r1,
			sum(ifn(op in (4,5) and ret11 in (2,3),size1,.)*retd)/sum(ifn(op in (4,5) and ret11 in (2,3),size1,.)) as o3r2,
			sum(ifn(op in (4,5) and ret11 in (4,5),size1,.)*retd)/sum(ifn(op in (4,5) and ret11 in (4,5),size1,.)) as o3r3,
			sum(ifn(op in (4,5) and ret11 in (6,7),size1,.)*retd)/sum(ifn(op in (4,5) and ret11 in (6,7),size1,.)) as o3r4,
			sum(ifn(op in (4,5) and ret11 in (8,9),size1,.)*retd)/sum(ifn(op in (4,5) and ret11 in (8,9),size1,.)) as o3r5,
			sum(ifn(op in (6,7) and ret11 in (0,1),size1,.)*retd)/sum(ifn(op in (6,7) and ret11 in (0,1),size1,.)) as o4r1,
			sum(ifn(op in (6,7) and ret11 in (2,3),size1,.)*retd)/sum(ifn(op in (6,7) and ret11 in (2,3),size1,.)) as o4r2,
			sum(ifn(op in (6,7) and ret11 in (4,5),size1,.)*retd)/sum(ifn(op in (6,7) and ret11 in (4,5),size1,.)) as o4r3,
			sum(ifn(op in (6,7) and ret11 in (6,7),size1,.)*retd)/sum(ifn(op in (6,7) and ret11 in (6,7),size1,.)) as o4r4,
			sum(ifn(op in (6,7) and ret11 in (8,9),size1,.)*retd)/sum(ifn(op in (6,7) and ret11 in (8,9),size1,.)) as o4r5,
			sum(ifn(op in (8,9) and ret11 in (0,1),size1,.)*retd)/sum(ifn(op in (8,9) and ret11 in (0,1),size1,.)) as o5r1,
			sum(ifn(op in (8,9) and ret11 in (2,3),size1,.)*retd)/sum(ifn(op in (8,9) and ret11 in (2,3),size1,.)) as o5r2,
			sum(ifn(op in (8,9) and ret11 in (4,5),size1,.)*retd)/sum(ifn(op in (8,9) and ret11 in (4,5),size1,.)) as o5r3,
			sum(ifn(op in (8,9) and ret11 in (6,7),size1,.)*retd)/sum(ifn(op in (8,9) and ret11 in (6,7),size1,.)) as o5r4,
			sum(ifn(op in (8,9) and ret11 in (8,9),size1,.)*retd)/sum(ifn(op in (8,9) and ret11 in (8,9),size1,.)) as o5r5
		from retd_op_ret11
		group by date
		order by date;
quit;

proc download out=r.retd_op_ret11_5x5;
run;

endrsubmit;
