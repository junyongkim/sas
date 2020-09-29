%let i=ba cvx dis ed ge hpq ibm ko pg xom;	*oldies in yahoo;
%let j="1feb1962"d;							*first date;
%let k="31aug2020"d;						*last date;
%include "!userprofile\desktop\adj.sas";	*downloads from yahoo;
%include "!userprofile\desktop\ri.sas";		*computes returns;
%include "!userprofile\desktop\front.sas";	*draws frontier;
%include "!userprofile\desktop\max.sas";	*draws cumulative values;
