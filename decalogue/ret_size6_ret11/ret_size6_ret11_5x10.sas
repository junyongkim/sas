libname r "!userprofile\desktop\sas\decalogue\ret_size6_ret11\";

rsubmit;

proc sql;
	create table ret_size6_ret11_5x10 as
		select date,
			sum(ifn(size6 in (0,1) and ret11=0,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=0,size1,.)) as s1r0,
			sum(ifn(size6 in (0,1) and ret11=1,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=1,size1,.)) as s1r1,
			sum(ifn(size6 in (0,1) and ret11=2,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=2,size1,.)) as s1r2,
			sum(ifn(size6 in (0,1) and ret11=3,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=3,size1,.)) as s1r3,
			sum(ifn(size6 in (0,1) and ret11=4,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=4,size1,.)) as s1r4,
			sum(ifn(size6 in (0,1) and ret11=5,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=5,size1,.)) as s1r5,
			sum(ifn(size6 in (0,1) and ret11=6,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=6,size1,.)) as s1r6,
			sum(ifn(size6 in (0,1) and ret11=7,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=7,size1,.)) as s1r7,
			sum(ifn(size6 in (0,1) and ret11=8,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=8,size1,.)) as s1r8,
			sum(ifn(size6 in (0,1) and ret11=9,size1,.)*ret)/sum(ifn(size6 in (0,1) and ret11=9,size1,.)) as s1r9,
			sum(ifn(size6 in (2,3) and ret11=0,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=0,size1,.)) as s2r0,
			sum(ifn(size6 in (2,3) and ret11=1,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=1,size1,.)) as s2r1,
			sum(ifn(size6 in (2,3) and ret11=2,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=2,size1,.)) as s2r2,
			sum(ifn(size6 in (2,3) and ret11=3,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=3,size1,.)) as s2r3,
			sum(ifn(size6 in (2,3) and ret11=4,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=4,size1,.)) as s2r4,
			sum(ifn(size6 in (2,3) and ret11=5,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=5,size1,.)) as s2r5,
			sum(ifn(size6 in (2,3) and ret11=6,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=6,size1,.)) as s2r6,
			sum(ifn(size6 in (2,3) and ret11=7,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=7,size1,.)) as s2r7,
			sum(ifn(size6 in (2,3) and ret11=8,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=8,size1,.)) as s2r8,
			sum(ifn(size6 in (2,3) and ret11=9,size1,.)*ret)/sum(ifn(size6 in (2,3) and ret11=9,size1,.)) as s2r9,
			sum(ifn(size6 in (4,5) and ret11=0,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=0,size1,.)) as s3r0,
			sum(ifn(size6 in (4,5) and ret11=1,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=1,size1,.)) as s3r1,
			sum(ifn(size6 in (4,5) and ret11=2,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=2,size1,.)) as s3r2,
			sum(ifn(size6 in (4,5) and ret11=3,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=3,size1,.)) as s3r3,
			sum(ifn(size6 in (4,5) and ret11=4,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=4,size1,.)) as s3r4,
			sum(ifn(size6 in (4,5) and ret11=5,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=5,size1,.)) as s3r5,
			sum(ifn(size6 in (4,5) and ret11=6,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=6,size1,.)) as s3r6,
			sum(ifn(size6 in (4,5) and ret11=7,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=7,size1,.)) as s3r7,
			sum(ifn(size6 in (4,5) and ret11=8,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=8,size1,.)) as s3r8,
			sum(ifn(size6 in (4,5) and ret11=9,size1,.)*ret)/sum(ifn(size6 in (4,5) and ret11=9,size1,.)) as s3r9,
			sum(ifn(size6 in (6,7) and ret11=0,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=0,size1,.)) as s4r0,
			sum(ifn(size6 in (6,7) and ret11=1,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=1,size1,.)) as s4r1,
			sum(ifn(size6 in (6,7) and ret11=2,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=2,size1,.)) as s4r2,
			sum(ifn(size6 in (6,7) and ret11=3,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=3,size1,.)) as s4r3,
			sum(ifn(size6 in (6,7) and ret11=4,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=4,size1,.)) as s4r4,
			sum(ifn(size6 in (6,7) and ret11=5,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=5,size1,.)) as s4r5,
			sum(ifn(size6 in (6,7) and ret11=6,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=6,size1,.)) as s4r6,
			sum(ifn(size6 in (6,7) and ret11=7,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=7,size1,.)) as s4r7,
			sum(ifn(size6 in (6,7) and ret11=8,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=8,size1,.)) as s4r8,
			sum(ifn(size6 in (6,7) and ret11=9,size1,.)*ret)/sum(ifn(size6 in (6,7) and ret11=9,size1,.)) as s4r9,
			sum(ifn(size6 in (8,9) and ret11=0,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=0,size1,.)) as s5r0,
			sum(ifn(size6 in (8,9) and ret11=1,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=1,size1,.)) as s5r1,
			sum(ifn(size6 in (8,9) and ret11=2,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=2,size1,.)) as s5r2,
			sum(ifn(size6 in (8,9) and ret11=3,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=3,size1,.)) as s5r3,
			sum(ifn(size6 in (8,9) and ret11=4,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=4,size1,.)) as s5r4,
			sum(ifn(size6 in (8,9) and ret11=5,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=5,size1,.)) as s5r5,
			sum(ifn(size6 in (8,9) and ret11=6,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=6,size1,.)) as s5r6,
			sum(ifn(size6 in (8,9) and ret11=7,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=7,size1,.)) as s5r7,
			sum(ifn(size6 in (8,9) and ret11=8,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=8,size1,.)) as s5r8,
			sum(ifn(size6 in (8,9) and ret11=9,size1,.)*ret)/sum(ifn(size6 in (8,9) and ret11=9,size1,.)) as s5r9
		from ret_size6_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_size6_ret11_5x10;
run;

endrsubmit;
