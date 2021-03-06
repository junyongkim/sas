rsubmit;

proc sql;
	create table ivol as
		select permno+0 as permno,
			max(a.date) as date,
			ret-rf as retrf,mktrf,smb,hml
		from crsp.dsf a
			full join ff.factors_daily b on a.date=b.date
		group by permno,intnx("month",a.date,0)
		having n(ret)>17
		order by permno,date;
quit;

proc printto log="/dev/null";
run;

proc reg noprint outest=ivol(keep=permno date _rmse_ rename=(_rmse_=ivol) where=(ivol>0));
	by permno date;
	model retrf=mktrf smb hml;
quit;

proc printto;
run;

proc datasets nolist;
	modify ivol;
	attrib _all_ label=" ";
run;

endrsubmit;
