resetline;

proc printto log="!userprofile\desktop\french\sas7bdat2.txt";
run;

libname s "!userprofile\desktop\french\sas7bdat\";
option dlcreatedir;
libname s2 "!userprofile\desktop\french\sas7bdat2\";
option nodlcreatedir;

data zip;
	infile "!userprofile\desktop\french\data_library.txt" truncover;
	input zip $32767.;
run;

%macro sas7bdat2;

proc sql noprint;
	select n(zip) into :n trimmed from zip;
quit;

%do i=1 %to &n.;

data s2.d%sysfunc(putn(&i.,z3.));
	set s.d%sysfunc(putn(&i.,z3.));
	if date<lag(date) then i+1;
	if i then delete;
	drop i;
run;

%end;

%mend;

%sas7bdat2;

proc printto;
run;
