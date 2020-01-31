resetline;

proc printto log="!userprofile\desktop\hxz\csv.txt";
run;

filename t ("!userprofile\desktop\hxz\factors.txt","!userprofile\desktop\hxz\testingportfolios.txt");

data factorstestingportfolios;
	infile t;
	input url $32767.;
	file=reverse(substr(reverse(url),1,find(reverse(url),"/")-1));
run;

option dlcreatedir;
libname c "!userprofile\desktop\hxz\csv\";
libname c;
option dlcreatedir;

%macro csv;

%let hxz=http://global-q.org/;

proc sql noprint;
	select url,file into :url separated by " ",:file separated by " " from factorstestingportfolios;
run;

%do i=1 %to %sysfunc(countw(&url.," "));

filename c "!userprofile\desktop\hxz\csv\%scan(&file.,&i.,' ')";

proc http url="&hxz.%scan(&url.,&i.,' ')" out=c;
run;

%end;

%mend;

%csv;

proc printto;
run;
