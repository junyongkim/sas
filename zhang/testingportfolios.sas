%let zhang=http://global-q.org/;
filename h url "&zhang.testingportfolios.html";

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

/*************************************************
200219 one error
1 ia 3x5 q incorrectly by ep 3x5 q (absents)
*************************************************/

data testingportfolios;
	set testingportfolios;
	if _n_=215 then delete;
run;

proc export replace file="!userprofile\desktop\zhang\testingportfolios.txt";
	putnames=no;
run;
