resetline;

proc printto log="!userprofile\desktop\devour\kroencke.txt";
run;

option dlcreatedir;
libname k "!userprofile\desktop\devour\kroencke\";
option nodlcreatedir;

filename x "!userprofile\desktop\devour\kroencke\_kroencke.xls";

proc http url="https://drive.google.com/uc?id=1AdOENh6SFIfzaA724iUosfBvl7M8xI8Z" out=x;
run;

proc import file=x dbms=xls replace out=k.annual_frequency;
	sheet="annual_frequency";
run;

proc import file=x dbms=xls replace out=k.quarterly_frequency;
	sheet="quarterly_frequency";
run;

proc import file=x dbms=xls replace out=explanations;
	sheet="explanations";
	getnames=no;
run;

data _null_;
	set explanations;
	file "!userprofile\desktop\devour\kroencke\_explanations.txt";
	put a;
run;

proc delete;
run;

libname k;

proc printto;
run;
