data dictionary;
	i="d"||put(_n_,z3.);
	infile 'dir /b %userprofile%\desktop\french\csv\' pipe truncover length=l;
	input j $varying32767. l;
run;

proc export replace file="!userprofile\desktop\french\dictionary.txt";
	putnames=no;
run;
