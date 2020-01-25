proc format;
	picture asterisk (fuzz=0 round) low-<0="LOW " 0-0.01="*** " 0.01<-0.05="**  " 0.05<-0.1="*   " 0.1<-1="    " 1<-high="HIGH";
	picture parenthesis (fuzz=0 round) low--99.995="NEGATIVE" -99.995<-0="0009.00)" (prefix="(-") 0-<999.995="0009.00)" (prefix="(") 999.995-high="POSITIVE";
run;

%let master=https://raw.githubusercontent.com/junyongkim/sascons/master/;

filename _ url "&master.sascons/regs/tsregnw.sas";
%include _;

filename _ url "&master.sascons/regs/csregnw.sas";
%include _;

filename _ url "&master.sascons/regs/csregsg.sas";
%include _;

%macro regs(portfolio=,factor=,longshort=,lag=,outest1=,outest2=,out=,gpath=,imagename=,gpath2=,imagename2=,imagefmt=);

%tsregnw(portfolio=&portfolio.,factor=&factor.,longshort=&longshort.,lag=&lag.,outest=&outest1.);
%csregnw(portfolio=&portfolio.,factor=&factor.,longshort=&longshort.,lag=&lag.,outest=&outest2.);
%csregsg(portfolio=&portfolio.,factor=&factor.,longshort=&longshort.,out=&out.,gpath=&gpath.,imagename=&imagename.,gpath2=&gpath2.,imagename2=&imagename2.,imagefmt=&imagefmt.);

%mend;
