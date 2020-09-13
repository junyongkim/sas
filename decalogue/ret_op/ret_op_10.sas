libname r "!userprofile\desktop\sas\decalogue\ret_op\";

rsubmit;

proc sql;
	create table ret_op_10 as
		select date,
			sum(ifn(op=0,size1,.)*ret)/sum(ifn(op=0,size1,.)) as o0,
			sum(ifn(op=1,size1,.)*ret)/sum(ifn(op=1,size1,.)) as o1,
			sum(ifn(op=2,size1,.)*ret)/sum(ifn(op=2,size1,.)) as o2,
			sum(ifn(op=3,size1,.)*ret)/sum(ifn(op=3,size1,.)) as o3,
			sum(ifn(op=4,size1,.)*ret)/sum(ifn(op=4,size1,.)) as o4,
			sum(ifn(op=5,size1,.)*ret)/sum(ifn(op=5,size1,.)) as o5,
			sum(ifn(op=6,size1,.)*ret)/sum(ifn(op=6,size1,.)) as o6,
			sum(ifn(op=7,size1,.)*ret)/sum(ifn(op=7,size1,.)) as o7,
			sum(ifn(op=8,size1,.)*ret)/sum(ifn(op=8,size1,.)) as o8,
			sum(ifn(op=9,size1,.)*ret)/sum(ifn(op=9,size1,.)) as o9
		from ret_op
		group by date
		order by date;
quit;

proc download out=r.ret_op_10;
run;

endrsubmit;
