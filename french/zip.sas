resetline;

proc printto log="!userprofile\desktop\french\zip.txt";
run;

data data_library;
	infile "!userprofile\desktop\french\data_library.txt" truncover;
	input file $32767.;
run;

option dlcreatedir;
libname z "!userprofile\desktop\french\zip\";
libname z;
option nodlcreatedir;

%macro zip;

%let french=https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/;

proc sql noprint;
	select file into :file separated by " " from data_library order by monotonic();
quit;

%do i=1 %to %sysfunc(countw(&file.,%str( )));

filename z "!userprofile\desktop\french\zip\%scan(&file.,&i.,%str( ))";

proc http url="&french.ftp/%scan(&file.,&i.,%str( ))" out=z;
run;

%end;

%mend;

%zip;

proc printto;
run;
