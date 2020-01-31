filename t ("!userprofile\desktop\hxz\factors.txt","!userprofile\desktop\hxz\testingportfolios.txt");

data dictionary;
	i="d"||put(_n_,z3.);
	infile t truncover;
	input j $32767.;
	j=scan(reverse(substr(reverse(j),1,find(reverse(j),"/")-1)),1,".");
run;

proc export replace file="!userprofile\desktop\hxz\dictionary.txt";
	putnames=no;
run;
