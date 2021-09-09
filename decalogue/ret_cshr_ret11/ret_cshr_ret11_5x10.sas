libname r "!userprofile\desktop\sas\decalogue\ret_cshr_ret11\";

rsubmit;

proc sql;
	create table ret_cshr_ret11_5x10 as
		select date,
			sum(ifn(cshr in (0,1) and ret11=0,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=0,size1,.)) as c1r0,
			sum(ifn(cshr in (0,1) and ret11=1,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=1,size1,.)) as c1r1,
			sum(ifn(cshr in (0,1) and ret11=2,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=2,size1,.)) as c1r2,
			sum(ifn(cshr in (0,1) and ret11=3,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=3,size1,.)) as c1r3,
			sum(ifn(cshr in (0,1) and ret11=4,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=4,size1,.)) as c1r4,
			sum(ifn(cshr in (0,1) and ret11=5,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=5,size1,.)) as c1r5,
			sum(ifn(cshr in (0,1) and ret11=6,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=6,size1,.)) as c1r6,
			sum(ifn(cshr in (0,1) and ret11=7,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=7,size1,.)) as c1r7,
			sum(ifn(cshr in (0,1) and ret11=8,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=8,size1,.)) as c1r8,
			sum(ifn(cshr in (0,1) and ret11=9,size1,.)*ret)/sum(ifn(cshr in (0,1) and ret11=9,size1,.)) as c1r9,
			sum(ifn(cshr in (2,3) and ret11=0,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=0,size1,.)) as c2r0,
			sum(ifn(cshr in (2,3) and ret11=1,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=1,size1,.)) as c2r1,
			sum(ifn(cshr in (2,3) and ret11=2,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=2,size1,.)) as c2r2,
			sum(ifn(cshr in (2,3) and ret11=3,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=3,size1,.)) as c2r3,
			sum(ifn(cshr in (2,3) and ret11=4,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=4,size1,.)) as c2r4,
			sum(ifn(cshr in (2,3) and ret11=5,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=5,size1,.)) as c2r5,
			sum(ifn(cshr in (2,3) and ret11=6,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=6,size1,.)) as c2r6,
			sum(ifn(cshr in (2,3) and ret11=7,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=7,size1,.)) as c2r7,
			sum(ifn(cshr in (2,3) and ret11=8,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=8,size1,.)) as c2r8,
			sum(ifn(cshr in (2,3) and ret11=9,size1,.)*ret)/sum(ifn(cshr in (2,3) and ret11=9,size1,.)) as c2r9,
			sum(ifn(cshr in (4,5) and ret11=0,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=0,size1,.)) as c3r0,
			sum(ifn(cshr in (4,5) and ret11=1,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=1,size1,.)) as c3r1,
			sum(ifn(cshr in (4,5) and ret11=2,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=2,size1,.)) as c3r2,
			sum(ifn(cshr in (4,5) and ret11=3,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=3,size1,.)) as c3r3,
			sum(ifn(cshr in (4,5) and ret11=4,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=4,size1,.)) as c3r4,
			sum(ifn(cshr in (4,5) and ret11=5,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=5,size1,.)) as c3r5,
			sum(ifn(cshr in (4,5) and ret11=6,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=6,size1,.)) as c3r6,
			sum(ifn(cshr in (4,5) and ret11=7,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=7,size1,.)) as c3r7,
			sum(ifn(cshr in (4,5) and ret11=8,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=8,size1,.)) as c3r8,
			sum(ifn(cshr in (4,5) and ret11=9,size1,.)*ret)/sum(ifn(cshr in (4,5) and ret11=9,size1,.)) as c3r9,
			sum(ifn(cshr in (6,7) and ret11=0,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=0,size1,.)) as c4r0,
			sum(ifn(cshr in (6,7) and ret11=1,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=1,size1,.)) as c4r1,
			sum(ifn(cshr in (6,7) and ret11=2,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=2,size1,.)) as c4r2,
			sum(ifn(cshr in (6,7) and ret11=3,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=3,size1,.)) as c4r3,
			sum(ifn(cshr in (6,7) and ret11=4,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=4,size1,.)) as c4r4,
			sum(ifn(cshr in (6,7) and ret11=5,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=5,size1,.)) as c4r5,
			sum(ifn(cshr in (6,7) and ret11=6,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=6,size1,.)) as c4r6,
			sum(ifn(cshr in (6,7) and ret11=7,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=7,size1,.)) as c4r7,
			sum(ifn(cshr in (6,7) and ret11=8,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=8,size1,.)) as c4r8,
			sum(ifn(cshr in (6,7) and ret11=9,size1,.)*ret)/sum(ifn(cshr in (6,7) and ret11=9,size1,.)) as c4r9,
			sum(ifn(cshr in (8,9) and ret11=0,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=0,size1,.)) as c5r0,
			sum(ifn(cshr in (8,9) and ret11=1,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=1,size1,.)) as c5r1,
			sum(ifn(cshr in (8,9) and ret11=2,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=2,size1,.)) as c5r2,
			sum(ifn(cshr in (8,9) and ret11=3,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=3,size1,.)) as c5r3,
			sum(ifn(cshr in (8,9) and ret11=4,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=4,size1,.)) as c5r4,
			sum(ifn(cshr in (8,9) and ret11=5,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=5,size1,.)) as c5r5,
			sum(ifn(cshr in (8,9) and ret11=6,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=6,size1,.)) as c5r6,
			sum(ifn(cshr in (8,9) and ret11=7,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=7,size1,.)) as c5r7,
			sum(ifn(cshr in (8,9) and ret11=8,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=8,size1,.)) as c5r8,
			sum(ifn(cshr in (8,9) and ret11=9,size1,.)*ret)/sum(ifn(cshr in (8,9) and ret11=9,size1,.)) as c5r9
		from ret_cshr_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_cshr_ret11_5x10;
run;

endrsubmit;
