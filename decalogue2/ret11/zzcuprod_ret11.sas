rsubmit;

proc sql;
	create table cuprod_ret11 as select
	i.date,
	i.ret,
	i.val,
	j.date as intck,
	ret11 from
	d.ret i join
	rank_ret11 j on i.permno=j.permno & intnx("month",j.date,2)<i.date
		<intnx("month",j.date,122);
quit;

proc sql undo_policy=none;
	create table cuprod_ret11 as select unique
	intck,
	ifn(ret11>=50,1,-1) as ret11,
	date,
	sum((ret11>=80 | ret11<20)*val*ret)/sum((ret11>=80 | ret11<20)*val) as r005,
	sum((ret11>=90 | ret11<10)*val*ret)/sum((ret11>=90 | ret11<10)*val) as r010,
	sum((ret11>=96 | ret11<4)*val*ret)/sum((ret11>=96 | ret11<4)*val) as r025,
	sum((ret11>=98 | ret11<2)*val*ret)/sum((ret11>=98 | ret11<2)*val) as r050,
	sum((ret11>=99 | ret11<1)*val*ret)/sum((ret11>=99 | ret11<1)*val) as r100 from
	cuprod_ret11
	group by intck,ifn(ret11>=50,1,-1),date order by intck,ret11,date;
quit;

proc expand method=none out=cuprod_ret11;
	by intck ret11;
	id date;
	convert r005/tout=(+1 cuprod -1);
	convert r010/tout=(+1 cuprod -1);
	convert r025/tout=(+1 cuprod -1);
	convert r050/tout=(+1 cuprod -1);
	convert r100/tout=(+1 cuprod -1);
run;

proc sql undo_policy=none;
	create table cuprod_ret11 as select unique
	intck("month",intck,date)-1 as intck,
	date,
	sum(ret11*r005) as r005,
	sum(ret11*r010) as r010,
	sum(ret11*r025) as r025,
	sum(ret11*r050) as r050,
	sum(ret11*r100) as r100 from
	cuprod_ret11
	group by intck("month",intck,date),date;
quit;

proc sql undo_policy=none;
	create table cuprod_ret11 as select
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
	cuprod_ret11
	group by intck order by intck;
quit;

proc download;
run;

endrsubmit;

proc export replace file="!userprofile\desktop\sas\decalogue2\ret11\zzcuprod_ret11.csv";
run;
