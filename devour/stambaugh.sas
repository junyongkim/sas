resetline;

proc printto log="!userprofile\desktop\devour\stambaugh.txt";
run;

option dlcreatedir;
libname s "!userprofile\desktop\devour\stambaugh\";
option nodlcreatedir;

filename h url "http://finance.wharton.upenn.edu/~stambaug/";

data stambaugh;
	infile h truncover;
	input file $32767.;
	if find(file,"csv") or find(file,"txt");
	file=substr(scan(file,2,'"'),12);
	name=scan(file,1,".");
run;

%macro stambaugh;

proc sql noprint;
	select file,name into :file separated by " ",:name separated by " " from stambaugh;
quit;

%do i=1 %to %sysfunc(countw(&file.,%str( )));

filename c url "http://finance.wharton.upenn.edu/~stambaug/%scan(&file.,&i.,%str( ))";
filename c2 "!userprofile\desktop\devour\stambaugh\_%scan(&file.,&i.,%str( ))";
%if %substr(%scan(&file.,&i.,%str( )),1,4)=CH_3 %then %let firstobs=9;
%else %if %substr(%scan(&file.,&i.,%str( )),1,4)=CH_4 %then %let firstobs=10;
%else %if %substr(%scan(&file.,&i.,%str( )),1,4)=liq_ %then %let firstobs=12;
%else %let firstobs=1;

data _null_;
	infile c firstobs=&firstobs.;
	file c2;
	input;
	put _infile_;
run;

%if %substr(%scan(&file.,&i.,%str( )),1,4)=liq %then %do;

data s.%scan(&name.,&i.,%str( ));
	infile c2 expandtabs truncover;
	input :month :aggliq :innovliq :tradedliq;
run;

%end;

%else %do;

proc import file=c2 dbms=csv replace out=s.%scan(&name.,&i.,%str( ));
	guessingrows=max;
run;

%end;

%end;

%mend;

%stambaugh;

libname s;
filename c;

proc printto;
run;
