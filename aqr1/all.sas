option dlcreatedir;
libname aqr1 "!userprofile\desktop\aqr1\";
option nodlcreatedir;

%macro xlsx(xlsx);

filename xlsx "!userprofile\desktop\aqr1\_&xlsx..xlsx";

proc http url="http://images.aqr.com/-/media/aqr/documents/insights/data-sets/&xlsx..xlsx" out=xlsx;
run;

%mend;

%xlsx(betting-against-beta-equity-factors-daily)
%xlsx(betting-against-beta-equity-factors-monthly)
%xlsx(quality-minus-junk-factors-daily)
%xlsx(quality-minus-junk-factors-monthly)

%macro sas7bdat(xlsx,sas7bdat,range,put,input);

proc import file="!userprofile\desktop\aqr1\_&xlsx..xlsx" dbms=xlsx replace out=&sas7bdat.;
	range="&range.";
run;

data aqr1.&sas7bdat.(drop=dat j);
	format DATE;
	set &sas7bdat.(rename=(date=dat));
	date=input(put(input(dat,mmddyy10.),&put.),&input.);
	array i(*) _numeric_;
	do j=2 to dim(i);
		i(j)=i(j)*100;
	end;
run;

proc datasets lib=aqr1 nolist;
	modify &sas7bdat.;
	attrib _all_ label="";
	attrib _all_ format=;
quit;

%mend;

%sas7bdat(betting-against-beta-equity-factors-daily,babd,bab factors$a19:ad23693,yymmddn8.,8.)
%sas7bdat(betting-against-beta-equity-factors-daily,hmdd,hml devil$a19:ad25022,yymmddn8.,8.)
%sas7bdat(betting-against-beta-equity-factors-daily,hmld,hml ff$a19:ad25022,yymmddn8.,8.)
%sas7bdat(betting-against-beta-equity-factors-daily,mktd,mkt$a19:ad25002,yymmddn8.,8.)
%sas7bdat(betting-against-beta-equity-factors-daily,rfd,rf$a19:b25589,yymmddn8.,8.)
%sas7bdat(betting-against-beta-equity-factors-daily,smbd,smb$a19:ad25002,yymmddn8.,8.)
%sas7bdat(betting-against-beta-equity-factors-daily,umdd,umd$a19:ad24852,yymmddn8.,8.)
%sas7bdat(betting-against-beta-equity-factors-monthly,babm,bab factors$a19:ad1089,yymmn6.,6.)
%sas7bdat(betting-against-beta-equity-factors-monthly,hmdm,hml devil$a19:ad1142,yymmn6.,6.)
%sas7bdat(betting-against-beta-equity-factors-monthly,hmlm,hml ff$a19:ad1142,yymmn6.,6.)
%sas7bdat(betting-against-beta-equity-factors-monthly,mktm,mkt$a19:ad1142,yymmn6.,6.)
%sas7bdat(betting-against-beta-equity-factors-monthly,rfm,rf$a19:b1143,yymmn6.,6.)
%sas7bdat(betting-against-beta-equity-factors-monthly,smbm,smb$a19:ad1142,yymmn6.,6.)
%sas7bdat(betting-against-beta-equity-factors-monthly,umdm,umd$a19:ad1136,yymmn6.,6.)
%sas7bdat(quality-minus-junk-factors-daily,qmjd,qmj factors$a19:ad16093,yymmddn8.,8.)
%sas7bdat(quality-minus-junk-factors-monthly,mem,me(t-1)$a19:ad1143,yymmn6.,6.)
%sas7bdat(quality-minus-junk-factors-monthly,qmjm,qmj factors$a19:ad770,yymmn6.,6.)

proc transpose data=aqr1.mem out=mem;
	by date;
run;

data mktd(drop=risk_free_rate j);
	merge aqr1.mktd(in=a) aqr1.rfd;
	by date;
	if a;
	array i(*) _all_;
	do j=2 to dim(i);
		i(j)=i(j)+risk_free_rate;
	end;
	dat=int(date/100);
run;

proc transpose out=mktd;
	by date dat;
run;

proc sql;
	create table med as select a.*,b.col1 as col2 from mktd a join mem b on a._name_=b._name_ and a.dat=b.date order by _name_,date;
quit;

proc printto log="nul:";
run;

proc expand method=none out=med;
	by _name_ dat;
	id date;
	convert col1=col3/tout=(lag 1 /100 +1 cuprod);
run;

proc printto;
run;

data med;
	set med;
	by _name_ dat;
	if col1>. then do;
		if first.dat then col4=col2;
		else col4=col2*col3;
	end;
run;

proc sort;
	by date _name_;
run;

proc transpose out=med(drop=_name_);
	by date;
	var col4;
run;

data aqr1.med;
	merge med(drop=global: europe north_america pacific) med(keep=global:) med(keep=europe) med;
	if n(of _all_)>1;
run;

proc sort data=mem;
	by date _name_;
run;

proc transpose out=mem(drop=_name_);
	by date;
	var col1;
run;

data aqr1.mem;
	merge mem(drop=global: europe north_america pacific) mem(keep=global:) mem(keep=europe) mem;
run;
