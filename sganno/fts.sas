filename c url "https://fred.stlouisfed.org/graph/fredgraph.csv?id=bamlcc0a1aaatriv";

data rb;
	infile c firstobs=2 dsd truncover;
	input date yymmdd10. +1 rb;
	if rb then rb=rb/lag(rb)-1;
	if rb;
	sb=lag(rb);
run;

proc expand out=rb;
	id date;
	convert sb/tout=(movstd 22 trimleft 22);
run;

filename c url "https://fred.stlouisfed.org/graph/fredgraph.csv?id=will5000indfc";

data rs;
	infile c firstobs=2 dsd truncover;
	input date yymmdd10. +1 rs;
	if rs then rs=rs/lag(rs)-1;
	if rs;
	ss=lag(rs);
run;

proc expand out=rs;
	id date;
	convert ss/tout=(movstd 22 trimleft 22);
run;

data fts;
	merge rb rs;
	by date;
	if nmiss(of _all_) then delete;
	fts=(rb>1.5*sb)*(rs<-1.5*ss);
	ftr=(rb<-1.5*sb)*(rs>1.5*ss);
run;

data fts;
	set fts;
	where fts or ftr;
	display="fill";
	if fts then fillcolor="red ";
	else fillcolor="lime";
	filltransparency=0.9;
	x1space="datavalue";
	y1space="wallpercent";
	function="polygon ";
	x1=date-3;
	y1=0;
	output;
	function="polycont";
	y1=100;
	output;
	x1=date+3;
	output;
	y1=0;
	output;
	keep display fill: function x1: y1:;
run;
