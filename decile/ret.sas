/*************************************************
ret
computes the monthly/daily value-weighted decile
portfolio returns by prior returns using wrds crsp
*************************************************/

%let wrds=wrds.wharton.upenn.edu 4016;
signon wrds username=_prompt_;
rsubmit;

proc expand data=crsp.msf(keep=permno date ret) out=ret(where=(ret));
	by permno;
	id date;
	convert ret/method=none tout=(lag 1 +1 nomiss movprod 11 -1 trimleft 10);
proc sql;
	create table exchcd as select permno,namedt,case when namedt<max(namedt) then nameendt else intnx("mon",nameendt,1)-1 end as nameendt,exchcd from crsp.msenames where 9<shrcd<12 group by permno;
	create table rank as select a.*,exchcd from ret a join exchcd b on a.permno=b.permno and namedt<=date<=nameendt order by date;
quit;

proc univariate noprint;
	where exchcd=1;
	by date;
	var ret;
	output pctlpre=ret pctlpts=10 20 30 40 50 60 70 80 90 out=break;
data rank;
	merge rank break;
	by date;
	if ret>ret90 then rank=10;
	else if ret>ret80 then rank=9;
	else if ret>ret70 then rank=8;
	else if ret>ret60 then rank=7;
	else if ret>ret50 then rank=6;
	else if ret>ret40 then rank=5;
	else if ret>ret30 then rank=4;
	else if ret>ret20 then rank=3;
	else if ret>ret10 then rank=2;
	else if ret>.z then rank=1;
	keep permno date rank;
proc sql;
	create table retm as select a.permno,a.date as date label="",ret format=best8.,abs(prc)*shrout/(1+ret) as size,rank from crsp.msf a join rank b on a.permno=b.permno and intnx("mon",a.date,0)=intnx("mon",b.date,1) where ret>.z and prc and shrout and rank order by date,rank;
	create table retd as select a.permno,a.date as date label="",ret format=best8.,abs(prc)*shrout/(1+ret) as size,rank from crsp.dsf a join rank b on a.permno=b.permno and intnx("mon",a.date,0)=intnx("mon",b.date,1) where ret>.z and prc and shrout and rank order by date,rank;
quit;

proc means data=retm noprint;
	by date rank;
	var ret;
	weight size;
	output out=retm mean=;
proc transpose prefix=ret out=retm(drop=_:);
	by date;
	id rank;
	var ret;
proc download;
proc means data=retd noprint;
	by date rank;
	var ret;
	weight size;
	output out=retd mean=;
proc transpose prefix=ret out=retd(drop=_:);
	by date;
	id rank;
	var ret;
proc download;
run;

endrsubmit;

proc export data=retm replace file="!userprofile\desktop\retm.csv";
proc export data=retd replace file="!userprofile\desktop\retd.csv";
run;
