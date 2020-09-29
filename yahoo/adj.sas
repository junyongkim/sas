option nonotes;

data adj;
	input @@;
	_infile_=resolve(_infile_);
	input ticker $ @@;
	i=compress("https://query1.finance.yahoo.com/v7/finance/download/"||
		ticker||
		"?period1="||
		dhms(intnx("month",&j.,-1),0,0,0)-3653*24*60*60||
		'&period2='||
		dhms(&k.,23,59,59)-3653*24*60*60||
		'&interval=1mo');
	infile j url filevar=i firstobs=2 dsd truncover end=k;
	do until(k);
		input date yymmdd10. +1 open hi lo close adj vol;
		output;
	end;
cards;
^gspc ^irx &i.
;

option notes;
