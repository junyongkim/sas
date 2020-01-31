data dictionary;
	i="d"||put(_n_,z3.);
	infile 'dir /b %userprofile%\desktop\hxz\csv\' pipe truncover;
	input j $32767.;
run;

proc export replace file="!userprofile\desktop\hxz\dictionary.txt";
	putnames=no;
run;
