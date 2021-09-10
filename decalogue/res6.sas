rsubmit;

proc sql;
	create table res6 as
		select permno,date,ret
		from crsp.msf where ret>.z;
quit;

proc sql undo_policy=none;
	create table res6 as
		select i.permno,i.date,j.date as i,j.ret-rf as j,mktrf,smb,hml
		from res6 i
		join res6 j on i.permno=j.permno &
			intnx("month",j.date,-6)<=i.date<intnx("month",j.date,30)
		join ff.factors_monthly on j.date=dateff
		group by i.permno,i.date having n(i)=36 order by permno,date;
quit;

proc reg noprint;
	by permno date;
	model j=mktrf smb hml;
	output r=k out=res6;
quit;

proc sql undo_policy=none;
	create table res6 as
		select permno,date,sum(k)/std(k) as res6
		from res6 where i<=date<intnx("month",i,6)
		group by permno,date order by permno,date;
quit;

endrsubmit;
