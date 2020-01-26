resetline;

proc printto log="!userprofile\desktop\devour\koijen.txt";
run;

option dlcreatedir;
libname k "!userprofile\desktop\devour\koijen\";
option nodlcreatedir;

filename x "!userprofile\desktop\devour\koijen\_strategy_returns_-_global.xlsx";

proc http url="http://www.koijen.net/uploads/3/4/4/7/34470013/strategy_returns_-_global.xlsx" out=x;
run;

proc import file=x dbms=xlsx replace out=k.xsec_carry1m;
	sheet="XSEC - Carry1m";
run;

proc import file=x dbms=xlsx replace out=k.xsec_carry1_12;
	sheet="XSEC - Carry1-12";
run;

proc import file=x dbms=xlsx replace out=k.timing_carry1m_to_0;
	sheet="TIMING - Carry1m to 0";
run;

proc import file=x dbms=xlsx replace out=k.timing_carry1m_to_mean;
	sheet="TIMING - Carry1m to mean";
run;

libname k;
filename x;

proc printto;
run;
