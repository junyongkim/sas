/*************************************************
hxz
this code downloads all hxz data to desktop
empty hxz in desktop before including this
avoid _ as filename when including this
*************************************************/

option dlcreatedir;
libname h "!userprofile\desktop\hxz\";
libname h;
option nodlcreatedir;

%let master=https://raw.githubusercontent.com/junyongkim/sascons/master/;

filename _ url "&master.hxz/factors.sas";
%include _;

filename _ url "&master.hxz/testingportfolios.sas";
%include _;

filename _ url "&master.hxz/csv.sas";
%include _;

filename _ url "&master.hxz/sas7bdat.sas";
%include _;

filename _ url "&master.hxz/sas7bdat2.sas";
%include _;

filename _ url "&master.hxz/dictionary.sas";
%include _;