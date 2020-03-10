option dlcreatedir;
libname p "!userprofile\desktop\pincette\";

filename i url "https://raw.githubusercontent.com/junyongkim/sas/master/pincette/http.sas";
%include i;

filename i url "https://raw.githubusercontent.com/junyongkim/sas/master/pincette/import.sas";
%include i;
