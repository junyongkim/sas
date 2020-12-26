libname r "!userprofile\desktop\sas\decalogue\ret_op_ret11\";

rsubmit;

proc sql;
	create table retd_op_ret11_5x10 as
		select date,
			sum(ifn(op in (0,1) and ret11=0,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=0,size1,.)) as o1r0,
			sum(ifn(op in (0,1) and ret11=1,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=1,size1,.)) as o1r1,
			sum(ifn(op in (0,1) and ret11=2,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=2,size1,.)) as o1r2,
			sum(ifn(op in (0,1) and ret11=3,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=3,size1,.)) as o1r3,
			sum(ifn(op in (0,1) and ret11=4,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=4,size1,.)) as o1r4,
			sum(ifn(op in (0,1) and ret11=5,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=5,size1,.)) as o1r5,
			sum(ifn(op in (0,1) and ret11=6,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=6,size1,.)) as o1r6,
			sum(ifn(op in (0,1) and ret11=7,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=7,size1,.)) as o1r7,
			sum(ifn(op in (0,1) and ret11=8,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=8,size1,.)) as o1r8,
			sum(ifn(op in (0,1) and ret11=9,size1,.)*retd)/sum(ifn(op in (0,1) and ret11=9,size1,.)) as o1r9,
			sum(ifn(op in (2,3) and ret11=0,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=0,size1,.)) as o2r0,
			sum(ifn(op in (2,3) and ret11=1,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=1,size1,.)) as o2r1,
			sum(ifn(op in (2,3) and ret11=2,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=2,size1,.)) as o2r2,
			sum(ifn(op in (2,3) and ret11=3,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=3,size1,.)) as o2r3,
			sum(ifn(op in (2,3) and ret11=4,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=4,size1,.)) as o2r4,
			sum(ifn(op in (2,3) and ret11=5,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=5,size1,.)) as o2r5,
			sum(ifn(op in (2,3) and ret11=6,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=6,size1,.)) as o2r6,
			sum(ifn(op in (2,3) and ret11=7,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=7,size1,.)) as o2r7,
			sum(ifn(op in (2,3) and ret11=8,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=8,size1,.)) as o2r8,
			sum(ifn(op in (2,3) and ret11=9,size1,.)*retd)/sum(ifn(op in (2,3) and ret11=9,size1,.)) as o2r9,
			sum(ifn(op in (4,5) and ret11=0,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=0,size1,.)) as o3r0,
			sum(ifn(op in (4,5) and ret11=1,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=1,size1,.)) as o3r1,
			sum(ifn(op in (4,5) and ret11=2,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=2,size1,.)) as o3r2,
			sum(ifn(op in (4,5) and ret11=3,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=3,size1,.)) as o3r3,
			sum(ifn(op in (4,5) and ret11=4,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=4,size1,.)) as o3r4,
			sum(ifn(op in (4,5) and ret11=5,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=5,size1,.)) as o3r5,
			sum(ifn(op in (4,5) and ret11=6,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=6,size1,.)) as o3r6,
			sum(ifn(op in (4,5) and ret11=7,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=7,size1,.)) as o3r7,
			sum(ifn(op in (4,5) and ret11=8,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=8,size1,.)) as o3r8,
			sum(ifn(op in (4,5) and ret11=9,size1,.)*retd)/sum(ifn(op in (4,5) and ret11=9,size1,.)) as o3r9,
			sum(ifn(op in (6,7) and ret11=0,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=0,size1,.)) as o4r0,
			sum(ifn(op in (6,7) and ret11=1,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=1,size1,.)) as o4r1,
			sum(ifn(op in (6,7) and ret11=2,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=2,size1,.)) as o4r2,
			sum(ifn(op in (6,7) and ret11=3,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=3,size1,.)) as o4r3,
			sum(ifn(op in (6,7) and ret11=4,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=4,size1,.)) as o4r4,
			sum(ifn(op in (6,7) and ret11=5,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=5,size1,.)) as o4r5,
			sum(ifn(op in (6,7) and ret11=6,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=6,size1,.)) as o4r6,
			sum(ifn(op in (6,7) and ret11=7,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=7,size1,.)) as o4r7,
			sum(ifn(op in (6,7) and ret11=8,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=8,size1,.)) as o4r8,
			sum(ifn(op in (6,7) and ret11=9,size1,.)*retd)/sum(ifn(op in (6,7) and ret11=9,size1,.)) as o4r9,
			sum(ifn(op in (8,9) and ret11=0,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=0,size1,.)) as o5r0,
			sum(ifn(op in (8,9) and ret11=1,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=1,size1,.)) as o5r1,
			sum(ifn(op in (8,9) and ret11=2,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=2,size1,.)) as o5r2,
			sum(ifn(op in (8,9) and ret11=3,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=3,size1,.)) as o5r3,
			sum(ifn(op in (8,9) and ret11=4,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=4,size1,.)) as o5r4,
			sum(ifn(op in (8,9) and ret11=5,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=5,size1,.)) as o5r5,
			sum(ifn(op in (8,9) and ret11=6,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=6,size1,.)) as o5r6,
			sum(ifn(op in (8,9) and ret11=7,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=7,size1,.)) as o5r7,
			sum(ifn(op in (8,9) and ret11=8,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=8,size1,.)) as o5r8,
			sum(ifn(op in (8,9) and ret11=9,size1,.)*retd)/sum(ifn(op in (8,9) and ret11=9,size1,.)) as o5r9
		from retd_op_ret11
		group by date
		order by date;
quit;

proc download out=r.retd_op_ret11_5x10;
run;

endrsubmit;
