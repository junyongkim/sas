libname r "!userprofile\desktop\sas\decalogue\ret_bm_ret11\";

rsubmit;

proc sql;
	create table ret_bm_ret11_5x5 as
		select date,
			sum(ifn(bm in (0,1) and ret11 in (0,1),size1,.)*ret)/sum(ifn(bm in (0,1) and ret11 in (0,1),size1,.)) as b1r1,
			sum(ifn(bm in (0,1) and ret11 in (2,3),size1,.)*ret)/sum(ifn(bm in (0,1) and ret11 in (2,3),size1,.)) as b1r2,
			sum(ifn(bm in (0,1) and ret11 in (4,5),size1,.)*ret)/sum(ifn(bm in (0,1) and ret11 in (4,5),size1,.)) as b1r3,
			sum(ifn(bm in (0,1) and ret11 in (6,7),size1,.)*ret)/sum(ifn(bm in (0,1) and ret11 in (6,7),size1,.)) as b1r4,
			sum(ifn(bm in (0,1) and ret11 in (8,9),size1,.)*ret)/sum(ifn(bm in (0,1) and ret11 in (8,9),size1,.)) as b1r5,
			sum(ifn(bm in (2,3) and ret11 in (0,1),size1,.)*ret)/sum(ifn(bm in (2,3) and ret11 in (0,1),size1,.)) as b2r1,
			sum(ifn(bm in (2,3) and ret11 in (2,3),size1,.)*ret)/sum(ifn(bm in (2,3) and ret11 in (2,3),size1,.)) as b2r2,
			sum(ifn(bm in (2,3) and ret11 in (4,5),size1,.)*ret)/sum(ifn(bm in (2,3) and ret11 in (4,5),size1,.)) as b2r3,
			sum(ifn(bm in (2,3) and ret11 in (6,7),size1,.)*ret)/sum(ifn(bm in (2,3) and ret11 in (6,7),size1,.)) as b2r4,
			sum(ifn(bm in (2,3) and ret11 in (8,9),size1,.)*ret)/sum(ifn(bm in (2,3) and ret11 in (8,9),size1,.)) as b2r5,
			sum(ifn(bm in (4,5) and ret11 in (0,1),size1,.)*ret)/sum(ifn(bm in (4,5) and ret11 in (0,1),size1,.)) as b3r1,
			sum(ifn(bm in (4,5) and ret11 in (2,3),size1,.)*ret)/sum(ifn(bm in (4,5) and ret11 in (2,3),size1,.)) as b3r2,
			sum(ifn(bm in (4,5) and ret11 in (4,5),size1,.)*ret)/sum(ifn(bm in (4,5) and ret11 in (4,5),size1,.)) as b3r3,
			sum(ifn(bm in (4,5) and ret11 in (6,7),size1,.)*ret)/sum(ifn(bm in (4,5) and ret11 in (6,7),size1,.)) as b3r4,
			sum(ifn(bm in (4,5) and ret11 in (8,9),size1,.)*ret)/sum(ifn(bm in (4,5) and ret11 in (8,9),size1,.)) as b3r5,
			sum(ifn(bm in (6,7) and ret11 in (0,1),size1,.)*ret)/sum(ifn(bm in (6,7) and ret11 in (0,1),size1,.)) as b4r1,
			sum(ifn(bm in (6,7) and ret11 in (2,3),size1,.)*ret)/sum(ifn(bm in (6,7) and ret11 in (2,3),size1,.)) as b4r2,
			sum(ifn(bm in (6,7) and ret11 in (4,5),size1,.)*ret)/sum(ifn(bm in (6,7) and ret11 in (4,5),size1,.)) as b4r3,
			sum(ifn(bm in (6,7) and ret11 in (6,7),size1,.)*ret)/sum(ifn(bm in (6,7) and ret11 in (6,7),size1,.)) as b4r4,
			sum(ifn(bm in (6,7) and ret11 in (8,9),size1,.)*ret)/sum(ifn(bm in (6,7) and ret11 in (8,9),size1,.)) as b4r5,
			sum(ifn(bm in (8,9) and ret11 in (0,1),size1,.)*ret)/sum(ifn(bm in (8,9) and ret11 in (0,1),size1,.)) as b5r1,
			sum(ifn(bm in (8,9) and ret11 in (2,3),size1,.)*ret)/sum(ifn(bm in (8,9) and ret11 in (2,3),size1,.)) as b5r2,
			sum(ifn(bm in (8,9) and ret11 in (4,5),size1,.)*ret)/sum(ifn(bm in (8,9) and ret11 in (4,5),size1,.)) as b5r3,
			sum(ifn(bm in (8,9) and ret11 in (6,7),size1,.)*ret)/sum(ifn(bm in (8,9) and ret11 in (6,7),size1,.)) as b5r4,
			sum(ifn(bm in (8,9) and ret11 in (8,9),size1,.)*ret)/sum(ifn(bm in (8,9) and ret11 in (8,9),size1,.)) as b5r5
		from ret_bm_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_bm_ret11_5x5;
run;

endrsubmit;
