/*-----------------------------------------------------------------------------+
| yahoo60mf3.bat, yahoo60mf3.sas                                               |
| junyong                                                                      |
| 201003                                                                       |
+-----------------------------------------------------------------------------*/
data i;
	input @@;
	_infile_=resolve(_infile_);
	input t :$16. @@;
	if "%sysget(d)"d=intnx("mon","%sysget(d)"d,0,"end") then do;
		p=intnx("month","%sysget(d)"d,-60);
		q="%sysget(d)"d;
	end;
	else do;
		p=intnx("month","%sysget(d)"d,-61);
		q=intnx("month","%sysget(d)"d,-1,"end");
	end;
	f=cats("https://query1.finance.yahoo.com/v7/finance/download/",t,
		"?period1=",dhms(p,0,0,0)-315619200,
		'&period2=',dhms(q,23,59,59)-315619200,
		'&interval=1mo');
	infile _ url filevar=f firstobs=2 dsd end=e;
	do until(e);
		input d yymmdd10. +1 o h l c a v;
		output;
	end;
cards;
%sysget(t)
;

data _null_;
	f=cats("https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/",
		"f-f_research_data_factors_csv.zip");
	infile _ url filevar=f recfm=f;
	input;
	file "%sysfunc(pathname(work))\f" recfm=n;
	put _infile_;
run;

filename f zip "%sysfunc(pathname(work))\f";

data f;
	infile f(F-F_Research_Data_Factors.CSV)
		dsd truncover;
	input d m s h f;
run;

proc sql;
	create table o as
		select t,i.d as date,a,1 as cons,m as mktrf,s as smb,f.h as hml,f as rf
		from i left join f on put(i.d,yymmn.)=put(f.d,6.)
		order by t,date;
quit;

proc expand method=none out=o;
	by t;
	id date;
	convert a/tout=(pctdif);
run;

proc sort;
	by date t;
run;

proc transpose out=o(drop=_name_);
	where a>.;
	id t;
	by date cons mktrf smb hml rf;
	format date yymmn6. cons mktrf smb hml a 12.2;
run;

proc export replace file="!userprofile\desktop\%sysget(f).csv";
run;
