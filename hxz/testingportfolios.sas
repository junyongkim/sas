%let hxz=http://global-q.org/;
filename h url "&hxz.testingportfolios.html";

data testingportfolios;
	infile h truncover lrecl=327670 column=c length=l;
	do i=1 by 1 until(c>l);
		input file ~:$32767. @;
		if find(file,".csv") then do;
			file=substr(scan(file,2,'"'),2);
			output;
		end;
	end;
	drop i;
run;

proc export replace file="!userprofile\desktop\hxz\testingportfolios.txt";
	putnames=no;
run;
