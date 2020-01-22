resetline;

proc printto log="!userprofile\desktop\hxz\sas7bdat.txt";
run;

data csv;
	infile 'dir /b %userprofile%\desktop\hxz\csv\' pipe truncover length=l;
	input file $varying32767. l;
run;

proc sql noprint;
	select file into :file separated by " " from csv;
quit;

option dlcreatedir;
libname s "!userprofile\desktop\hxz\sas7bdat\";
option nodlcreatedir;

%macro sas7bdat;

%do i=1 %to %sysfunc(countw(&file.," "));

proc import file="!userprofile\desktop\hxz\csv\%scan(&file.,&i.,' ')" replace out=s.d%sysfunc(putn(&i.,z3.));
run;

%end;

%mend;

%sas7bdat;

proc printto;
run;
