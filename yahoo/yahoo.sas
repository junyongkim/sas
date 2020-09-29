%let i=ba cvx dis ed ge hpq ibm ko pg xom;				*oldies in yahoo;
%let j="1feb1962"d;										*first date;
%let k="31aug2020"d;									*last date;
*%include "!userprofile\desktop\sas\yahoo\symbol.sas";	*downloads from old nasdaq;
%include "!userprofile\desktop\sas\yahoo\adj.sas";		*downloads from yahoo;
%include "!userprofile\desktop\sas\yahoo\ri.sas";		*computes returns;
%include "!userprofile\desktop\sas\yahoo\front.sas";	*draws frontier;
%include "!userprofile\desktop\sas\yahoo\max.sas";		*draws cumulative values;
