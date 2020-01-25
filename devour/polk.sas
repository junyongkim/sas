resetline;

proc printto log="!userprofile\desktop\devour\polk.txt";
run;

option dlcreatedir;
libname p "!userprofile\desktop\devour\polk\";
option nodlcreatedir;

filename x "!userprofile\desktop\devour\polk\_CGPTdata.xlsx";

proc http url="http://personal.lse.ac.uk/polk/research/CGPTdata.xlsx" out=x;
run;

proc import file=x dbms=xlsx replace out=p.cgptdata;
run;

filename x "!userprofile\desktop\devour\polk\_GorGdataarchive.xls";

proc http url="http://personal.lse.ac.uk/polk/research/GorGdataarchive.xls" out=x;
run;

proc import file=x dbms=xls replace out=p.gorgdataarchive;
	namerow=3;
	startrow=4;
run;

libname p;
filename x;

proc printto;
run;
