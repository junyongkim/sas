%let _=wrds.wharton.upenn.edu 4016;
signon _ username=_prompt_;
rsubmit;

data _;
	set crsp.msenames;
	by permno;
	if last.permno then nameendt=intnx("mon",nameendt,1)-1;
run;

proc sql;
	create table msf as
	select a.permno,date as date,ret,abs(prc)*shrout/(1+ret) as size,shrcd,exchcd
	from crsp.msf a left join _ b
	on a.permno=b.permno and namedt<=date<=nameendt
	order by permno,date;
quit;

proc expand method=none out=msf;
	by permno;
	id date;
	convert ret=ret122/tout=(lag 2 +1 nomiss movprod 11 -1 trimleft 10);
run;

proc sort;
	by date ret122;
run;

proc univariate noprint;
	where 10<=shrcd<=11 and exchcd=1;
	by date;
	var ret122;
	output pctlpre=ret122 pctlpts=10 20 30 40 50 60 70 80 90 out=_;
run;

data msf;
	merge msf _;
	by date;
	if ret122>ret12290 then rank=10;
	else if ret122>ret12280 then rank=9;
	else if ret122>ret12270 then rank=8;
	else if ret122>ret12260 then rank=7;
	else if ret122>ret12250 then rank=6;
	else if ret122>ret12240 then rank=5;
	else if ret122>ret12230 then rank=4;
	else if ret122>ret12220 then rank=3;
	else if ret122>ret12210 then rank=2;
	else if ret122>.z then rank=1;
	if ret>.z and size and 10<=shrcd<=11 and rank;
	keep date ret size rank;
run;

proc means noprint;
	by date rank;
	var ret;
	weight size;
	output mean= out=_;
run;

proc transpose prefix=ret122 out=_(drop=_:);
	id rank;
	by date;
	var ret;
	label date=;
	format ret best8.;
run;

proc download;
run;

endrsubmit;

proc export replace file="!userprofile\desktop\ret122.csv";
run;
