proc expand data=max method=none out=max;
	id date;
	convert max=CUMAX/tout=(+1 cuprod);
	convert long=CULONG/tout=(+1 cuprod);
	convert rf=CURF/tout=(+1 cuprod);
run;

data max;
	set max;
	call symputx("l",cumax);
	call symputx("m",culong);
	call symputx("n",curf);
run;

filename i url "https://raw.githubusercontent.com/junyongkim/sas/master/sganno/usrecm.sas";
%include i;
ods results=off;
ods listing gpath="!userprofile\desktop\sas\yahoo\";
ods graphics/reset imagename="max" width=1024px height=768px noborder;

proc sgplot data=max sganno=usrecm(where=(&j.<=x1<=&k.)) noborder noautolegend;;
	series x=date y=cumax/curvelabel="%cmpres(%sysfunc(putn(&l.,8.)))" lineattrs=(pattern=solid color=blue);
	series x=date y=culong/curvelabel="%cmpres(%sysfunc(putn(&m.,8.)))" lineattrs=(pattern=solid color=red);
	series x=date y=curf/curvelabel="%cmpres(%sysfunc(putn(&n.,8.)))" lineattrs=(pattern=solid color=lime);
	xaxis label="Year" valuesformat=year4. values=(&j. to &k. by year5) valueshint;
	yaxis label="Value" valuesformat=best8. type=log;
quit;

ods graphics/reset;
ods listing gpath=none;
ods results=on;
