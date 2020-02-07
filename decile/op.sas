%let wrds=wrds.wharton.upenn.edu 4016;
signon wrds username=_prompt_;
rsubmit;

/*------------------------------------------------
computes op
------------------------------------------------*/

data op;
	set compa.funda;
	where fyear and indfmt="INDL" and consol="C" and popsrc="D" and datafmt="STD";
	by gvkey fyear;
	if first.fyear;
	be=coalesce(seq,ceq+upstk,at-lt)+coalesce(txditc,0)-coalesce(pstkrv,pstkl,upstk);
	if be>0 then op=(revt-sum(cogs,tie,xsga))/be;
	if op>.;
	keep gvkey fyear datadate op;
run;

proc sql;
	create table op as
		select lpermno,fyear,op
		from op a join crsp.ccmxpf_lnkhist b
		on a.gvkey=b.gvkey and linkdt<=datadate<=coalesce(linkenddt,"31dec2019"d)
		where linkprim in ("P","C") and linktype in ("LC","LU")
		order by lpermno,fyear;
quit;

/*------------------------------------------------
computes monthly ret
------------------------------------------------*/

data exchcd;
	set crsp.msenames;
	by permno;
	if last.gvkey then nameendt=intnx("mon",nameendt,1)-1;
	keep permno namedt nameendt shrcd exchcd;
run;

proc sql;
	create table ret as
		select a.permno,date as date label="",ret*100 as ret format=best8.,abs(prc)*shrout/(1+ret) as size,exchcd
		from crsp.msf a join exchcd b
		on a.permno=b.permno and namedt<=date<=nameendt
		where ret>.z and abs(prc) and shrout and 9<shrcd<12;
quit;

/*------------------------------------------------
joins monthly ret and op
------------------------------------------------*/

proc sql;
	create table retop as
		select a.*,op
		from ret a join op b
		on permno=lpermno and ifn(month(date)>6,year(date)-1,year(date)-2)=fyear
		order by date,op;
quit;

/*------------------------------------------------
computes monthly decile equal/value ret by op
------------------------------------------------*/

proc univariate noprint;
	where exchcd=1;
	by date;
	var op;
	output pctlpre=op pctlpts=10 20 30 40 50 60 70 80 90 out=retopdec;
run;

data retop;
	merge retop retopdec;
	by date;
	if op>op90 then dec=10;
	else if op>op80 then dec=9;
	else if op>op70 then dec=8;
	else if op>op60 then dec=7;
	else if op>op50 then dec=6;
	else if op>op40 then dec=5;
	else if op>op30 then dec=4;
	else if op>op20 then dec=3;
	else if op>op10 then dec=2;
	else dec=1;
	drop op10--op90;
run;

proc means noprint;
	by date dec;
	var ret;
	weight size;
	output out=opm mean=;
run;

proc transpose prefix=opm out=opm(keep=date op:);
	by date;
	id dec;
	var ret;
run;

proc means data=retop noprint;
	by date dec;
	var ret;
	output out=opme mean=;
run;

proc transpose prefix=opme out=opme(keep=date op:);
	by date;
	id dec;
	var ret;
run;

data opm;
	merge opm opme;
	by date;
run;

proc download;
run;

/*------------------------------------------------
computes daily ret
------------------------------------------------*/

proc sql;
	create table retd as
		select a.permno,date as date label="",ret*100 as ret format=best8.,abs(prc)*shrout/(1+ret) as size,exchcd
		from crsp.dsf a join crsp.dsenames b
		on a.permno=b.permno and namedt<=date<=nameendt
		where ret>.z and abs(prc) and shrout and 9<shrcd<12;
quit;

/*------------------------------------------------
joins daily ret and op
------------------------------------------------*/

proc sql;
	create table retdop as
		select a.*,op
		from retd a join op b
		on permno=lpermno and ifn(month(date)>6,year(date)-1,year(date)-2)=fyear
		order by date,op;
quit;

/*------------------------------------------------
computes daily decile equal/value ret by op
------------------------------------------------*/

proc univariate noprint;
	where exchcd=1;
	by date;
	var op;
	output pctlpre=op pctlpts=10 20 30 40 50 60 70 80 90 out=retdopdec;
run;

data retdop;
	merge retdop retdopdec;
	by date;
	if op>op90 then dec=10;
	else if op>op80 then dec=9;
	else if op>op70 then dec=8;
	else if op>op60 then dec=7;
	else if op>op50 then dec=6;
	else if op>op40 then dec=5;
	else if op>op30 then dec=4;
	else if op>op20 then dec=3;
	else if op>op10 then dec=2;
	else dec=1;
	drop op10--op90;
run;

proc means noprint;
	by date dec;
	var ret;
	weight size;
	output out=opd mean=;
run;

proc transpose prefix=opd out=opd(keep=date op:);
	by date;
	id dec;
	var ret;
run;

proc means data=retdop noprint;
	by date dec;
	var ret;
	output out=opde mean=;
run;

proc transpose prefix=opde out=opde(keep=date op:);
	by date;
	id dec;
	var ret;
run;

data opd;
	merge opd opde;
	by date;
run;

proc download;
run;

endrsubmit;

proc export data=opm replace file="!userprofile\desktop\opm.csv";
run;

proc export data=opd replace file="!userprofile\desktop\opd.csv";
run;
