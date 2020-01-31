data dictionary;
	i="d"||put(_n_,z3.);
	infile "!userprofile\desktop\french\data_library.txt" truncover;
	input j $32767.;
	j=reverse(substr(reverse(strip(j)),9));
run;

proc export replace file="!userprofile\desktop\french\dictionary.txt";
	putnames=no;
run;
