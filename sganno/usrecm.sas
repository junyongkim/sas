filename c url "https://fred.stlouisfed.org/graph/fredgraph.csv?id=usrecm";

data usrecm;
	infile c dsd truncover firstobs=2;
	input date yymmdd10. +1 usrecm;
	if usrecm^=lag(usrecm) then i+1;
run;

proc means noprint;
	where usrecm;
	by i;
	var date;
	output out=usrecm min=peak max=trough;
run;

data usrecm;
	set usrecm;
	display="fill";
	fillcolor="black";
	filltransparency=0.9;
	x1space="datavalue";
	y1space="wallpaper";
	function="polygon ";
	x1=peak;
	y1=0;
	output;
	function="polycont";
	y1=100;
	output;
	x1=trough;
	output;
	y1=0;
	output;
	keep d: f: x: y:;
run;
