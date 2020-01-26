resetline;

proc printto log="!userprofile\desktop\devour\ludvigson.txt";
run;

option dlcreatedir;
libname l "!userprofile\desktop\devour\ludvigson\";
option nodlcreatedir;

filename z "%sysfunc(getoption(work))\z";

proc http url="https://www.sydneyludvigson.com/s/MacroFinanceUncertainty_201908_update.zip" out=z;
run;

filename z zip "%sysfunc(getoption(work))\z";
filename c "!userprofile\desktop\devour\ludvigson\_FinancialUncertaintyToCirculate.csv";

data _null_;
	infile z(FinancialUncertaintyToCirculate.csv);
	file c;
	input;
	put _infile_;
run;

proc import file=c dbms=csv replace out=l.financialuncertaintytocirculate;
run;

filename c "!userprofile\desktop\devour\ludvigson\_MacroUncertaintyToCirculate.csv";

data _null_;
	infile z(MacroUncertaintyToCirculate.csv);
	file c;
	input;
	put _infile_;
run;

proc import file=c dbms=csv replace out=l.macrouncertaintytocirculate;
run;

filename c "!userprofile\desktop\devour\ludvigson\_RealUncertaintyToCirculate.csv";

data _null_;
	infile z(RealUncertaintyToCirculate.csv);
	file c;
	input;
	put _infile_;
run;

proc import file=c dbms=csv replace out=l.realuncertaintytocirculate;
run;

filename x "!userprofile\desktop\devour\ludvigson\Updated_LN_Macro_Factors_2019AUG.xlsx";

proc http url="https://www.sydneyludvigson.com/s/_Updated_LN_Macro_Factors_2019AUG.xlsx" out=x;
run;

proc import file=x dbms=xlsx replace out=updated_ln_macro_factors_2019aug;
run;

libname l;
filename c x;

proc printto;
run;
