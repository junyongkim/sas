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

filename _ url "&master.devour/lettau.sas";
%include _;

filename _ url "&master.devour/wurgler.sas";
%include _;

filename _ url "&master.devour/polk.sas";
%include _;

filename _ url "&master.devour/ludvigson.sas";
%include _;

filename _ url "&master.devour/koijen.sas";
%include _;

filename _ url "&master.devour/davis.sas";
%include _;

filename _ url "&master.devour/jiang.sas";
%include _;

filename _ url "&master.devour/moskowitz.sas";
%include _;

filename _ url "&master.devour/_daniel.sas";
%include _;

filename _ url "&master.devour/_nagel.sas";
%include _;

filename _ url "&master.devour/_aqr.sas";
%include _;
