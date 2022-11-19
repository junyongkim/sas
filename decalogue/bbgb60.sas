proc sql;
	create table bbgbstate as
		select intnx("month",input(put(date,6.),yymmn6.),0,"end") as date,
			rm,ty,pe,vs,. as ncf,. as ndr
		from bbgbdata
		outer union corresponding
		select intnx("month",input(put(date,6.),yymmn6.),0,"end") as date,
			rm,ty,pe,vs
		from bbgbextend(where=(200201<=date<=202112))
		order by date;
quit;

proc iml;
	use bbgbstate;
		read all var _all_ into all[colname=c];
	close bbgbstate;
	t=nrow(all);
	x=j(t-1,1)||all[1:t-1,2:5];
	y=all[2:t,2:5];
	b=inv(x`*x)*x`*y;
	p=x*b;
	e=y-p;
	i={1,0,0,0};
	r=0.95**(1/12);
	g=b`[,2:5];
	l=r*g*inv(i(4)-r*g);
	n=e*(i`+i`*l//i`*l)`;
	all[2:t,6:7]=n[,1]||-n[,2];
	create bbgbstate from all[colname=c];
		append from all;
	close bbgbstate;
quit;

rsubmit;

proc upload;
run;

proc sql;
	create table bbgb60 as
		select permno,a.date,
			log(1+ret) as ret,b.ncf+b.ndr as ncfndr,b.ncf,b.ndr,c.ncf as ncf1,c.ndr as ndr1
		from crsp.msf(where=(ret>.z)) a
			join bbgbstate(where=(date>="31jan1929"d)) b
				on intnx("month",a.date,0,"end")=b.date
			join bbgbstate(where=(date>="28feb1929"d)) c
				on intnx("month",a.date,-1,"end")=c.date
		order by permno,date;
quit;

proc sql undo_policy=none;
	create table bbgb60 as
		select a.date as i,b.*
		from bbgb60 a
			join bbgb60 b
				on a.permno=b.permno and b.date<=a.date<=intnx("month",b.date,59,"end")
		group by a.permno,i
		having n(ret)>=24
		order by permno,i;
quit;

proc printto log="/dev/null";
run;

proc corr cov nocorr noprint out=bbgb60;
	by permno i;
	var ret ncfndr ncf ncf1 ndr ndr1;
run;

proc printto;
run;

proc sql undo_policy=none;
	create table bbgb60 as
		select a.permno+0 as permno,
			a.i+0 as date,
			(a.ncf+a.ncf1)/b.ncfndr as bb60,
			(a.ndr+a.ndr1)/b.ncfndr as gb60
		from bbgb60(where=(_name_="ret")) a
			join bbgb60(where=(_name_="ncfndr")) b
				on a.permno=b.permno and a.i=b.i
		order by permno,date;
quit;

endrsubmit;
