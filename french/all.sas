/*************************************************
french
this code downloads all french data to desktop
empty french in desktop before including this
avoid _ as filename when including this
*************************************************/

option dlcreatedir;
libname f "!userprofile\desktop\french\";
libname f;
option nodlcreatedir;

%let master=https://raw.githubusercontent.com/junyongkim/sascons/master/;

filename _ url "&master.french/data_library.sas";
%include _;

filename _ url "&master.french/zip.sas";
%include _;

filename _ url "&master.french/csv.sas";
%include _;

filename _ url "&master.french/sas7bdat.sas";
%include _;

filename _ url "&master.french/dictionary.sas";
%include _;
