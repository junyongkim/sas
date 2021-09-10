filename a "%sysfunc(pathname(work))\a";

proc http url="https://www.dropbox.com/s/6r36ly5pxk073vc/scrape_parsed.zip?dl=1" out=a;
run;

x bandizip x -y -o:"%sysfunc(pathname(work))" "%sysfunc(pathname(work))\a";

data sinkinson;
	infile "%sysfunc(pathname(work))\scrape_parsed.csv" firstobs=2 dsd truncover;
	input cik cusip $8. +1 shares rdate fdate filetype $8.;
run;

proc sql undo_policy=none;
	create table sinkinson as
		select cusip,rdate,sum(shares) as sinkinson
		from sinkinson
		group by cusip,rdate order by cusip,rdate;
quit;

rsubmit;

proc upload;
run;

proc sql undo_policy=none;
	create table sinkinson as
		select permno+0 as permno,
			date+0 as date,
			sinkinson/shrout/1000 as sinkinson
		from crsp.msf(where=(1999<=year(date)<=2017 and mod(month(date),3)=0 and shrout>.z)) a
			join sinkinson b on a.cusip=b.cusip and put(date,yymmn6.)=put(int(rdate/100),6.)
		order by permno,date;
quit;

endrsubmit;
