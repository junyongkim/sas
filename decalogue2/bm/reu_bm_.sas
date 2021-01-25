libname d "!userprofile\desktop\sas\decalogue2\bm";
rsubmit;

%macro reu_bm_(n,putn);

proc sql;
	create table i as select
	date+0 as date format=yymmddn8.,
	ret format=best8.,
	val,
	case when bm>-1 then put(floor(bm*&n/100),&putn) when bm=-1 then "n" else
		"x" end as i from
	reu_bm
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
	weight val;
	output mean= out=i;
run;

proc transpose prefix=r out=i;
	by date;
	id i;
	var ret;
run;

data d.reu_bm_%sysfunc(putn(&n,z3.));
	merge i(keep=date rx rn) i(drop=rx rn _name_) j(keep=date sx sn)
		j(drop=sx sn _name_);
	by date;
run;

proc download;
run;

%mend;

endrsubmit;