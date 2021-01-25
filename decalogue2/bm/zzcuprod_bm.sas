rsubmit;

proc sql;
	create table cuprod_bm as select
	date,
	ret,
	val,
	intnx("year.6",datadate,1) as intck,
	bm from
	d.ret join
	rank_bm on permno=lpermno & intnx("month",intnx("year.6",datadate,1),2)<date
		<intnx("month",intnx("year.6",datadate,1),122);
quit;

proc sql undo_policy=none;
	create table cuprod_bm as select unique
	intck,
	ifn(bm>=50,1,-1) as bm,
	date,
	sum((bm>=80 | bm<20)*val*ret)/sum((bm>=80 | bm<20)*val) as r005,
	sum((bm>=90 | bm<10)*val*ret)/sum((bm>=90 | bm<10)*val) as r010,
	sum((bm>=96 | bm<4)*val*ret)/sum((bm>=96 | bm<4)*val) as r025,
	sum((bm>=98 | bm<2)*val*ret)/sum((bm>=98 | bm<2)*val) as r050,
	sum((bm>=99 | bm<1)*val*ret)/sum((bm>=99 | bm<1)*val) as r100 from
	cuprod_bm
	group by intck,ifn(bm>=50,1,-1),date order by intck,bm,date;
quit;

proc expand method=none out=cuprod_bm;
	by intck bm;
	id date;
	convert r005/tout=(+1 cuprod -1);
	convert r010/tout=(+1 cuprod -1);
	convert r025/tout=(+1 cuprod -1);
	convert r050/tout=(+1 cuprod -1);
	convert r100/tout=(+1 cuprod -1);
run;

proc sql undo_policy=none;
	create table cuprod_bm as select unique
	intck("month",intck,date)-1 as intck,
	date,
	sum(bm*r005) as r005,
	sum(bm*r010) as r010,
	sum(bm*r025) as r025,
	sum(bm*r050) as r050,
	sum(bm*r100) as r100 from
	cuprod_bm
	group by intck("month",intck,date),date;
quit;

proc sql undo_policy=none;
	create table cuprod_bm as select
	intck,
	avg(r005)-2*stderr(r005) as lor005,
	avg(r005) as r005,
	avg(r005)+2*stderr(r005) as hir005,
	avg(r010)-2*stderr(r010) as lor010,
	avg(r010) as r010,
	avg(r010)+2*stderr(r010) as hir010,
	avg(r025)-2*stderr(r025) as lor025,
	avg(r025) as r025,
	avg(r025)+2*stderr(r025) as hir025,
	avg(r050)-2*stderr(r050) as lor050,
	avg(r050) as r050,
	avg(r050)+2*stderr(r050) as hir050,
	avg(r100)-2*stderr(r100) as lor100,
	avg(r100) as r100,
	avg(r100)+2*stderr(r100) as hir100 from
	cuprod_bm
	group by intck order by intck;
quit;

proc download;
run;

endrsubmit;

proc export replace file="!userprofile\desktop\sas\decalogue2\bm\zzcuprod_bm.csv";
run;
