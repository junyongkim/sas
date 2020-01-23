resetline;

proc printto log="!userprofile\desktop\devour\michigan.txt";
run;

option dlcreatedir;
libname m "!userprofile\desktop\devour\michigan\";
option nodlcreatedir;

filename h url "http://www.sca.isr.umich.edu/tables.html";

data tables;
	infile h truncover;
	input url $32767.;
	if count(url,".csv");
	if count(url,"tbc") then delete;
	url="http://www.sca.isr.umich.edu"||scan(url,2,'"');
	file "!userprofile\desktop\devour\michigan\_tables.txt";
	put url;
run;

%macro michigan;

proc sql noprint;
	select url,scan(url,4,"/") into :url separated by " ",:file separated by " " from tables order by url;
quit;

%do i=1 %to %sysfunc(countw(&url.,%str( )));

filename c "!userprofile\desktop\devour\michigan\_%scan(&file.,&i.,%str( ))";

proc http url="%scan(&url.,&i.,%str( ))" out=c;
run;

proc import file=c dbms=csv replace out=m.%scan(%scan(&file.,&i.,%str( )),1,.);
	guessingrows=max;
run;

%end;

%mend;

%michigan;

libname m;
filename c;

proc printto;
run;
