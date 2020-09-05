libname r "!userprofile\desktop\sas\decalogue\ret_size6_bm\";

rsubmit;

proc sql;
	create table ret_size6_bm_2x3 as
		select date,
			sum(ifn(size6 in (0,1,2,3,4) and bm in (0,1,2),size1,.)*ret)/sum(ifn(size6 in (0,1,2,3,4) and bm in (0,1,2),size1,.)) as s1b1,
			sum(ifn(size6 in (0,1,2,3,4) and bm in (3,4,5,6),size1,.)*ret)/sum(ifn(size6 in (0,1,2,3,4) and bm in (3,4,5,6),size1,.)) as s1b2,
			sum(ifn(size6 in (0,1,2,3,4) and bm in (7,8,9),size1,.)*ret)/sum(ifn(size6 in (0,1,2,3,4) and bm in (7,8,9),size1,.)) as s1b3,
			sum(ifn(size6 in (5,6,7,8,9) and bm in (0,1,2),size1,.)*ret)/sum(ifn(size6 in (5,6,7,8,9) and bm in (0,1,2),size1,.)) as s2b1,
			sum(ifn(size6 in (5,6,7,8,9) and bm in (3,4,5,6),size1,.)*ret)/sum(ifn(size6 in (5,6,7,8,9) and bm in (3,4,5,6),size1,.)) as s2b2,
			sum(ifn(size6 in (5,6,7,8,9) and bm in (7,8,9),size1,.)*ret)/sum(ifn(size6 in (5,6,7,8,9) and bm in (7,8,9),size1,.)) as s2b3
		from ret_size6_bm
		group by date
		order by date;
quit;

proc download out=r.ret_size6_bm_2x3;
run;

endrsubmit;
