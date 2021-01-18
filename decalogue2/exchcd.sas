rsubmit;

data d.exchcd(drop=shrcd);
	set crsp.msenames(keep=permno namedt nameendt shrcd exchcd
		where=(shrcd in (10,11)));
	by permno;
	if last.permno then nameendt=intnx("month",nameendt,0,"end");
run;

endrsubmit;
