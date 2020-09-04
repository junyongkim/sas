/*************************************************
folder %userprofile%\desktop\french\
libname f z c s a
filename _ h z c t
*************************************************/
option dlcreatedir;
libname f "!userprofile\desktop\french\";
libname f;
option nodlcreatedir;

%let master=https://raw.githubusercontent.com/junyongkim/sas/master/;

filename _ url "&master.french/data_library.sas";
%include _;

filename _ url "&master.french/zip.sas";
%include _;

filename _ url "&master.french/csv.sas";
%include _;

filename _ url "&master.french/sas7bda.sas";
%include _;

filename _ url "&master.french/sas7bdat.sas";
%include _;

filename _ url "&master.french/dictionary.sas";
%include _;
