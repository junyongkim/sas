/*************************************************
max
computes the monthly/daily value/equal-weighted
decile portfolio returns by monthly maximum daily
returns using wrds crsp
*************************************************/

%let wrds=wrds.wharton.upenn.edu 4016;
signon wrds username=_prompt_;

rsubmit;

proc sql;
	create table max as
	select permno,date,max(ret) as max
	from crsp.dsf
	where ret>.z
	group by permno,intnx("mon",date,0)
	having date=max(date);
quit;

proc sql;
	create table msf as
	select a.permno,a.date as date,ret*100 as ret,abs(prc)*shrout/(1+ret) as size,max
	from crsp.msf a left join max b
	on a.permno=b.permno and intnx("mon",a.date,0)=intnx("mon",b.date,1);
	create table dsf as
	select a.permno,a.date as date,ret*100 as ret,abs(prc)*shrout/(1+ret) as size,max
	from crsp.dsf a left join max b
	on a.permno=b.permno and intnx("mon",a.date,0)=intnx("mon",b.date,1);
quit;

proc sql;
	create table exchcd as
	select permno,namedt,ifn(namedt=max(namedt),intnx("mon",nameendt,0,"e"),nameendt) as nameendt,shrcd,exchcd
	from crsp.msenames
	group by permno;
quit;

proc sql;
	create table msfe as
	select a.*,exchcd
	from msf a join exchcd b
	on a.permno=b.permno and namedt<=date<=nameendt
	where ret>.z and size>0 and max>.z and shrcd in (10,11)
	order by date,max;
	create table dsfe as
	select a.*,exchcd
	from dsf a join crsp.dsenames b
	on a.permno=b.permno and namedt<=date<=nameendt
	where ret>.z and size>0 and max>.z and shrcd in (10,11)
	order by date,max;
quit;

proc univariate data=msfe noprint;
	where exchcd=1;
	by date;
	var max;
	output out=msfd pctlpre=max pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc univariate data=dsfe noprint;
	where exchcd=1;
	by date;
	var max;
	output out=dsfd pctlpre=max pctlpts=10 20 30 40 50 60 70 80 90;
run;

data msfa;
	merge msfe msfd;
	by date;
	if max>max90 then rank=10;
	else if max>max80 then rank=9;
	else if max>max70 then rank=8;
	else if max>max60 then rank=7;
	else if max>max50 then rank=6;
	else if max>max40 then rank=5;
	else if max>max30 then rank=4;
	else if max>max20 then rank=3;
	else if max>max10 then rank=2;
	else rank=0;
run;

data dsfa;
	merge dsfe dsfd;
	by date;
	if max>max90 then rank=10;
	else if max>max80 then rank=9;
	else if max>max70 then rank=8;
	else if max>max60 then rank=7;
	else if max>max50 then rank=6;
	else if max>max40 then rank=5;
	else if max>max30 then rank=4;
	else if max>max20 then rank=3;
	else if max>max10 then rank=2;
	else rank=0;
run;

proc means data=msfa noprint;
	by date rank;
	var ret;
	weight size;
	output out=maxmv mean=;
run;

proc means data=msfa noprint;
	by date rank;
	var ret;
	output out=maxme mean=;
run;

proc means data=dsfa noprint;
	by date rank;
	var ret;
	weight size;
	output out=maxdv mean=;
run;

proc means data=dsfa noprint;
	by date rank;
	var ret;
	output out=maxde mean=;
run;

proc transpose data=maxmv prefix=maxmv out=maxmv(drop=_:);
	by date;
	id rank;
	var ret;
run;

proc transpose data=maxme prefix=maxme out=maxme(drop=_:);
	by date;
	id rank;
	var ret;
run;

proc transpose data=maxdv prefix=maxdv out=maxdv(drop=_:);
	by date;
	id rank;
	var ret;
run;

proc transpose data=maxde prefix=maxde out=maxde(drop=_:);
	by date;
	id rank;
	var ret;
run;

data maxm;
	merge maxmv maxme;
	by date;
	label date=;
	format date yymmddn8. maxm: best8.;
run;

data maxd;
	merge maxdv maxde;
	by date;
	label date=;
	format date yymmddn8. maxd: best8.;
run;

proc download data=maxm;
run;

proc download data=maxd;
run;

endrsubmit;

proc export data=maxm replace file="!userprofile\desktop\maxm.csv";
run;

proc export data=maxd replace file="!userprofile\desktop\maxd.csv";
run;
