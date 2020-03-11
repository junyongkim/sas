resetline;

proc printto log="!userprofile\desktop\zhang\sas7bdat.txt";
run;

libname s "!userprofile\desktop\zhang\sas7bda\";
ods results=off;
ods output members=s;

proc datasets lib=s;
run;

ods results=on;
option dlcreatedir;
libname a "!userprofile\desktop\zhang\sas7bdat\";
option nodlcreatedir;

%macro sas7bdat;

proc sql noprint;
	select name into :s separated by " " from s order by num;
quit;

%do i=1 %to %sysfunc(countw(&s.,%str( )));

proc contents data=s.%scan(&s.,&i.,%str( )) noprint out=a.%scan(&s.,&i.,%str( ));
run;

proc sql noprint;
	select name into :name separated by " " from a.%scan(&s.,&i.,%str( )) order by varnum;
quit;

%let lowcase=%sysfunc(lowcase(&name.));
%let n=%sysfunc(countw(&name.,%str( )));
%if %sysfunc(count(&name.,rank)) %then %let tag1=%substr(%scan(&name.,%eval(&n.-1),%str( )),6);
%if %sysfunc(count(&name.,rank))>1 %then %let tag2=%substr(%scan(&name.,%eval(&n.-2),%str( )),6);
%if %sysfunc(count(&name.,rank))>2 %then %let tag3=%substr(%scan(&name.,%eval(&n.-3),%str( )),6);

data a.%scan(&s.,&i.,%str( ));
	format date;
	%if %sysfunc(count(&lowcase.,r_f)) %then %do;
	merge s.%scan(&s.,&i.,%str( ))(drop=r_f) s.%scan(&s.,&i.,%str( ))(keep=r_f);
	%end;
	%else %do;
	set s.%scan(&s.,&i.,%str( ));
	%end;
	%if %sysfunc(count(&lowcase.,month)) %then %do;
	date=year*100+month;
	drop year month;
	%end;
	%else %if %sysfunc(count(&lowcase.,quarter)) %then %do;
	date=year*100+quarter*3;
	drop year quarter;
	%end;
	%else %if %sysfunc(count(&lowcase.,year)) %then %do;
	date=year;
	drop year;
	%end;
	%if %sysfunc(count(&name.,rank))=1 %then %do;
	tag="&tag1."||"_"||put(rank_&tag1.,z2.);
	%end;
	%else %if %sysfunc(count(&name.,rank))=2 %then %do;
	tag="&tag2."||"_"||"&tag1."||"_"||put(rank_&tag2.,z1.)||"_"||put(rank_&tag1.,z1.);
	%end;
	%else %if %sysfunc(count(&name.,rank))=3 %then %do;
	tag="&tag3."||"_"||"&tag2."||"_"||"&tag1."||"_"||put(rank_&tag3.,z1.)||"_"||put(rank_&tag2.,z1.)||"_"||put(rank_&tag1.,z1.);
	%end;
run;

proc sort;
	by date;
run;

%if %sysfunc(count(&name.,rank)) %then %do;

proc transpose out=a.%scan(&s.,&i.,%str( ))(drop=_name_);
	by date;
	id tag;
	var %scan(&name.,&n.%str( ));
run;

%end;

%end;

%mend;

%sas7bdat;

proc printto;
run;
