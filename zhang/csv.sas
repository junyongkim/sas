resetline;

proc printto log="!userprofile\desktop\zhang\csv.txt";
run;

filename t ("!userprofile\desktop\zhang\factors.txt","!userprofile\desktop\zhang\testingportfolios.txt");

data factorstestingportfolios;
	infile t truncover;
	input url $32767.;
	file=reverse(substr(reverse(url),1,find(reverse(url),"/")-1));
run;

option dlcreatedir;
libname c "!userprofile\desktop\zhang\csv\";
libname c;
option dlcreatedir;

%macro csv;

%let zhang=http://global-q.org/;

proc sql noprint;
	select n(url) into :i from factorstestingportfolios;
quit;

%do j=1 %to &i.;

proc sql noprint;
	select url,file into :url,:file from factorstestingportfolios(firstobs=&j.);
run;

filename c "!userprofile\desktop\zhang\csv\&file.";

proc http url="&zhang.&url." out=c;
run;

%end;

%mend;

%csv;

proc printto;
run;
