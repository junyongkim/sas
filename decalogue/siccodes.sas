%macro i(i);

filename i "%sysfunc(getoption(work))\i";

proc http url="http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/
Siccodes&i..zip" out=i;
run;

filename i zip "%sysfunc(getoption(work))\i";

data i;
	infile i(Siccodes&i..txt) truncover;
	input i 2. +1 j $5. +2 k $107.;
run;

data j;
	set i;
	where k;
	if i>lag(i) then l+1;
run;

proc sql undo_policy=none;
	create table j as
		select &i. as number_of_portfolios,
			j.l as portfolio_id,
			j.j as portfolio_name,
			j.k as portfolio_description length=94,
			input(substr(i.k,1,4),4.) as sic_first,
			input(substr(i.k,6,4),4.) as sic_last,
			substr(i.k,11) as sic_description length=97
		from j(where=(j)) left join j(where=(^j)) i on j.l=i.l
		order by portfolio_id;
quit;

proc append base=siccodes;
run;

%mend;

proc iml;
	if exist("siccodes") then call delete("siccodes");
quit;

%i(5)
%i(10)
%i(12)
%i(17)
%i(30)
%i(38)
%i(48)
%i(49)

rsubmit;

proc upload;
run;

endrsubmit;
