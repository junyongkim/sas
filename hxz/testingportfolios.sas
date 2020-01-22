%let hxz=http://global-q.org/;
filename h url "&hxz.testingportfolios.html";

data testingportfolios;
	infile h lrecl=327670 length=l column=c;
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
200120 two errors
1 re1 3x5 w2w incorrectly by sue6 3x5 w2w (exists)
2 sv1 10 w2w incorrectly by tv1 10 w2w (absents)
*************************************************/

data testingportfolios;
	set testingportfolios;
	if _n_=57 then file=tranwrd(file,"sue_6","re_1");
	if _n_=561 then delete;
run;

proc export replace file="!userprofile\desktop\hxz\testingportfolios.txt";
	putnames=no;
run;
