resetline;

proc printto log="!userprofile\desktop\hxz\sas7bdat.txt";
run;

filename t ("!userprofile\desktop\hxz\factors.txt","!userprofile\desktop\hxz\testingportfolios.txt");

data csv;
	infile t truncover;
	input file $32767.;
	file=reverse(substr(reverse(file),1,find(reverse(file),"/")-1));
run;

option dlcreatedir;
libname s "!userprofile\desktop\hxz\sas7bdat\";
option nodlcreatedir;

%macro sas7bdat;

proc sql noprint;
	select file into :file separated by " " from csv;
quit;

%do i=1 %to %sysfunc(countw(&file.,%str( )));

proc import file="!userprofile\desktop\hxz\csv\%scan(&file.,&i.,%str( ))" replace out=s.d%sysfunc(putn(&i.,z3.));
run;

%end;

%mend;

%sas7bdat;

proc printto;
run;
