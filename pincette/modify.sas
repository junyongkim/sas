libname m "!userprofile\desktop\pincette\modify\";

%macro modify01(data,put,input);

data m.&data.(drop=d j);
	format DATE;
	set i.&data.(rename=(date=d));
	date=input(put(input(d,mmddyy10.),&put.),&input.);
	array i(*) _numeric_;
	do j=2 to dim(i);
		i(j)=i(j)*100;
	end;
run;

proc datasets lib=m nolist;
	modify &data.;
	attrib _all_ label="";
	attrib _all_ format=;
quit;

%mend;

%modify01(babefd_bab,yymmddn8.,8.)
%modify01(babefd_mkt,yymmddn8.,8.)
%modify01(babefd_smb,yymmddn8.,8.)
%modify01(babefd_hml,yymmddn8.,8.)
%modify01(babefd_hmd,yymmddn8.,8.)
%modify01(babefd_umd,yymmddn8.,8.)
%modify01(babefd_rf,yymmddn8.,8.)
%modify01(babefm_bab,yymmn6.,6.)
%modify01(babefm_mkt,yymmn6.,6.)
%modify01(babefm_smb,yymmn6.,6.)
%modify01(babefm_hml,yymmn6.,6.)
%modify01(babefm_hmd,yymmn6.,6.)
%modify01(babefm_umd,yymmn6.,6.)
%modify01(babefm_me,yymmn6.,6.)
%modify01(babefm_rf,yymmn6.,6.)
%modify01(qmjfd,yymmddn8.,8.)
%modify01(qmjfm,yymmn6.,6.)

%macro modify02(data,rename);

data m.&data.(drop=j);
	set i.&data.&rename.;
	array i(*) _numeric_;
	do j=2 to dim(i);
		i(j)=i(j)*100;
	end;
run;

%mend;

%modify02(m4,(rename=(yyyymm=DATE)))
%modify02(m4d)

%macro modify03(data);

proc transpose data=i.&data. out=m.&data.(drop=_label_ where=(_name_^="dates"));
	by dates;
	var _all_;
run;

data m.&data.(drop=dates col1);
	set m.&data.;
	DATE=input(put(dates,yymmddn8.),8.);
	if col1^="NaN" then col=col1+0;
run;

proc transpose out=m.&data.(drop=_name_);
	by date;
	var col;
run;

%mend;

%modify03(fts_dummies)

%macro modify04(data,drop,date);

data m.&data.(drop=&drop.);
	format DATE;
	set i.&data.;
	date=&date.;
run;

proc datasets lib=m nolist;
	modify &data.;
	attrib _all_ label="";
	attrib _all_ format=;
quit;

%mend;

%modify04(consumption_data_2018_a,year,year)
%modify04(consumption_data_2018_q,time year quarter,100*year+3*quarter)

%macro modify05;

data m.cay_current(drop=d cay_:);
	format date;
	set i.cay_current(rename=(date=d));
	date=100*year(d)+month(d);
	array i(*) _numeric_;
	cay=i(dim(i));
run;

%mend;

%modify05

%macro modify06(data,date);

data m.&data.(keep=date &data.);
	set i.&data.;
	array i(2) _numeric_;
	date=&date.;
	&data.=i(2);
run;

%mend;

%modify06(bexmra,int(i(1)/100))
%modify06(bexdra,i(1))
%modify06(bexmeu,int(i(1)/100))
%modify06(bexdeu,i(1))

%modify02(dmrs_hedge_portfolios_monthly)
%modify02(dmrs_hedge_portfolios_daily)
%modify02(dmrs_factor_portfolios_monthly)
%modify02(dmrs_factor_portfolios_daily)
%modify04(dhs_factors,,date)

%modify04(umo_daily,,date)
%modify04(umo_monthly,year month,100*year+month)
