filename z "%sysfunc(getoption(work))\z";

proc http url="https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/f-f_research_data_factors_csv.zip" out=z;
run;

filename z zip "%sysfunc(getoption(work))\z";

data dd;
	infile z(F-F_Research_Data_Factors.CSV) dsd truncover;
	input date mkt_rf smb hml rf;
run;

data dd;
	set dd;
	where 100000<=date<=999999;
	by date;
	date=intnx("mon",input(put(date,6.),yymmn6.),1)-1;
	return=(mkt_rf+rf)/100;
	keep date return;
run;

proc iml;
	n=10;
	use dd;
		read all var _all_;
	close;
	cr=cuprod(1+return);
	t=nrow(cr);
	dd=1:t;
	do u=1 to t;
		dd[u]=cr[u]/max(cr[1:u])-1;
	end;
	x1=j(8*n,1);
	do o=1 to n;
		j=loc(dd=min(dd));
		do i=j to 1 by -1 until(dd[i]=0);
		end;
		do k=j to t until(dd[k]=0);
		end;
		x1[8*o-7:8*o-6]=date[i+1];
		x1[8*o-5:8*o-2]=date[j];
		x1[8*o-1:8*o]=date[k-1];
		dd[i+1:k-1]=0;
	end;
	create dd from x1;
		append from x1;
	close;
quit;

data dd;
	set dd;
	display="fill";
	if mod(_n_-1,8)<4 then fillcolor="red ";
	else fillcolor="lime";
	filltransparency=0.8;
	x1space="datavalue";
	y1space="wallpercent";
	if mod(_n_,4)=1 then function="polygon ";
	else function="polycont";
	x1=col1;
	if 1<mod(_n_,4)<4 then y1=100;
	else y1=0;
	col1=_n_;
run;

proc sort out=dd(drop=col1);
	by x1 col1;
run;
