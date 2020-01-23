resetline;

option dlcreatedir;
libname d "!userprofile\desktop\devour\shiller\";
option nodlcreatedir;

proc printto log="!userprofile\desktop\devour\shiller.txt";
run;

%macro shiller(name);

filename x "!userprofile\desktop\devour\shiller\_&name..xls";

proc http url="http://www.econ.yale.edu/~shiller/data/&name..xls" out=x;
run;

proc import file=x dbms=xls replace out=d.&name.;
	sheet="data";
	getnames=no;
run;

proc transpose data=d.&name.(obs=8) out=name;
	var _all_;
run;

data name;
	set name;
	b=length(compress(col8));
run;

proc transpose data=d.&name.(firstobs=9) out=d.&name.;
	where a;
	by a;
	var _all_;
run;

data name;
	set name;
	if _n_=1 then name=compress(col8);
	%if &name.=ie_data %then %do;
	else if _n_=14 then name="_14";
	else if _n_=16 then name="_16";
	%end;
	%else %if &name.=ie_data_with_TRCAPE %then %do;
	else if _n_=15 then name="_15";
	%end;
	else name=compress(cats(of col:));
	name=translate(name,"___",'&./');
	if length(name)>32 then name=substr(name,1,32);
	keep _name_ name;
run;

proc sql;
	create table d.&name. as
	select a.*,b.name,input(col1,16.) as col2
	from d.&name. a join name b
	on a._name_=b._name_
	order by a,_name_;
quit;

proc transpose out=d.&name.(drop=a _:);
	by a;
	id name;
	var col2;
run;

proc delete data=name;
run;

%mend;

%shiller(ie_data);
%shiller(ie_data_with_TRCAPE);

libname d;
filename x;

proc printto;
run;
