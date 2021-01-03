libname r "!userprofile\desktop\sas\decalogue\ret_size6\";

rsubmit;

proc sql;
	create table ret_size6_turn_10 as
		select a.*,b.size1 as size1_,b.size6 as size6_
		from ret_size6 a left join ret_size6 b on a.permno=b.permno and
			intnx("month",a.date,0)=intnx("month",b.date,-1);
quit;

%macro i;
	%do i=0 %to 9;
		,sum(ifn(floor(size6/10)=&i and floor(size6_/10)^=&i,size1_,0))
			/sum(ifn(floor(size6/10)=&i,size1_,0)) as s&i
	%end;
%mend;

proc sql undo_policy=none;
	create table ret_size6_turn_10 as
		select date
			%i
		from ret_size6_turn_10
		group by date
		order by date;
quit;

proc download out=r.ret_size6_turn_10;
run;

endrsubmit;
