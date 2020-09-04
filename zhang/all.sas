/*************************************************
folder %userprofile%\desktop\zhang\
libname h c s a
filename _ h t c
*************************************************/
option dlcreatedir;
libname h "!userprofile\desktop\zhang\";
libname h;
option nodlcreatedir;

%let master=https://raw.githubusercontent.com/junyongkim/sas/master/;

filename _ url "&master.zhang/factors.sas";
%include _;

filename _ url "&master.zhang/testingportfolios.sas";
%include _;

filename _ url "&master.zhang/csv.sas";
%include _;

filename _ url "&master.zhang/sas7bda.sas";
%include _;

filename _ url "&master.zhang/sas7bdat.sas";
%include _;

filename _ url "&master.zhang/dictionary.sas";
%include _;
