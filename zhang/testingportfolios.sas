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
200822 3 errors
1 cim_12 3x5 w incorrectly by cm_12 3x5 w (absent)
2 p52w_12 a incorrectly by p52w_6 a (absent)
3 p52w_12 q incorrectly by p52w_6 q (absent)
*************************************************/
data testingportfolios;
	set testingportfolios;
	if _n_=68 then delete;
	else if _n_=245 then delete;
	else if _n_=246 then delete;
run;

proc export replace file="!userprofile\desktop\zhang\testingportfolios.txt";
	putnames=no;
run;
