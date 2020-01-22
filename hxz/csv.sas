resetline;

proc printto log="!userprofile\desktop\hxz\csv.txt";
run;

%let hxz=http://global-q.org/;
filename t ("!userprofile\desktop\hxz\factors.txt","!userprofile\desktop\hxz\testingportfolios.txt");

data factorstestingportfolios;
	infile t length=l;
	input url $varying32767. l;
	file=reverse(substr(reverse(url),1,find(reverse(url),"/")-1));
run;

proc sql noprint;
	select url,file into :url separated by " ",:file separated by " " from factorstestingportfolios;
run;

option dlcreatedir;
libname c "!userprofile\desktop\hxz\csv\";
libname c;
option dlcreatedir;

%macro csv;

%do i=1 %to %sysfunc(countw(&url.," "));

filename c "!userprofile\desktop\hxz\csv\%scan(&file.,&i.,' ')";

proc http url="&hxz.%scan(&url.,&i.,' ')" out=c;
run;

%end;

%mend;

%csv;

proc printto;
run;
