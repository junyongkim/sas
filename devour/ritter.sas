resetline;

proc printto log="!userprofile\desktop\devour\ritter.txt";
run;

option dlcreatedir;
libname r "!userprofile\desktop\devour\ritter\";
option nodlcreatedir;
filename x "!userprofile\desktop\devour\ritter\_IPOALL_2019.xlsx";

proc http url="https://site.warrington.ufl.edu/ritter/files/2020/01/IPOALL_2019.xlsx" out=x;
run;

proc import file=x dbms=xlsx replace out=r.ipoall_2019;
	sheet="ipoall";
	getnames=no;
run;

data r.ipoall_2019;
	set r.ipoall_2019;
	month=input(a,16.);
	year=input(b,16.);
	iporeturn=input(c,16.);
	grossnumber=input(d,16.);
	netnumber=input(e,16.);
	abovemidpercent=input(f,16.);
	label month="Month"
		year="Year"
		iporeturn="Average first-day return on net IPOs"
		grossnumber="Gross number of IPOs"
		netnumber="Net number of IPOs"
		abovemidpercent="Percentage of IPOs that priced above the midpoints";
	keep month year iporeturn grossnumber netnumber abovemidpercent;
	if sum(of _all_);
run;

libname r;
filename x;

proc printto;
run;
