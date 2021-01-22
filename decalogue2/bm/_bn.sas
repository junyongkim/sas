filename i "%sysfunc(getoption(work))\i";

proc http url="https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/
Historical_BE_Data.zip" out=i;
run;

filename i zip "%sysfunc(getoption(work))\i";

data i;
	infile i(DFF_BE_With_Nonindust.txt);
	input permno first last be1926-be2001;
run;

proc transpose out=i;
	by permno first last;
run;

proc sql undo_policy=none;
	create table i as select
	permno,
	input(substr(_name_,3),4.) as year,
	col1 as be from
	i where first<=input(substr(_name_,3),4.)<=last & col1>-99.99;
quit;

rsubmit;

proc upload;
run;

proc sql undo_policy=none;
	create table d.bm as select
	coalesce(lpermno,i.permno) as lpermno,
	coalesce(datadate,mdy(5,31,year)) as datadate,
	coalesce(bm,be/val1*1000) as bm from
	d.bm full join
	i on lpermno=permno & year(intnx("year.6",datadate,1))=year full join
	d.ret(where=(month(date)=6)) j on i.permno=j.permno & year=year(date)
	having bm>.;
quit;

endrsubmit;
