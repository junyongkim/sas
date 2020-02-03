/*************************************************
sz
computes the monthly/daily value/equal-weighted
decile portfolio returns by size using wrds crsp
*************************************************/

%let w=wrds.wharton.upenn.edu 4016;
signon w username=_prompt_;

rsubmit;

proc sql;
	create table mexchcd as
	select permno,namedt,case when namedt=max(namedt) then intnx("mon",nameendt,0,"e") else nameendt end as nameendt,shrcd,exchcd
	from crsp.msenames
	where shrcd>.z and exchcd>.z
	group by permno;
quit;

proc sql;
	create table mall as
	select a.permno,date,ret*100 as ret,abs(prc)*shrout/(1+ret) as sz,exchcd
	from crsp.msf a join mexchcd b
	on a.permno=b.permno and namedt<=date<=nameendt
	where ret>.z and prc>.z and shrout>.z and shrcd in (10,11)
	order by date,sz;
	create table dall as
	select a.permno,a.date,a.ret*100 as ret,abs(prc)*shrout/(1+a.ret) as sz,b.sz as sz_,c.exchcd
	from (crsp.dsf a join mall b on a.permno=b.permno and intnx("mon",a.date,0)=intnx("mon",b.date,0))
		join crsp.dsenames c on a.permno=c.permno and namedt<=a.date<=nameendt
	where a.ret>.z and prc>.z and shrout>.z and sz_>.z and shrcd in (10,11)
	order by date,sz_;
quit;

proc univariate data=mall noprint;
	where exchcd=1;
	by date;
	var sz;
	output out=msz pctlpre=sz pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc univariate data=dall noprint;
	where exchcd=1;
	by date;
	var sz_;
	output out=dsz pctlpre=sz pctlpts=10 20 30 40 50 60 70 80 90;
run;

data mall;
	merge mall msz;
	by date;
	if sz>sz90 then rank=10;
	else if sz>sz80 then rank=9;
	else if sz>sz70 then rank=8;
	else if sz>sz60 then rank=7;
	else if sz>sz50 then rank=6;
	else if sz>sz40 then rank=5;
	else if sz>sz30 then rank=4;
	else if sz>sz20 then rank=3;
	else if sz>sz10 then rank=2;
	else rank=1;
run;

data dall;
	merge dall dsz;
	by date;
	if sz_>sz90 then rank=10;
	else if sz_>sz80 then rank=9;
	else if sz_>sz70 then rank=8;
	else if sz_>sz60 then rank=7;
	else if sz_>sz50 then rank=6;
	else if sz_>sz40 then rank=5;
	else if sz_>sz30 then rank=4;
	else if sz_>sz20 then rank=3;
	else if sz_>sz10 then rank=2;
	else rank=1;
run;

proc means data=mall noprint;
	by date rank;
	var ret;
	weight sz;
	output out=szmv mean=;
run;

proc transpose prefix=szmv out=szmv;
	by date;
	id rank;
	var ret;
run;

proc means data=mall noprint;
	by date rank;
	var ret;
	output out=szme mean=;
run;

proc transpose prefix=szme out=szme;
	by date;
	id rank;
	var ret;
run;

proc means data=dall noprint;
	by date rank;
	var ret;
	weight sz;
	output out=szdv mean=;
run;

proc transpose prefix=szdv out=szdv;
	by date;
	id rank;
	var ret;
run;

proc means data=dall noprint;
	by date rank;
	var ret;
	output out=szde mean=;
run;

proc transpose prefix=szde out=szde;
	by date;
	id rank;
	var ret;
run;

data szm;
	merge szmv szme;
	by date;
	label date=;
	format date yymmddn8. szm: best8.;
	drop _name_;
run;

proc download;
run;

data szd;
	merge szdv szde;
	by date;
	label date=;
	format date yymmddn8. szd: best8.;
	drop _name_;
run;

proc download;
run;

endrsubmit;

proc export data=szm replace file="!userprofile\desktop\szm.csv";
run;

proc export data=szd replace file="!userprofile\desktop\szd.csv";
run;
