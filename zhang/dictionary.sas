filename t ("!userprofile\desktop\zhang\factors.txt","!userprofile\desktop\zhang\testingportfolios.txt");

data dictionary;
	i="d"||put(_n_,z4.);
	infile t truncover;
	input j $32767.;
	j=scan(reverse(substr(reverse(j),1,find(reverse(j),"/")-1)),1,".");
run;

proc export replace file="!userprofile\desktop\zhang\dictionary.txt";
	putnames=no;
run;
