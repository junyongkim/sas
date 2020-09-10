rsubmit;

proc sql;
	create table beta60 as
		select permno,dateff,ret-rf as retrf,mktrf,smb,hml
		from crsp.msf(where=(ret>.z)) a
			join ff.factors_monthly b on intnx("month",a.date,0)=b.date
		order by permno,dateff;
quit;

proc sql;
	create table beta60 as
		select a.dateff as i,b.*
		from beta60 a
			join beta60 b
				on a.permno=b.permno and b.dateff<=a.dateff<=intnx("month",b.dateff,59,"end")
		group by a.permno,i
		having n(retrf)=60
		order by permno,i;
quit;

proc printto log="/dev/null";
run;

proc reg noprint outest=beta60;
	by permno i;
	model retrf=mktrf;
	model retrf=mktrf smb hml;
quit;

proc printto;
run;

proc sql;
	create table beta60 as
		select a.permno+0 as permno,
			date+0 as date,
			b.mktrf+0 as beta60,
			c.mktrf+0 as mktrf60,
			c.smb+0 as smb,
			c.hml+0 as hml
		from crsp.msf a
			join beta60(where=(_model_="MODEL1")) b on a.permno=b.permno and intnx("month",date,0,"end")=b.i
			join beta60(where=(_model_="MODEL2")) c on a.permno=c.permno and intnx("month",date,0,"end")=c.i
		order by permno,date;
quit;

endrsubmit;
