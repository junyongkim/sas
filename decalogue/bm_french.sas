filename be "%sysfunc(getoption(work))\be.zip";

proc http url="https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/Historical_BE_Data.zip" out=be;
run;

filename be zip "%sysfunc(getoption(work))\be.zip";

data be_french;
	infile be(DFF_BE_With_Nonindust.txt);
	input permno year yearend be1926-be2001;
run;

proc transpose out=be_french;
	by permno year yearend;
	var be:;
run;

data be_french(drop=yearend _name_ rename=(col1=be));
	set be_french(where=(year<=input(substr(_name_,3),4.)<=yearend and col1>-99.99));
	by permno _name_;
	year=substr(_name_,3);
run;

rsubmit;

proc upload;
run;

proc sql;
	create table bm as
		select coalesce(lpermno,a.permno) as lpermno,
			coalesce(datadate,mdy(5,31,year)) as datadate,
			coalesce(bm,be/size1/(1+ret)*1000) as bm
		from bm
			full join be_french a on lpermno=permno and year(intnx("year.6",datadate,0))=year-1
			full join ret(where=(month(date)=6)) b on a.permno=b.permno and year=year(date)
		having bm>.
		order by lpermno,datadate;
quit;

endrsubmit;
