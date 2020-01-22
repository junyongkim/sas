%let french=https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/;
filename h url "&french.data_library.html";

data data_library;
	infile h truncover;
	input file $32767.;
	if find(file,"CSV");
	file=substr(file,find(file,"ftp")+4,find(file,"zip")-find(file,"ftp")-1);
run;

proc export replace file="!userprofile\desktop\french\data_library.txt";
	putnames=no;
run;
