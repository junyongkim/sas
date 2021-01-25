rsubmit;

proc iml;
	if exist("reg") then call delete("reg");
quit;

%reg(,1,,,12)
%reg(bm>.,2,bm,bm%str(=)g2;,12)
%reg(ret11>.,3,ret11,ret11%str(=)g3;,12)
%reg(bm>. & ret11>.,4,bm ret11,bm%str(=)g2;ret11=g3;,12)

proc transpose out=reg;
	by _model_;
	id parameter;
	var estimate tvalue;
	label tvalue=;
run;

proc sql undo_policy=none;
	create table reg as select
	input(substr(_model_,2),1.) as model,
	lowcase(_name_) as name,
	g1 as intercept,
	g2 as bm,
	g3 as ret11,
	case when _name_="Estimate" then adjrsq else . end as adjrsq,
	case when _name_="Estimate" then edf else . end as edf,
	case when _name_="Estimate" then rmse else . end as rmse from
	reg
	order by model,name;
quit;

proc download;
run;

endrsubmit;

proc export replace file="!userprofile\desktop\sas\decalogue2\zreg.csv";
run;
