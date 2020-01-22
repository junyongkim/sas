resetline;

proc printto log="!userprofile\desktop\french\zip.txt";
run;

%let french=https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/;

data data_library;
	infile "!userprofile\desktop\french\data_library.txt" length=l;
	input file $varying32767. l;
run;

proc sql noprint;
	select file into :file separated by " " from data_library;
quit;

option dlcreatedir;
libname z "!userprofile\desktop\french\zip\";
libname z;
option nodlcreatedir;

%macro zip;

%do i=1 %to %sysfunc(countw(&file.," "));

filename z "!userprofile\desktop\french\zip\%scan(&file.,&i.,' ')";

proc http url="&french.ftp/%scan(&file.,&i.,' ')" out=z;
run;

%end;

%mend;

%zip;

proc printto;
run;
