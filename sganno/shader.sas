%macro shader(data=,date=,var=,fillcolor=black,filltransparency=0.75,out=shader);

data &out.;
	set &data.;
	if &var.^=lag(&var.) then _1+1;
run;

proc means noprint;
	where &var.=1;
	by _1;
	var &date.;
	output min=_2 max=_3 out=&out.;
run;

data &out.;
    set &out.;
    display="fill";
	length fillcolor $8;
    fillcolor="&fillcolor.";
    filltransparency=&filltransparency.;
    function="polygon ";
    layer="front";
    x1=_2;
    x1space="datavalue";
    y1=0;
    y1space="wallpercent";
    output;
    function="polycont";
    y1=100;
    output;
    x1=_3;
    output;
    y1=0;
    output;
	keep display fillcolor filltransparency function layer x1 x1space y1 y1space;
run;

%mend;
