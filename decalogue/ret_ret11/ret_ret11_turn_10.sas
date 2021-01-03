libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

proc sql;
	create table ret_ret11_turn_10 as
		select a.*,b.size1 as size1_,b.ret11 as ret11_
		from ret_ret11 a left join ret_ret11 b on a.permno=b.permno and
			intnx("month",a.date,0)=intnx("month",b.date,-1);
quit;

proc sql undo_policy=none;
	create table ret_ret11_turn_10 as
		select date,
			sum(ifn(floor(ret11/10)=0 and floor(ret11_/10)^=0,size1_,0))/sum(ifn(floor(ret11/10)=0,size1_,0)) as r0,
			sum(ifn(floor(ret11/10)=1 and floor(ret11_/10)^=1,size1_,0))/sum(ifn(floor(ret11/10)=1,size1_,0)) as r1,
			sum(ifn(floor(ret11/10)=2 and floor(ret11_/10)^=2,size1_,0))/sum(ifn(floor(ret11/10)=2,size1_,0)) as r2,
			sum(ifn(floor(ret11/10)=3 and floor(ret11_/10)^=3,size1_,0))/sum(ifn(floor(ret11/10)=3,size1_,0)) as r3,
			sum(ifn(floor(ret11/10)=4 and floor(ret11_/10)^=4,size1_,0))/sum(ifn(floor(ret11/10)=4,size1_,0)) as r4,
			sum(ifn(floor(ret11/10)=5 and floor(ret11_/10)^=5,size1_,0))/sum(ifn(floor(ret11/10)=5,size1_,0)) as r5,
			sum(ifn(floor(ret11/10)=6 and floor(ret11_/10)^=6,size1_,0))/sum(ifn(floor(ret11/10)=6,size1_,0)) as r6,
			sum(ifn(floor(ret11/10)=7 and floor(ret11_/10)^=7,size1_,0))/sum(ifn(floor(ret11/10)=7,size1_,0)) as r7,
			sum(ifn(floor(ret11/10)=8 and floor(ret11_/10)^=8,size1_,0))/sum(ifn(floor(ret11/10)=8,size1_,0)) as r8,
			sum(ifn(floor(ret11/10)=9 and floor(ret11_/10)^=9,size1_,0))/sum(ifn(floor(ret11/10)=9,size1_,0)) as r9
		from ret_ret11_turn_10
		group by date
		order by date;
quit;

proc download out=r.ret_ret11_turn_10;
run;

endrsubmit;
