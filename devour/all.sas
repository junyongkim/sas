option dlcreatedir;
libname d "!userprofile\desktop\devour\";
libname d;
option nodlcreatedir;

%let master=https://raw.githubusercontent.com/junyongkim/sascons/master/;

filename _ url "&master.devour/stambaugh.sas";
%include _;

filename _ url "&master.devour/kroencke.sas";
%include _;

filename _ url "&master.devour/shiller.sas";
%include _;

filename _ url "&master.devour/ritter.sas";
%include _;

filename _ url "&master.devour/michigan.sas";
%include _;

filename _ url "&master.devour/aqr.sas";
%include _;
