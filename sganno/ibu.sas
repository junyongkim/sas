filename z "%sysfunc(getoption(work))\z";

proc http url="https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/f-f_research_data_factors_csv.zip" out=z;
run;

filename z zip "%sysfunc(getoption(work))\z";

data ibu;
	infile z(F-F_Research_Data_Factors.CSV) dsd truncover;
	input date mkt_rf smb hml rf;
	mkt1=lag(mkt_rf+rf);
	if 100000<date<999999;
run;

proc expand method=none out=ibu;
	id date;
	convert mkt1/tout=(/100 +1 nomiss movprod 24 -1 *100 trimleft 23);
run;

data ibu;
	set ibu;
	if mkt1>. then ib=mkt1<0;
	if mkt_rf>. then iu=mkt_rf>0;
	ibd=ib*(1-iu);
	ibu=ib*iu;
	if ibd^=lag(ibd) or ibu^=lag(ibu) then i+1;
run;

proc means noprint;
	where ibd or ibu;
	by i ibd ibu;
	var date;
	output out=ibu min=mind max=maxd;
run;

data ibu;
	set ibu;
	display="fill";
	if ibd then fillcolor="red ";
	else fillcolor="lime";
	filltransparency=0.8;
	x1space="datavalue";
	y1space="wallpercent";
	function="polygon ";
	x1=input(put(mind,6.),yymmn6.);
	y1=0;
	output;
	function="polycont";
	y1=100;
	output;
	x1=intnx("mon",input(put(mind,6.),yymmn6.),1);
	output;
	y1=0;
	output;
	keep d: f: x: y:;
run;
