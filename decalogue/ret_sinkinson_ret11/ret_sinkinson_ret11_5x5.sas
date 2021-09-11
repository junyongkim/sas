libname r "!userprofile\desktop\sas\decalogue\ret_sinkinson_ret11\";

rsubmit;

proc sql;
	create table ret_sinkinson_ret11_5x5 as
		select date,
			sum(ifn(sinkinson in (0,1) and ret11 in (0,1),size1,.)*ret)/sum(ifn(sinkinson in (0,1) and ret11 in (0,1),size1,.)) as s1r1,
			sum(ifn(sinkinson in (0,1) and ret11 in (2,3),size1,.)*ret)/sum(ifn(sinkinson in (0,1) and ret11 in (2,3),size1,.)) as s1r2,
			sum(ifn(sinkinson in (0,1) and ret11 in (4,5),size1,.)*ret)/sum(ifn(sinkinson in (0,1) and ret11 in (4,5),size1,.)) as s1r3,
			sum(ifn(sinkinson in (0,1) and ret11 in (6,7),size1,.)*ret)/sum(ifn(sinkinson in (0,1) and ret11 in (6,7),size1,.)) as s1r4,
			sum(ifn(sinkinson in (0,1) and ret11 in (8,9),size1,.)*ret)/sum(ifn(sinkinson in (0,1) and ret11 in (8,9),size1,.)) as s1r5,
			sum(ifn(sinkinson in (2,3) and ret11 in (0,1),size1,.)*ret)/sum(ifn(sinkinson in (2,3) and ret11 in (0,1),size1,.)) as s2r1,
			sum(ifn(sinkinson in (2,3) and ret11 in (2,3),size1,.)*ret)/sum(ifn(sinkinson in (2,3) and ret11 in (2,3),size1,.)) as s2r2,
			sum(ifn(sinkinson in (2,3) and ret11 in (4,5),size1,.)*ret)/sum(ifn(sinkinson in (2,3) and ret11 in (4,5),size1,.)) as s2r3,
			sum(ifn(sinkinson in (2,3) and ret11 in (6,7),size1,.)*ret)/sum(ifn(sinkinson in (2,3) and ret11 in (6,7),size1,.)) as s2r4,
			sum(ifn(sinkinson in (2,3) and ret11 in (8,9),size1,.)*ret)/sum(ifn(sinkinson in (2,3) and ret11 in (8,9),size1,.)) as s2r5,
			sum(ifn(sinkinson in (4,5) and ret11 in (0,1),size1,.)*ret)/sum(ifn(sinkinson in (4,5) and ret11 in (0,1),size1,.)) as s3r1,
			sum(ifn(sinkinson in (4,5) and ret11 in (2,3),size1,.)*ret)/sum(ifn(sinkinson in (4,5) and ret11 in (2,3),size1,.)) as s3r2,
			sum(ifn(sinkinson in (4,5) and ret11 in (4,5),size1,.)*ret)/sum(ifn(sinkinson in (4,5) and ret11 in (4,5),size1,.)) as s3r3,
			sum(ifn(sinkinson in (4,5) and ret11 in (6,7),size1,.)*ret)/sum(ifn(sinkinson in (4,5) and ret11 in (6,7),size1,.)) as s3r4,
			sum(ifn(sinkinson in (4,5) and ret11 in (8,9),size1,.)*ret)/sum(ifn(sinkinson in (4,5) and ret11 in (8,9),size1,.)) as s3r5,
			sum(ifn(sinkinson in (6,7) and ret11 in (0,1),size1,.)*ret)/sum(ifn(sinkinson in (6,7) and ret11 in (0,1),size1,.)) as s4r1,
			sum(ifn(sinkinson in (6,7) and ret11 in (2,3),size1,.)*ret)/sum(ifn(sinkinson in (6,7) and ret11 in (2,3),size1,.)) as s4r2,
			sum(ifn(sinkinson in (6,7) and ret11 in (4,5),size1,.)*ret)/sum(ifn(sinkinson in (6,7) and ret11 in (4,5),size1,.)) as s4r3,
			sum(ifn(sinkinson in (6,7) and ret11 in (6,7),size1,.)*ret)/sum(ifn(sinkinson in (6,7) and ret11 in (6,7),size1,.)) as s4r4,
			sum(ifn(sinkinson in (6,7) and ret11 in (8,9),size1,.)*ret)/sum(ifn(sinkinson in (6,7) and ret11 in (8,9),size1,.)) as s4r5,
			sum(ifn(sinkinson in (8,9) and ret11 in (0,1),size1,.)*ret)/sum(ifn(sinkinson in (8,9) and ret11 in (0,1),size1,.)) as s5r1,
			sum(ifn(sinkinson in (8,9) and ret11 in (2,3),size1,.)*ret)/sum(ifn(sinkinson in (8,9) and ret11 in (2,3),size1,.)) as s5r2,
			sum(ifn(sinkinson in (8,9) and ret11 in (4,5),size1,.)*ret)/sum(ifn(sinkinson in (8,9) and ret11 in (4,5),size1,.)) as s5r3,
			sum(ifn(sinkinson in (8,9) and ret11 in (6,7),size1,.)*ret)/sum(ifn(sinkinson in (8,9) and ret11 in (6,7),size1,.)) as s5r4,
			sum(ifn(sinkinson in (8,9) and ret11 in (8,9),size1,.)*ret)/sum(ifn(sinkinson in (8,9) and ret11 in (8,9),size1,.)) as s5r5
		from ret_sinkinson_ret11
		group by date
		order by date;
quit;

proc download out=r.ret_sinkinson_ret11_5x5;
run;

endrsubmit;
