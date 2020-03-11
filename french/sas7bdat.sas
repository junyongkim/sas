resetline;

proc printto log="!userprofile\desktop\french\sas7bdat.txt";
run;

data zip;
	infile "!userprofile\desktop\french\data_library.txt" truncover;
	input zip $32767.;
run;

libname a "!userprofile\desktop\french\sas7bda\";
option dlcreatedir;
libname t "!userprofile\desktop\french\sas7bdat\";
option nodlcreatedir;

%macro sas7bdat;

proc sql noprint;
	select n(zip) into :n trimmed from zip;
quit;

%do i=1 %to &n.;

data t.d%sysfunc(putn(&i.,z3.));
	set a.d%sysfunc(putn(&i.,z3.));
	if date<lag(date) then i+1;
	if i then delete;
	drop i;
run;

%end;

%mend;

%sas7bdat;

proc printto;
run;
