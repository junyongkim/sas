%let wrds=wrds.wharton.upenn.edu 4016;
signon wrds username=_prompt_;
rsubmit;

/*------------------------------------------------
computes in
------------------------------------------------*/

data in;
	set compa.funda;
	where fyear and indfmt="INDL" and consol="C" and popsrc="D" and datafmt="STD";
	by gvkey fyear;
	if first.fyear;
	if at>0;
	keep gvkey fyear datadate at;
run;

proc sql;
	create table in as
	select a.gvkey,a.fyear,a.datadate,(a.at-b.at)/b.at as in
	from in a join in b
	on a.gvkey=b.gvkey and a.fyear=b.fyear+1;
quit;

proc sql;
	create table in as
		select lpermno,fyear,in
		from in a join crsp.ccmxpf_lnkhist b
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
joins monthly ret and in
------------------------------------------------*/

proc sql;
	create table retin as
		select a.*,in
		from ret a join in b
		on permno=lpermno and ifn(month(date)>6,year(date)-1,year(date)-2)=fyear
		order by date,in;
quit;

/*------------------------------------------------
computes monthly decile equal/value ret by in
------------------------------------------------*/

proc univariate noprint;
	where exchcd=1;
	by date;
	var in;
	output pctlpre=in pctlpts=10 20 30 40 50 60 70 80 90 out=retindec;
run;

data retin;
	merge retin retindec;
	by date;
	if in>in90 then dec=10;
	else if in>in80 then dec=9;
	else if in>in70 then dec=8;
	else if in>in60 then dec=7;
	else if in>in50 then dec=6;
	else if in>in40 then dec=5;
	else if in>in30 then dec=4;
	else if in>in20 then dec=3;
	else if in>in10 then dec=2;
	else dec=1;
	drop in10--in90;
run;

proc means noprint;
	by date dec;
	var ret;
	weight size;
	output out=inm mean=;
run;

proc transpose prefix=inm out=inm(keep=date in:);
	by date;
	id dec;
	var ret;
run;

proc means data=retin noprint;
	by date dec;
	var ret;
	output out=inme mean=;
run;

proc transpose prefix=inme out=inme(keep=date in:);
	by date;
	id dec;
	var ret;
run;

data inm;
	merge inm inme;
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
joins daily ret and in
------------------------------------------------*/

proc sql;
	create table retdin as
		select a.*,in
		from retd a join in b
		on permno=lpermno and ifn(month(date)>6,year(date)-1,year(date)-2)=fyear
		order by date,in;
quit;

/*------------------------------------------------
computes daily decile equal/value ret by in
------------------------------------------------*/

proc univariate noprint;
	where exchcd=1;
	by date;
	var in;
	output pctlpre=in pctlpts=10 20 30 40 50 60 70 80 90 out=retdindec;
run;

data retdin;
	merge retdin retdindec;
	by date;
	if in>in90 then dec=10;
	else if in>in80 then dec=9;
	else if in>in70 then dec=8;
	else if in>in60 then dec=7;
	else if in>in50 then dec=6;
	else if in>in40 then dec=5;
	else if in>in30 then dec=4;
	else if in>in20 then dec=3;
	else if in>in10 then dec=2;
	else dec=1;
	drop in10--in90;
run;

proc means noprint;
	by date dec;
	var ret;
	weight size;
	output out=ind mean=;
run;

proc transpose prefix=ind out=ind(keep=date in:);
	by date;
	id dec;
	var ret;
run;

proc means data=retdin noprint;
	by date dec;
	var ret;
	output out=inde mean=;
run;

proc transpose prefix=inde out=inde(keep=date in:);
	by date;
	id dec;
	var ret;
run;

data ind;
	merge ind inde;
	by date;
run;

proc download;
run;

endrsubmit;

proc export data=inm replace file="!userprofile\desktop\inm.csv";
run;

proc export data=ind replace file="!userprofile\desktop\ind.csv";
run;
