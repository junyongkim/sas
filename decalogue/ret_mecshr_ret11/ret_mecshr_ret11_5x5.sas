libname r "!userprofile\desktop\ret_mecshr_ret11\";

rsubmit;

proc sql;
	create table ret_mecshr_ret11_5x5 as
		select date,
			sum(ifn(mecshr in (0,1) and ret11 in (0,1),size1,.)*ret)/sum(ifn(mecshr in (0,1) and ret11 in (0,1),size1,.)) as c1r1,
			sum(ifn(mecshr in (0,1) and ret11 in (2,3),size1,.)*ret)/sum(ifn(mecshr in (0,1) and ret11 in (2,3),size1,.)) as c1r2,
			sum(ifn(mecshr in (0,1) and ret11 in (4,5),size1,.)*ret)/sum(ifn(mecshr in (0,1) and ret11 in (4,5),size1,.)) as c1r3,
			sum(ifn(mecshr in (0,1) and ret11 in (6,7),size1,.)*ret)/sum(ifn(mecshr in (0,1) and ret11 in (6,7),size1,.)) as c1r4,
			sum(ifn(mecshr in (0,1) and ret11 in (8,9),size1,.)*ret)/sum(ifn(mecshr in (0,1) and ret11 in (8,9),size1,.)) as c1r5,
			sum(ifn(mecshr in (2,3) and ret11 in (0,1),size1,.)*ret)/sum(ifn(mecshr in (2,3) and ret11 in (0,1),size1,.)) as c2r1,
			sum(ifn(mecshr in (2,3) and ret11 in (2,3),size1,.)*ret)/sum(ifn(mecshr in (2,3) and ret11 in (2,3),size1,.)) as c2r2,
			sum(ifn(mecshr in (2,3) and ret11 in (4,5),size1,.)*ret)/sum(ifn(mecshr in (2,3) and ret11 in (4,5),size1,.)) as c2r3,
			sum(ifn(mecshr in (2,3) and ret11 in (6,7),size1,.)*ret)/sum(ifn(mecshr in (2,3) and ret11 in (6,7),size1,.)) as c2r4,
			sum(ifn(mecshr in (2,3) and ret11 in (8,9),size1,.)*ret)/sum(ifn(mecshr in (2,3) and ret11 in (8,9),size1,.)) as c2r5,
			sum(ifn(mecshr in (4,5) and ret11 in (0,1),size1,.)*ret)/sum(ifn(mecshr in (4,5) and ret11 in (0,1),size1,.)) as c3r1,
			sum(ifn(mecshr in (4,5) and ret11 in (2,3),size1,.)*ret)/sum(ifn(mecshr in (4,5) and ret11 in (2,3),size1,.)) as c3r2,
			sum(ifn(mecshr in (4,5) and ret11 in (4,5),size1,.)*ret)/sum(ifn(mecshr in (4,5) and ret11 in (4,5),size1,.)) as c3r3,
			sum(ifn(mecshr in (4,5) and ret11 in (6,7),size1,.)*ret)/sum(ifn(mecshr in (4,5) and ret11 in (6,7),size1,.)) as c3r4,
			sum(ifn(mecshr in (4,5) and ret11 in (8,9),size1,.)*ret)/sum(ifn(mecshr in (4,5) and ret11 in (8,9),size1,.)) as c3r5,
			sum(ifn(mecshr in (6,7) and ret11 in (0,1),size1,.)*ret)/sum(ifn(mecshr in (6,7) and ret11 in (0,1),size1,.)) as c4r1,
			sum(ifn(mecshr in (6,7) and ret11 in (2,3),size1,.)*ret)/sum(ifn(mecshr in (6,7) and ret11 in (2,3),size1,.)) as c4r2,
			sum(ifn(mecshr in (6,7) and ret11 in (4,5),size1,.)*ret)/sum(ifn(mecshr in (6,7) and ret11 in (4,5),size1,.)) as c4r3,
			sum(ifn(mecshr in (6,7) and ret11 in (6,7),size1,.)*ret)/sum(ifn(mecshr in (6,7) and ret11 in (6,7),size1,.)) as c4r4,
			sum(ifn(mecshr in (6,7) and ret11 in (8,9),size1,.)*ret)/sum(ifn(mecshr in (6,7) and ret11 in (8,9),size1,.)) as c4r5,
			sum(ifn(mecshr in (8,9) and ret11 in (0,1),size1,.)*ret)/sum(ifn(mecshr in (8,9) and ret11 in (0,1),size1,.)) as c5r1,
			sum(ifn(mecshr in (8,9) and ret11 in (2,3),size1,.)*ret)/sum(ifn(mecshr in (8,9) and ret11 in (2,3),size1,.)) as c5r2,
			sum(ifn(mecshr in (8,9) and ret11 in (4,5),size1,.)*ret)/sum(ifn(mecshr in (8,9) and ret11 in (4,5),size1,.)) as c5r3,
			sum(ifn(mecshr in (8,9) and ret11 in (6,7),size1,.)*ret)/sum(ifn(mecshr in (8,9) and ret11 in (6,7),size1,.)) as c5r4,
			sum(ifn(mecshr in (8,9) and ret11 in (8,9),size1,.)*ret)/sum(ifn(mecshr in (8,9) and ret11 in (8,9),size1,.)) as c5r5
		from ret_mecshr_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_mecshr_ret11_5x5;
run;

endrsubmit;
