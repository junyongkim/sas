option dlcreatedir;
libname stam1 "!userprofile\desktop\stam1\";
option nodlcreatedir;

data stam1.m4(drop=j);
	infile "http://finance.wharton.upenn.edu/~stambaug/M4.csv" url firstobs=2 dsd truncover;
	input date mktrf smb mgmt perf rf;
	array i(*) _all_;
	do j=2 to dim(i);
		i(j)=i(j)*100;
	end;
run;

data stam1.m4d(drop=j);
	infile "http://finance.wharton.upenn.edu/~stambaug/M4d.csv" url firstobs=2 dsd truncover;
	input date mktrf smb mgmt perf rf;
	array i(*) _all_;
	do j=2 to dim(i);
		i(j)=i(j)*100;
	end;
run;
