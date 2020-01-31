%let hxz=http://global-q.org/;
filename h url "&hxz.factors.html";

data factors;
	infile h truncover lrecl=327670 column=c length=l;
	do until(c>l);
		input url :$32767. @;
		if find(url,".csv") then do;
			url=scan(url,2,'"');
			output;
		end;
	end;
run;

proc export replace file="!userprofile\desktop\hxz\factors.txt";
	putnames=no;
run;
