resetline;

proc printto log="!userprofile\desktop\devour\davis.txt";
run;

option dlcreatedir;
libname d "!userprofile\desktop\devour\davis\";
option nodlcreatedir;

filename z "%sysfunc(getoption(work))\z";

proc http url="https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/historical_be_data.zip" out=z;
run;

filename z zip "%sysfunc(getoption(work))\z";
filename t "!userprofile\desktop\devour\davis\_DFF_BE_With_Nonindust.txt";

data _null_;
	infile z(DFF_BE_With_Nonindust.txt);
	input;
	file t;
	put _infile_;
run;

data davis;
	infile z(DFF_BE_With_Nonindust.txt);
	input permno _1 _2 _1926-_2001;
run;

proc transpose out=davis;
	by permno _1 _2;
	var _1926-_2001;
run;

proc sql;
	create table d.davis as
	select permno,
		input(substr(_name_,2),4.) as fyear format=6. informat=6.,
		col1 as be format=18.4 informat=20.4
	from davis
	where _1<=calculated fyear<=_2
	order by permno,fyear;
quit;

libname _all_ clear;
filename _all_ clear;

proc printto;
run;
