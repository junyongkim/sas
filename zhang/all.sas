/*************************************************
zhang
downloads all zhang data to desktop
empty zhang in desktop before including this
avoid _ as filename when including this
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
