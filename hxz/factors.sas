%let hxz=http://global-q.org/;
filename h url "&hxz.factors.html";

data factors;
	infile h length=l;
	input i $varying32767. l;
	if find(i,"uploads/1");
	do j=1 to 12;
		i=substr(i,find(i,"uploads/1",2));
		url=substr(i,1,find(i,".csv")+3);
		output;
	end;
	drop i j;
run;

proc export replace file="!userprofile\desktop\hxz\factors.txt";
	putnames=no;
run;
