resetline;

proc printto log="!userprofile\desktop\devour\moskowitz.txt";
run;

option dlcreatedir;
libname m "!userprofile\desktop\devour\moskowitz\";
option nodlcreatedir;

filename h url "https://faculty.som.yale.edu/tobymoskowitz/research/data/";

data url;
	infile h truncover;
	input url $32767.;
	if count(url,"xls");
	url=scan(url,2,'"');
	file=reverse(scan(reverse(url),1,"/"));
run;

%macro moskowitz;

proc sql noprint;
	select url,file into :url separated by "~",:file separated by "~" from url;
quit;

%do i=1 %to %sysfunc(countw(&url.,~));

filename x "!userprofile\desktop\devour\moskowitz\_%scan(&file.,&i.,~)";

proc http url="%scan(&url.,&i.,~)" out=x;
run;

%end;

proc import file="!userprofile\desktop\devour\moskowitz\_%scan(&file.,1,~)" dbms=xlsx replace out=m.%scan(%scan(&file.,1,~),1,.)a;
	range="amp vme factors$a11:0";
run;

proc import file="!userprofile\desktop\devour\moskowitz\_%scan(&file.,1,~)" dbms=xlsx replace out=m.%scan(%scan(&file.,1,~),1,.)f;
	sheet="fama french monthly";
run;

proc import file="!userprofile\desktop\devour\moskowitz\_%scan(&file.,2,~)" dbms=xlsx replace out=m.%scan(%scan(&file.,2,~),1,.);
	range="amp vme test assets$a7:0";
run;

proc import file="!userprofile\desktop\devour\moskowitz\_%scan(&file.,3,~)" dbms=xlsx replace out=m.%scan(%scan(&file.,3,~),1,.);
	range="sheet1$a7:0";
run;

proc import file="!userprofile\desktop\devour\moskowitz\_%scan(&file.,4,~)" dbms=xlsx replace out=m.%scan(%scan(&file.,4,~),1,.);
run;

%mend;

%moskowitz;

libname m;
filename h x;

proc printto;
run;
