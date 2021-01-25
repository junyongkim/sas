rsubmit;

%macro reg(where,n,model,g,lag);

proc reg data=d.join noprint adjrsq outest=i;
	where &where;
	by date;
	m&n:model ret=&model;
quit;

ods select none;
ods results=off;

proc model;
	inst/intonly;
	_adjrsq_=adjrsq;
	_edf_=edf;
	_rmse_=rmse;
	intercept=g1;
	&g
	fit _adjrsq_ _edf_ _rmse_ intercept &model
		/gmm vardef=n kernel=(bart,%eval(&lag+1),0);
	by _model_;
	ods output parameterestimates=j;
quit;

ods results=on;
ods select all;

proc append base=reg;
run;

%mend;

endrsubmit;
