resetline;

proc printto log="!userprofile\desktop\french\csv.txt";
run;

data zip;
	infile 'dir /b %userprofile%\desktop\french\zip\' pipe truncover length=l;
	input zip $varying32767. l;
run;

proc sql noprint;
	select zip into :zip separated by " " from zip;
quit;

option dlcreatedir;
libname c "!userprofile\desktop\french\csv\";
libname c;
option nodlcreatedir;

%macro csv;

%do i=1 %to %sysfunc(countw(&zip.," "));
filename z zip "!userprofile\desktop\french\zip\%scan(&zip.,&i.,' ')";
%let j=%sysfunc(dopen(z));
%let c=%sysfunc(dread(&j.,1));
%let k=%sysfunc(dclose(&j.));
filename c "!userprofile\desktop\french\csv\&c.";

data _null_;
	infile z("&c.");
	file c;
	input;
	put _infile_;
run;

%end;

%mend;

%csv;

proc printto;
run;
