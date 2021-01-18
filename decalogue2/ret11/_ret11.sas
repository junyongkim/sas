rsubmit;

proc printto log="/dev/null";
run;

proc expand data=crsp.msf(keep=permno date ret rename=(ret=ret11)) method=none
	out=d.ret11(where=(ret11));
	by permno;
	id date;
	convert ret11/tout=(+1 nomiss movprod 11 trimleft 10);
run;

proc printto;
run;

endrsubmit;
