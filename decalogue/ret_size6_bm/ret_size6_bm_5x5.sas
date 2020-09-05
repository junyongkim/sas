libname h "!userprofile\desktop\hello_wrds\ret_size6_bm\";

rsubmit;

proc sql;
	create table ret_size6_bm_5x5 as
		select date,
			sum(ifn(size6 in (0,1) and bm in (0,1),size1,.)*ret)/sum(ifn(size6 in (0,1) and bm in (0,1),size1,.)) as s1b1,
			sum(ifn(size6 in (0,1) and bm in (2,3),size1,.)*ret)/sum(ifn(size6 in (0,1) and bm in (2,3),size1,.)) as s1b2,
			sum(ifn(size6 in (0,1) and bm in (4,5),size1,.)*ret)/sum(ifn(size6 in (0,1) and bm in (4,5),size1,.)) as s1b3,
			sum(ifn(size6 in (0,1) and bm in (6,7),size1,.)*ret)/sum(ifn(size6 in (0,1) and bm in (6,7),size1,.)) as s1b4,
			sum(ifn(size6 in (0,1) and bm in (8,9),size1,.)*ret)/sum(ifn(size6 in (0,1) and bm in (8,9),size1,.)) as s1b5,
			sum(ifn(size6 in (2,3) and bm in (0,1),size1,.)*ret)/sum(ifn(size6 in (2,3) and bm in (0,1),size1,.)) as s2b1,
			sum(ifn(size6 in (2,3) and bm in (2,3),size1,.)*ret)/sum(ifn(size6 in (2,3) and bm in (2,3),size1,.)) as s2b2,
			sum(ifn(size6 in (2,3) and bm in (4,5),size1,.)*ret)/sum(ifn(size6 in (2,3) and bm in (4,5),size1,.)) as s2b3,
			sum(ifn(size6 in (2,3) and bm in (6,7),size1,.)*ret)/sum(ifn(size6 in (2,3) and bm in (6,7),size1,.)) as s2b4,
			sum(ifn(size6 in (2,3) and bm in (8,9),size1,.)*ret)/sum(ifn(size6 in (2,3) and bm in (8,9),size1,.)) as s2b5,
			sum(ifn(size6 in (4,5) and bm in (0,1),size1,.)*ret)/sum(ifn(size6 in (4,5) and bm in (0,1),size1,.)) as s3b1,
			sum(ifn(size6 in (4,5) and bm in (2,3),size1,.)*ret)/sum(ifn(size6 in (4,5) and bm in (2,3),size1,.)) as s3b2,
			sum(ifn(size6 in (4,5) and bm in (4,5),size1,.)*ret)/sum(ifn(size6 in (4,5) and bm in (4,5),size1,.)) as s3b3,
			sum(ifn(size6 in (4,5) and bm in (6,7),size1,.)*ret)/sum(ifn(size6 in (4,5) and bm in (6,7),size1,.)) as s3b4,
			sum(ifn(size6 in (4,5) and bm in (8,9),size1,.)*ret)/sum(ifn(size6 in (4,5) and bm in (8,9),size1,.)) as s3b5,
			sum(ifn(size6 in (6,7) and bm in (0,1),size1,.)*ret)/sum(ifn(size6 in (6,7) and bm in (0,1),size1,.)) as s4b1,
			sum(ifn(size6 in (6,7) and bm in (2,3),size1,.)*ret)/sum(ifn(size6 in (6,7) and bm in (2,3),size1,.)) as s4b2,
			sum(ifn(size6 in (6,7) and bm in (4,5),size1,.)*ret)/sum(ifn(size6 in (6,7) and bm in (4,5),size1,.)) as s4b3,
			sum(ifn(size6 in (6,7) and bm in (6,7),size1,.)*ret)/sum(ifn(size6 in (6,7) and bm in (6,7),size1,.)) as s4b4,
			sum(ifn(size6 in (6,7) and bm in (8,9),size1,.)*ret)/sum(ifn(size6 in (6,7) and bm in (8,9),size1,.)) as s4b5,
			sum(ifn(size6 in (8,9) and bm in (0,1),size1,.)*ret)/sum(ifn(size6 in (8,9) and bm in (0,1),size1,.)) as s5b1,
			sum(ifn(size6 in (8,9) and bm in (2,3),size1,.)*ret)/sum(ifn(size6 in (8,9) and bm in (2,3),size1,.)) as s5b2,
			sum(ifn(size6 in (8,9) and bm in (4,5),size1,.)*ret)/sum(ifn(size6 in (8,9) and bm in (4,5),size1,.)) as s5b3,
			sum(ifn(size6 in (8,9) and bm in (6,7),size1,.)*ret)/sum(ifn(size6 in (8,9) and bm in (6,7),size1,.)) as s5b4,
			sum(ifn(size6 in (8,9) and bm in (8,9),size1,.)*ret)/sum(ifn(size6 in (8,9) and bm in (8,9),size1,.)) as s5b5
		from ret_size6_bm
		group by date
		order by date;
quit;

proc download out=h.ret_size6_bm_5x5;
run;

endrsubmit;
