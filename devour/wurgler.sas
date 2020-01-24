resetline;

proc printto log="!userprofile\desktop\devour\wurgler.txt";
run;

option dlcreatedir;
libname w "!userprofile\desktop\devour\wurgler\";
option nodlcreatedir;

filename h url "http://people.stern.nyu.edu/jwurgler/main.htm";

data wurgler;
	infile h truncover;
	input url $32767.;
	if count(url,"xls");
	url=scan(url,2,'"');
	if url=:"data" then url="http://people.stern.nyu.edu/jwurgler/"||url;
	file=reverse(scan(reverse(url),1,"/"));
	out=tranwrd(tranwrd(scan(file,1,"."),"%20","_"),"-","_");
	if length(out)>32 then out=substr(out,1,32);
	dbms=scan(file,2,".");
	file "!userprofile\desktop\devour\wurgler\_url.txt";
	put url;
run;

%macro wurgler1(i);

filename x "!userprofile\desktop\devour\wurgler\_%scan(&file.,&i.,%str( ))";

proc http url="%scan(&url.,&i.,%str( ))" out=x;
run;

%mend;

%macro wurgler2;

proc sql noprint;
	select url,file,out,dbms into :url separated by " ",:file separated by " ",:out separated by " ",:dbms separated by " " from wurgler order by monotonic();
quit;

%do i=1 %to %sysfunc(countw(&url.,%str( )));

%wurgler1(&i.);

proc import file=x dbms=%scan(&dbms.,&i.,%str( )) replace out=w.%scan(&out.,&i.,%str( ));
	%if &i.=1 %then %do;sheet="data";%end;
	%else %if &i.=2 %then %do;sheet='s&p changes';namerow=32;startrow=33;%end;
	%else %if &i.=3 %then %do;sheet="s monthly";namerow=18;startrow=19;;%end;
	%else %if &i.=4 %then %do;sheet="bgw";namerow=19;startrow=20;%end;
	%else %if &i.=5 %then %do;sheet="elastic2";namerow=14;startrow=15;%end;
run;

%if &i.=3 %then %do;

proc import file=x dbms=%scan(&dbms.,&i.,%str( )) replace out=w.%scan(&out.,&i.,%str( ))annual;
	sheet="s annual";namerow=23;startrow=24;
run;

%end;

%end;

%mend;

%wurgler2;

libname w;
filename h;

proc printto;
run;
