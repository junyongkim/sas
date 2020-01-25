resetline;

proc printto log="!userprofile\desktop\devour\aqr.txt";
run;

option dlcreatedir;
libname a "!userprofile\desktop\devour\aqr\";
option nodlcreatedir;

filename h url 'https://www.aqr.com/Insights/Datasets?&page=1';

data step1;
	infile h truncover;
	input url $32767.;
	if find(lowcase(url),"/insights/datasets/");
	url="https://www.aqr.com"||scan(url,4,'"');
run;

filename h url 'https://www.aqr.com/Insights/Datasets?&page=2';

data step11;
	infile h truncover;
	input url $32767.;
	if find(lowcase(url),"/insights/datasets/");
	url="https://www.aqr.com"||scan(url,4,'"');
run;

proc append base=step1;
run;

proc delete data=step11;
run;

%macro aqr;

proc sql noprint;
	select distinct url into :url separated by " " from step1 order by url;
quit;

proc delete data=step2;
run;

%do i=1 %to %sysfunc(countw(&url.,%str( )));

filename h url "%scan(&url.,&i.,%str( ))";

data step21;
	infile h truncover;
	input file $32767.;
	if find(lowcase(file),"button--download");
	file="https:"||scan(file,2,'"');
	call symputx("file",file,l);
run;

filename x "!userprofile\desktop\devour\aqr\_%scan(&file.,9,/)";

proc http url="&file." out=x;
run;

proc append base=step2;
run;

%end;

proc delete data=step21;
run;

%mend;

%aqr;

data _null_;
	set step2;
	file "!userprofile\desktop\devour\aqr\_xlsx.txt";
	put file;
run;

data step3;
	infile 'dir /b %userprofile%\desktop\devour\aqr\' pipe truncover;
	input file $32767.;
	if file="_xlsx.txt" then delete;
	name=compress(scan(file,1,"."),"-_");
	if name=:"Betting" then name=tranwrd(name,"BettingAgainstBeta","BAB");
	else if name=:"TheDevil" then name=tranwrd(name,"TheDevilinHMLsDetails","TheDevilHMLs");
	if length(name)>27 then name=substr(name,1,27);
run;

proc sql noprint;
	select file,name into :file separated by " ",:name separated by " " from step3 order by file;
quit;

%macro aqr2(file2,dbms,out,range1,range2);

proc import file="!userprofile\desktop\devour\aqr\%scan(&file.,&file2.,%str( ))" dbms=xls&dbms. replace out=a.%scan(&name.,&file2.,%str( ))&out.;
	range="&range1.$a&range2.:0";
run;

%mend;

%aqr2(1,,,returns,2);

%aqr2(2,x,,bab factors,19);
%aqr2(2,x,mkt,mkt,19);
%aqr2(2,x,smb,smb,19);
%aqr2(2,x,hmlff,hml ff,19);
%aqr2(2,x,hmldv,hml devil,19);
%aqr2(2,x,umd,umd,19);
%aqr2(2,x,rf,rf,19);

%aqr2(3,x,,bab factors,19);
%aqr2(3,x,mkt,mkt,19);
%aqr2(3,x,smb,smb,19);
%aqr2(3,x,hmlff,hml ff,19);
%aqr2(3,x,hmldv,hml devil,19);
%aqr2(3,x,umd,umd,19);
%aqr2(3,x,met1,me(t-1),19);
%aqr2(3,x,rf,rf,19);

%aqr2(4,x,,bab factors,11);

%aqr2(5,x,,century of factor premia,19);

%aqr2(6,x,,data,11);

%aqr2(7,x,,data,11);

%aqr2(8,x,,credit risk premium,11);

%aqr2(9,x,,10 portfolios formed on quality,19);

%aqr2(10,x,,qmj factors,19);
%aqr2(10,x,mkt,mkt,19);
%aqr2(10,x,smb,smb,19);
%aqr2(10,x,hmlff,hml ff,19);
%aqr2(10,x,hmldv,hml devil,19);
%aqr2(10,x,umd,umd,19);
%aqr2(10,x,rf,rf,19);

%aqr2(11,x,,qmj factors,19);
%aqr2(11,x,mkt,mkt,19);
%aqr2(11,x,smb,smb,19);
%aqr2(11,x,hmlff,hml ff,19);
%aqr2(11,x,hmldv,hml devil,19);
%aqr2(11,x,umd,umd,19);
%aqr2(11,x,met1,me(t-1),19);
%aqr2(11,x,rf,rf,19);

%aqr2(12,x,,size x quality (2 x3),19);

%aqr2(13,x,,hml devil,19);
%aqr2(13,x,mkt,mkt,19);
%aqr2(13,x,smb,smb,19);
%aqr2(13,x,hmlff,hml ff,19);
%aqr2(13,x,umd,umd,19);
%aqr2(13,x,rf,rf,19);

%aqr2(14,x,,hml devil,19);
%aqr2(14,x,mkt,mkt,19);
%aqr2(14,x,smb,smb,19);
%aqr2(14,x,hmlff,hml ff,19);
%aqr2(14,x,umd,umd,19);
%aqr2(14,x,met1,me(t-1),19);
%aqr2(14,x,rf,rf,19);

%aqr2(15,x,,tsmom factors,18);

%aqr2(16,x,,tsmom factors,11);

%aqr2(17,x,,vme factors,22);

%aqr2(18,x,,vme portfolios,13);
%aqr2(18,x,,vme factors,15);

%aqr2(19,x,,vme portfolios,13);

libname a;
filename h;
%symdel file;

proc printto;
run;
