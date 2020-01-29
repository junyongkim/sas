resetline;

proc printto log="!userprofile\desktop\devour\_nagel.txt";
run;

option dlcreatedir;
libname n "!userprofile\desktop\devour\_nagel\";
option nodlcreatedir;

filename _ url "https://voices.uchicago.edu/stefannagel/code-and-data/";

data url;
	infile _ truncover column=c length=l;
	do i=1 by 1 until(c>l);
		input url :$32767. @;
		if count(url,"dropbox") then do;
			url=tranwrd(scan(url,2,'"'),"www.dropbox.com","dl.dropboxusercontent.com");
			file=scan(reverse(scan(reverse(url),1,"/")),1,"?");
			output;
		end;
	end;
	drop i;
run;

%macro _nagel;

proc sql noprint;
	select url,file into :url separated by "~",:file separated by "~" from url order by monotonic();
quit;

%do i=1 %to %sysfunc(countw(&url.,~));

filename _ "!userprofile\desktop\devour\_nagel\_%scan(&file.,&i.,~)";

proc http url="%scan(&url.,&i.,~)" out=_;
run;

%end;

proc import file="!userprofile\desktop\devour\_nagel\_%scan(&file.,3,~)" dbms=%scan(%scan(&file.,3,~),2,.) replace out=%scan(%scan(&file.,3,~),1,.);
run;

proc import file="!userprofile\desktop\devour\_nagel\_%scan(&file.,9,~)" dbms=%scan(%scan(&file.,9,~),2,.) replace out=%scan(%scan(&file.,9,~),1,.);
run;

%macro _(i,j);

filename _ temp;

data _null_;
	infile "!userprofile\desktop\devour\_nagel\_%scan(&file.,&i.,~)" firstobs=&j.;
	file _;
	input;
	put _infile_;
run;

proc import file=_ dbms=csv replace out=%scan(%scan(&file.,&i.,~),1,.);
run;

%mend;

%_(10,3);
%_(11,4);
%_(12,4);
%_(13,4);
%_(14,3);
%_(15,5);
%_(16,7);
%_(17,7);

%mend;

%_nagel;

proc printto;
run;
