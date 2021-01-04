libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

proc sql;
	create table ret_ret11_zoom_turn_200 as
		select a.*,b.size1 as size1_,b.ret11 as ret11_
		from ret_ret11_zoom a left join ret_ret11_zoom b on a.permno=b.permno and
			intnx("month",a.date,0)=intnx("month",b.date,-1);
quit;

%macro i;
	%do j=5 %to 200 %by 5;
		,sum(ifn(ret11>=100-100/&j and ret11_^>=100-100/&j,size1_,0))/sum(ifn(ret11>=100-100/&j,size1_,0))
			+sum(ifn(ret11<100/&j and ret11_^<100/&j,size1_,0))/sum(ifn(ret11<100/&j,size1_,0)) as r%sysfunc(putn(&j,z3.))
	%end;
%mend;

proc sql undo_policy=none;
	create table ret_ret11_zoom_turn_200 as
		select date
			%i
		from ret_ret11_zoom_turn_200
		group by date
		order by date;
quit;

proc download out=r.ret_ret11_zoom_turn_200;
run;

endrsubmit;
