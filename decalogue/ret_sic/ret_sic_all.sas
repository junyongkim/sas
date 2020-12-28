libname i "!userprofile\desktop\sas\decalogue\ret_sic";

rsubmit;

proc summary;
	by date i j k;
	var ret;
	weight size1;
	output mean= out=i;
run;

proc sql undo_policy=none;
	create table i as
		select coalesce(date,l) as date,coalesce(i,m) as i,coalesce(j,n) as j,
			coalesce(k,o) as k,ret
		from i
			full join (select unique min(date) as l,i as m,j as n,k as o from i)
				on date=l & i=m & j=n
		order by date,i,j;
quit;

proc transpose out=i(drop=_name_);
	by date;
	id k i;
	var ret;
run;

proc download out=i.ret_sic_all;
run;

endrsubmit;
