/*************************************************
bbgbdata
downloads campbell vuolteenaho original data
*************************************************/
filename a "%sysfunc(getoption(work))\a";

/*************************************************
backed up data because aea unavailable
*************************************************/
proc http out=a url="https://raw.githubusercontent.com/junyongkim/sas_old/master/191211bbgbdata/191226BBGBdata.xls";
run;

proc import file=a dbms=xls out=bbgbdata replace;
	sheet="monthly";
run;

proc transpose out=bbgbdata;
	by date;
	var _all_;
run;

data bbgbdata;
	set bbgbdata;
	_name_=lowcase(_name_);
	if _name_="r_me" then _name_="rm";
	if _name_="et_r_me_" then _name_="erm";
	if _name_="_n_dr" then _name_="ndr";
	if _name_="n_cf" then _name_="ncf";
	if _name_="rrf" then _name_="rf";
	if substr(_name_,1,2)="ff" then _name_="f"||substr(_name_,4,1)||substr(_name_,7,1);
	if substr(_name_,1,4)="risk" then _name_="k"||put(input(substr(_name_,5,2),2.),z2.);
	if col1^="NaN" then col2=input(col1,16.);
run;

proc transpose data=bbgbdata(drop=_label_ rename=(date=d)) out=bbgbdata(drop=d _name_);
	by d;
	var col2;
run;

quit;
