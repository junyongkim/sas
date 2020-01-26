/*************************************************
bm
this code computes the monthly/daily value/equal-
weighted decile portfolio returns by book-to-
market ratios using wrds crsp, compustat, and
optionally french
*************************************************/

filename z "%sysfunc(getoption(work))\z";

proc http url="https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Historical_BE_Data.zip" out=z;
run;

filename z zip "%sysfunc(getoption(work))\z";

data dff_be_with_nonindust;
    infile z(DFF_BE_With_Nonindust.txt);
    input CRSP_Permno First_Moody_Year Last_Moody_Year Book_Equity_1926-Book_Equity_2001;
run;

filename z;

proc transpose out=dff_be_with_nonindust;
    by CRSP_Permno First_Moody_Year Last_Moody_Year;
run;

data dff_be_with_nonindust;
    set dff_be_with_nonindust;
    Moody_Year=input(substr(_NAME_,13,4),4.);
    Book_Equity=COL1;
    if First_Moody_Year<=Moody_Year<=Last_Moody_Year;
    drop First_Moody_Year Last_Moody_Year _NAME_ COL1;
run;

%let w=wrds.wharton.upenn.edu 4016;
signon w username=_prompt_;

rsubmit;

proc upload;
run;

proc sql;
	create table dff as
	select a.*,abs(prc)*shrout/1000 as Market_Equity,Book_Equity/calculated Market_Equity as Book_Market
	from dff_be_with_nonindust a left join crsp.msf b
	on CRSP_Permno=permno and Moody_Year=year(date)
	where month(date)=12;
quit;

proc sql;
	create table bm as
	select gvkey,datadate,fyear,
		coalesce(seq,ceq+upstk,at-lt)+coalesce(txditc,0)-coalesce(pstkrv,pstkl,upstk) as be,
		prcc_c*csho as me,
		calculated be/calculated me as bm
	from comp.funda
	where fyear and indfmt="INDL" and consol="C" and popsrc="D" and datafmt="STD"
	group by gvkey,fyear
	having datadate=min(datadate) and n(be,me,bm);
quit;

proc sql;
	create table bmp as
	select lpermno,fyear,be,me,bm
	from bm a join crsp.ccmxpf_lnkhist b
	on a.gvkey=b.gvkey and linkdt<=datadate<=coalesce(linkenddt,"31dec2019"d)
	where linkprim in ("P","C") and linktype in ("LC","LU");
quit;

proc sql;
	create table msfb as
	select permno,date as date,ret*100 as ret,abs(prc)*shrout/(1+ret) as size,be,me,bm
	from crsp.msf a left join bmp b
	on permno=lpermno and ifn(month(date)>6,year(date)-1,year(date)-2)=fyear;
	create table dsfb as
	select permno,date as date,ret*100 as ret,abs(prc)*shrout/(1+ret) as size,be,me,bm
	from crsp.dsf a left join bmp b
	on permno=lpermno and ifn(month(date)>6,year(date)-1,year(date)-2)=fyear;
quit;

proc sql;
	create table msfb as
	select permno,date,ret,size,coalesce(be,Book_Equity) as be,coalesce(me,Market_Equity) as me,coalesce(bm,Book_Market) as bm
	from msfb a left join dff b
	on permno=CRSP_Permno and ifn(month(date)>6,year(date)-1,year(date)-2)=Moody_Year;
	create table dsfb as
	select permno,date,ret,size,coalesce(be,Book_Equity) as be,coalesce(me,Market_Equity) as me,coalesce(bm,Book_Market) as bm
	from dsfb a left join dff b
	on permno=CRSP_Permno and ifn(month(date)>6,year(date)-1,year(date)-2)=Moody_Year;
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
	from msfb a join exchcd b
	on a.permno=b.permno and namedt<=date<=nameendt
	where ret>.z and size>0 and bm and shrcd in (10,11)
	order by date,bm;
	create table dsfe as
	select a.*,exchcd
	from dsfb a join crsp.dsenames b
	on a.permno=b.permno and namedt<=date<=nameendt
	where ret>.z and size>0 and bm and shrcd in (10,11)
	order by date,bm;
quit;

proc univariate data=msfe noprint;
	where bm>0 and exchcd=1;
	by date;
	var bm;
	output out=msfd pctlpre=bm pctlpts=10 20 30 40 50 60 70 80 90;
run;

proc univariate data=dsfe noprint;
	where bm>0 and exchcd=1;
	by date;
	var bm;
	output out=dsfd pctlpre=bm pctlpts=10 20 30 40 50 60 70 80 90;
run;

data msfa;
	merge msfe msfd;
	by date;
	if bm>bm90 then rank=10;
	else if bm>bm80 then rank=9;
	else if bm>bm70 then rank=8;
	else if bm>bm60 then rank=7;
	else if bm>bm50 then rank=6;
	else if bm>bm40 then rank=5;
	else if bm>bm30 then rank=4;
	else if bm>bm20 then rank=3;
	else if bm>bm10 then rank=2;
	else if bm>0 then rank=1;
	else rank=0;
run;

data dsfa;
	merge dsfe dsfd;
	by date;
	if bm>bm90 then rank=10;
	else if bm>bm80 then rank=9;
	else if bm>bm70 then rank=8;
	else if bm>bm60 then rank=7;
	else if bm>bm50 then rank=6;
	else if bm>bm40 then rank=5;
	else if bm>bm30 then rank=4;
	else if bm>bm20 then rank=3;
	else if bm>bm10 then rank=2;
	else if bm>0 then rank=1;
	else rank=0;
run;

proc means data=msfa noprint;
	by date rank;
	var ret;
	weight size;
	output out=bmmv mean=;
run;

proc means data=msfa noprint;
	by date rank;
	var ret;
	output out=bmme mean=;
run;

proc means data=dsfa noprint;
	by date rank;
	var ret;
	weight size;
	output out=bmdv mean=;
run;

proc means data=dsfa noprint;
	by date rank;
	var ret;
	weight size;
	output out=bmde mean=;
run;

proc transpose data=bmmv prefix=bmmv out=bmmv(drop=_:);
	by date;
	id rank;
	var ret;
run;

proc transpose data=bmme prefix=bmme out=bmme(drop=_:);
	by date;
	id rank;
	var ret;
run;

proc transpose data=bmdv prefix=bmdv out=bmdv(drop=_:);
	by date;
	id rank;
	var ret;
run;

proc transpose data=bmde prefix=bmde out=bmde(drop=_:);
	by date;
	id rank;
	var ret;
run;

data bmm;
	label date=;
	format bmmv0-bmmv10 bmme0-bmme10 best8.;
	merge bmmv bmme;
run;

data bmd;
	label date=;
	format bmdv0-bmdv10 bmde0-bmde10 best8.;
	merge bmdv bmde;
run;

proc download data=bmm;
run;

proc download data=bmd;
run;

endrsubmit;

proc export data=bmm replace file="!userprofile\desktop\bmm.csv";
run;

proc export data=bmd replace file="!userprofile\desktop\bmd.csv";
run;
