libname r "!userprofile\desktop\sas\decalogue\ret_bm_ret11\";

rsubmit;

proc sql;
	create table ret_bm_ret11_5x10 as
		select date,
			sum(ifn(bm in (0,1) and ret11=0,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=0,size1,.)) as b1r0,
			sum(ifn(bm in (0,1) and ret11=1,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=1,size1,.)) as b1r1,
			sum(ifn(bm in (0,1) and ret11=2,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=2,size1,.)) as b1r2,
			sum(ifn(bm in (0,1) and ret11=3,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=3,size1,.)) as b1r3,
			sum(ifn(bm in (0,1) and ret11=4,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=4,size1,.)) as b1r4,
			sum(ifn(bm in (0,1) and ret11=5,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=5,size1,.)) as b1r5,
			sum(ifn(bm in (0,1) and ret11=6,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=6,size1,.)) as b1r6,
			sum(ifn(bm in (0,1) and ret11=7,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=7,size1,.)) as b1r7,
			sum(ifn(bm in (0,1) and ret11=8,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=8,size1,.)) as b1r8,
			sum(ifn(bm in (0,1) and ret11=9,size1,.)*ret)/sum(ifn(bm in (0,1) and ret11=9,size1,.)) as b1r9,
			sum(ifn(bm in (2,3) and ret11=0,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=0,size1,.)) as b2r0,
			sum(ifn(bm in (2,3) and ret11=1,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=1,size1,.)) as b2r1,
			sum(ifn(bm in (2,3) and ret11=2,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=2,size1,.)) as b2r2,
			sum(ifn(bm in (2,3) and ret11=3,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=3,size1,.)) as b2r3,
			sum(ifn(bm in (2,3) and ret11=4,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=4,size1,.)) as b2r4,
			sum(ifn(bm in (2,3) and ret11=5,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=5,size1,.)) as b2r5,
			sum(ifn(bm in (2,3) and ret11=6,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=6,size1,.)) as b2r6,
			sum(ifn(bm in (2,3) and ret11=7,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=7,size1,.)) as b2r7,
			sum(ifn(bm in (2,3) and ret11=8,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=8,size1,.)) as b2r8,
			sum(ifn(bm in (2,3) and ret11=9,size1,.)*ret)/sum(ifn(bm in (2,3) and ret11=9,size1,.)) as b2r9,
			sum(ifn(bm in (4,5) and ret11=0,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=0,size1,.)) as b3r0,
			sum(ifn(bm in (4,5) and ret11=1,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=1,size1,.)) as b3r1,
			sum(ifn(bm in (4,5) and ret11=2,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=2,size1,.)) as b3r2,
			sum(ifn(bm in (4,5) and ret11=3,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=3,size1,.)) as b3r3,
			sum(ifn(bm in (4,5) and ret11=4,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=4,size1,.)) as b3r4,
			sum(ifn(bm in (4,5) and ret11=5,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=5,size1,.)) as b3r5,
			sum(ifn(bm in (4,5) and ret11=6,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=6,size1,.)) as b3r6,
			sum(ifn(bm in (4,5) and ret11=7,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=7,size1,.)) as b3r7,
			sum(ifn(bm in (4,5) and ret11=8,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=8,size1,.)) as b3r8,
			sum(ifn(bm in (4,5) and ret11=9,size1,.)*ret)/sum(ifn(bm in (4,5) and ret11=9,size1,.)) as b3r9,
			sum(ifn(bm in (6,7) and ret11=0,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=0,size1,.)) as b4r0,
			sum(ifn(bm in (6,7) and ret11=1,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=1,size1,.)) as b4r1,
			sum(ifn(bm in (6,7) and ret11=2,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=2,size1,.)) as b4r2,
			sum(ifn(bm in (6,7) and ret11=3,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=3,size1,.)) as b4r3,
			sum(ifn(bm in (6,7) and ret11=4,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=4,size1,.)) as b4r4,
			sum(ifn(bm in (6,7) and ret11=5,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=5,size1,.)) as b4r5,
			sum(ifn(bm in (6,7) and ret11=6,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=6,size1,.)) as b4r6,
			sum(ifn(bm in (6,7) and ret11=7,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=7,size1,.)) as b4r7,
			sum(ifn(bm in (6,7) and ret11=8,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=8,size1,.)) as b4r8,
			sum(ifn(bm in (6,7) and ret11=9,size1,.)*ret)/sum(ifn(bm in (6,7) and ret11=9,size1,.)) as b4r9,
			sum(ifn(bm in (8,9) and ret11=0,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=0,size1,.)) as b5r0,
			sum(ifn(bm in (8,9) and ret11=1,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=1,size1,.)) as b5r1,
			sum(ifn(bm in (8,9) and ret11=2,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=2,size1,.)) as b5r2,
			sum(ifn(bm in (8,9) and ret11=3,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=3,size1,.)) as b5r3,
			sum(ifn(bm in (8,9) and ret11=4,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=4,size1,.)) as b5r4,
			sum(ifn(bm in (8,9) and ret11=5,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=5,size1,.)) as b5r5,
			sum(ifn(bm in (8,9) and ret11=6,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=6,size1,.)) as b5r6,
			sum(ifn(bm in (8,9) and ret11=7,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=7,size1,.)) as b5r7,
			sum(ifn(bm in (8,9) and ret11=8,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=8,size1,.)) as b5r8,
			sum(ifn(bm in (8,9) and ret11=9,size1,.)*ret)/sum(ifn(bm in (8,9) and ret11=9,size1,.)) as b5r9
		from ret_bm_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_bm_ret11_5x10;
run;

endrsubmit;
