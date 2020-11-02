/*-----------------------------------------------------------------------------+
| yahooann.bat, yahooann.sas                                                   |
| junyong                                                                      |
| 201101                                                                       |
+-----------------------------------------------------------------------------*/
data i;
	input @@;
	_infile_=resolve(_infile_);
	input t :$16. @@;
	f=cats("https://query1.finance.yahoo.com/v7/finance/download/",t,
		"?period1=",dhms("1jan1901"d,0,0,0)-315619200,
		'&period2=',dhms("31dec2100"d,23,59,59)-315619200,
		'&interval=1mo');
	infile _ url filevar=f firstobs=2 dsd end=e;
	do until(e);
		input @;
		if index(_infile_,"-12-")>index(_infile_,"null") then do;
			input d yymmdd10. +1 (4*o)(:$1.) r;
			if t="^irx" then r=lag(r);
			else r=ifn(t=lag(t),r/lag(r)*100-100,.);
			output;
		end;
		else input;
	end;
cards;
^gspc ^irx %sysget(t)
;

proc sort;
	by d t;
run;

proc transpose out=o(drop=_name_ rename=(d=date _gspc=sp500 _irx=tb13));
	where r>.;
	by d;
	id t;
	var r;
	format d year. r 8.2;
run;

proc export replace file="!userprofile\desktop\%sysget(f).csv";
run;
