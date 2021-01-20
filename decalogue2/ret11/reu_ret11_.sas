libname d "!userprofile\desktop\sas\decalogue2\ret11";
rsubmit;

%macro reu_ret11_(n,putn);

proc sql;
	create table i as select
	date+0 as date format=yymmddn8.,
	ret format=best8.,
	value,
	case when ret11>-1 then put(floor(ret11*&n/100),&putn) else "x" end as i
		from
	reu_ret11
	order by date,i;
quit;

proc summary;
	by date i;
	var ret;
	output mean= out=j;
run;

proc transpose prefix=s out=j;
	by date;
	id i;
	var ret;
run;

proc summary data=i;
	by date i;
	var ret;
	weight value;
	output mean= out=i;
run;

proc transpose prefix=r out=i;
	by date;
	id i;
	var ret;
run;

data d.reu_ret11_%sysfunc(putn(&n,z3.));
	merge i(keep=date rx) i(drop=rx _name_) j(keep=date sx) j(drop=sx _name_);
	by date;
run;

proc download;
run;

%mend;

endrsubmit;
