/*************************************************
pincette
downloads selected finance data to desktop
empty pincette in desktop before including this
avoid i as filename when including this
*************************************************/
option dlcreatedir;
libname p "!userprofile\desktop\pincette\";

filename i url "https://raw.githubusercontent.com/junyongkim/sas/master/pincette/http.sas";
%include i;

filename i url "https://raw.githubusercontent.com/junyongkim/sas/master/pincette/import.sas";
%include i;

filename i url "https://raw.githubusercontent.com/junyongkim/sas/master/pincette/modify.sas";
%include i;

filename i url "https://raw.githubusercontent.com/junyongkim/sas/master/pincette/pipe.sas";
%include i;
