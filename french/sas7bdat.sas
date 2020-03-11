resetline;

proc printto log="!userprofile\desktop\french\sas7bdat.txt";
run;

data csv;
	infile "!userprofile\desktop\french\data_library.txt" truncover;
	input csv $32767.;
	csv=reverse(substr(reverse(strip(csv)),9))||".csv";
run;

data csv;
	set csv;
	c="!userprofile\desktop\french\csv\"||csv;
	infile i filevar=c truncover end=e;
	do firstobs=1 by 1 until(e);
		input j $;
		if substr(j,1,2)="19" then leave;
		drop j;
	end;
	if find(csv,"Breakpoints")=0 then firstobs=firstobs-1;
	output;
run;

option dlcreatedir;
libname s "!userprofile\desktop\french\sas7bdat\";
option nodlcreatedir;
filename t temp;

%macro sas7bdat;

proc sql noprint;
	select csv,firstobs into :csv separated by " ",:firstobs separated by " " from csv;
quit;

%do i=1 %to %sysfunc(countw(&csv.,%str( )));

filename c "!userprofile\desktop\french\csv\%scan(&csv.,&i.,%str( ))";

data _null_;
	infile c firstobs=%scan(&firstobs.,&i.,%str( ));
	file t;
	input;
	put _infile_;
run;

proc import file=t dbms=csv replace out=s.d%sysfunc(putn(&i.,z3.))(rename=(var1=date));
	%if %sysfunc(find(%scan(&csv.,&i.," "),Breakpoints)) %then %do;getnames=no;%end;
run;

%end;

%mend;

%sas7bdat;

proc printto;
run;
