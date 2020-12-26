libname r "!userprofile\desktop\sas\decalogue\ret_in_ret11\";

rsubmit;

proc sql;
	create table ret_in_ret11_5x10 as
		select date,
			sum(ifn(in in (0,1) and ret11=0,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=0,size1,.)) as i1r0,
			sum(ifn(in in (0,1) and ret11=1,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=1,size1,.)) as i1r1,
			sum(ifn(in in (0,1) and ret11=2,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=2,size1,.)) as i1r2,
			sum(ifn(in in (0,1) and ret11=3,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=3,size1,.)) as i1r3,
			sum(ifn(in in (0,1) and ret11=4,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=4,size1,.)) as i1r4,
			sum(ifn(in in (0,1) and ret11=5,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=5,size1,.)) as i1r5,
			sum(ifn(in in (0,1) and ret11=6,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=6,size1,.)) as i1r6,
			sum(ifn(in in (0,1) and ret11=7,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=7,size1,.)) as i1r7,
			sum(ifn(in in (0,1) and ret11=8,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=8,size1,.)) as i1r8,
			sum(ifn(in in (0,1) and ret11=9,size1,.)*ret)/sum(ifn(in in (0,1) and ret11=9,size1,.)) as i1r9,
			sum(ifn(in in (2,3) and ret11=0,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=0,size1,.)) as i2r0,
			sum(ifn(in in (2,3) and ret11=1,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=1,size1,.)) as i2r1,
			sum(ifn(in in (2,3) and ret11=2,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=2,size1,.)) as i2r2,
			sum(ifn(in in (2,3) and ret11=3,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=3,size1,.)) as i2r3,
			sum(ifn(in in (2,3) and ret11=4,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=4,size1,.)) as i2r4,
			sum(ifn(in in (2,3) and ret11=5,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=5,size1,.)) as i2r5,
			sum(ifn(in in (2,3) and ret11=6,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=6,size1,.)) as i2r6,
			sum(ifn(in in (2,3) and ret11=7,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=7,size1,.)) as i2r7,
			sum(ifn(in in (2,3) and ret11=8,size1,.)*ret)/sum(ifn(in in (2,3) and ret11=8,size1,.)) as i2r8,
			sum(ifn(in in (2,3) and ret11=9,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=9,size1,.)) as i2r9,
			sum(ifn(in in (4,5) and ret11=0,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=0,size1,.)) as i3r0,
			sum(ifn(in in (4,5) and ret11=1,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=1,size1,.)) as i3r1,
			sum(ifn(in in (4,5) and ret11=2,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=2,size1,.)) as i3r2,
			sum(ifn(in in (4,5) and ret11=3,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=3,size1,.)) as i3r3,
			sum(ifn(in in (4,5) and ret11=4,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=4,size1,.)) as i3r4,
			sum(ifn(in in (4,5) and ret11=5,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=5,size1,.)) as i3r5,
			sum(ifn(in in (4,5) and ret11=6,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=6,size1,.)) as i3r6,
			sum(ifn(in in (4,5) and ret11=7,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=7,size1,.)) as i3r7,
			sum(ifn(in in (4,5) and ret11=8,size1,.)*ret)/sum(ifn(in in (4,5) and ret11=8,size1,.)) as i3r8,
			sum(ifn(in in (4,5) and ret11=9,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=9,size1,.)) as i3r9,
			sum(ifn(in in (6,7) and ret11=0,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=0,size1,.)) as i4r0,
			sum(ifn(in in (6,7) and ret11=1,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=1,size1,.)) as i4r1,
			sum(ifn(in in (6,7) and ret11=2,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=2,size1,.)) as i4r2,
			sum(ifn(in in (6,7) and ret11=3,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=3,size1,.)) as i4r3,
			sum(ifn(in in (6,7) and ret11=4,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=4,size1,.)) as i4r4,
			sum(ifn(in in (6,7) and ret11=5,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=5,size1,.)) as i4r5,
			sum(ifn(in in (6,7) and ret11=6,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=6,size1,.)) as i4r6,
			sum(ifn(in in (6,7) and ret11=7,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=7,size1,.)) as i4r7,
			sum(ifn(in in (6,7) and ret11=8,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=8,size1,.)) as i4r8,
			sum(ifn(in in (6,7) and ret11=9,size1,.)*ret)/sum(ifn(in in (6,7) and ret11=9,size1,.)) as i4r9,
			sum(ifn(in in (8,9) and ret11=0,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=0,size1,.)) as i5r0,
			sum(ifn(in in (8,9) and ret11=1,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=1,size1,.)) as i5r1,
			sum(ifn(in in (8,9) and ret11=2,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=2,size1,.)) as i5r2,
			sum(ifn(in in (8,9) and ret11=3,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=3,size1,.)) as i5r3,
			sum(ifn(in in (8,9) and ret11=4,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=4,size1,.)) as i5r4,
			sum(ifn(in in (8,9) and ret11=5,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=5,size1,.)) as i5r5,
			sum(ifn(in in (8,9) and ret11=6,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=6,size1,.)) as i5r6,
			sum(ifn(in in (8,9) and ret11=7,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=7,size1,.)) as i5r7,
			sum(ifn(in in (8,9) and ret11=8,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=8,size1,.)) as i5r8,
			sum(ifn(in in (8,9) and ret11=9,size1,.)*ret)/sum(ifn(in in (8,9) and ret11=9,size1,.)) as i5r9
		from ret_in_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_in_ret11_5x10;
run;

endrsubmit;
