resetline;

proc printto log="!userprofile\desktop\devour\_daniel.txt";
run;

option dlcreatedir;
libname d "!userprofile\desktop\devour\_daniel\";
option nodlcreatedir;

filename _ url "http://www.kentdaniel.net/data.php";

data url;
	infile _ lrecl=32767 truncover column=c length=l;
	do i=1 by 1 until(c>l);
		input url :$32767. @;
		if count(url,"txt") or count(url,"xls") or count(url,"gz") then do;
			url="http://www.kentdaniel.net/"||scan(substr(url,find(url,"data")),1,'"');
			file=reverse(scan(reverse(url),1,"/"));
			output;
		end;
	end;
	drop i;
run;

%macro daniel;

proc sql noprint;
	select url,file into :url separated by "~",:file separated by "~" from url;
quit;

%do i=1 %to %sysfunc(countw(&file.,~));

filename _ "!userprofile\desktop\devour\_daniel\_%scan(&file.,&i.,~)";

proc http url="%scan(&url.,&i.,~)" out=_;
run;

%end;

proc import file="!userprofile\desktop\devour\_daniel\_%scan(&file.,1,~)" dbms=dlm replace out=d.%scan(%scan(&file.,1,~),1,.);
	delimiter="09"x;
run;

proc import file="!userprofile\desktop\devour\_daniel\_%scan(&file.,2,~)" dbms=dlm replace out=d.%scan(%scan(&file.,2,~),1,.);
	delimiter="09"x;
run;

proc import file="!userprofile\desktop\devour\_daniel\_%scan(&file.,3,~)" dbms=dlm replace out=d.%scan(%scan(&file.,3,~),1,.);
	delimiter="09"x;
run;

proc import file="!userprofile\desktop\devour\_daniel\_%scan(&file.,4,~)" dbms=dlm replace out=d.%scan(%scan(&file.,4,~),1,.);
	delimiter="09"x;
run;

proc import file="!userprofile\desktop\devour\_daniel\_%scan(&file.,6,~)" dbms=xlsx replace out=d.%scan(%scan(&file.,6,~),1,.);
run;

proc import file="!userprofile\desktop\devour\_daniel\_%scan(&file.,7,~)" dbms=xlsx replace out=d.%substr(%scan(%scan(&file.,7,~),1,.),1,32);
	range="dhl_portfolios$a4:0";
run;

%mend;

%daniel;

libname d;
filename _;

proc printto;
run;
