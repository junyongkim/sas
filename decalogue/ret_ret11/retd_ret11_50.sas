libname r "!userprofile\desktop\sas\decalogue\ret_ret11\";

rsubmit;

proc sql;
	create table retd_ret11_50 as
		select date,
			sum(ifn(floor(ret11/2)=0,size1,.)*retd)/sum(ifn(floor(ret11/2)=0,size1,.)) as r00,
			sum(ifn(floor(ret11/2)=1,size1,.)*retd)/sum(ifn(floor(ret11/2)=1,size1,.)) as r01,
			sum(ifn(floor(ret11/2)=2,size1,.)*retd)/sum(ifn(floor(ret11/2)=2,size1,.)) as r02,
			sum(ifn(floor(ret11/2)=3,size1,.)*retd)/sum(ifn(floor(ret11/2)=3,size1,.)) as r03,
			sum(ifn(floor(ret11/2)=4,size1,.)*retd)/sum(ifn(floor(ret11/2)=4,size1,.)) as r04,
			sum(ifn(floor(ret11/2)=5,size1,.)*retd)/sum(ifn(floor(ret11/2)=5,size1,.)) as r05,
			sum(ifn(floor(ret11/2)=6,size1,.)*retd)/sum(ifn(floor(ret11/2)=6,size1,.)) as r06,
			sum(ifn(floor(ret11/2)=7,size1,.)*retd)/sum(ifn(floor(ret11/2)=7,size1,.)) as r07,
			sum(ifn(floor(ret11/2)=8,size1,.)*retd)/sum(ifn(floor(ret11/2)=8,size1,.)) as r08,
			sum(ifn(floor(ret11/2)=9,size1,.)*retd)/sum(ifn(floor(ret11/2)=9,size1,.)) as r09,
			sum(ifn(floor(ret11/2)=10,size1,.)*retd)/sum(ifn(floor(ret11/2)=10,size1,.)) as r10,
			sum(ifn(floor(ret11/2)=11,size1,.)*retd)/sum(ifn(floor(ret11/2)=11,size1,.)) as r11,
			sum(ifn(floor(ret11/2)=12,size1,.)*retd)/sum(ifn(floor(ret11/2)=12,size1,.)) as r12,
			sum(ifn(floor(ret11/2)=13,size1,.)*retd)/sum(ifn(floor(ret11/2)=13,size1,.)) as r13,
			sum(ifn(floor(ret11/2)=14,size1,.)*retd)/sum(ifn(floor(ret11/2)=14,size1,.)) as r14,
			sum(ifn(floor(ret11/2)=15,size1,.)*retd)/sum(ifn(floor(ret11/2)=15,size1,.)) as r15,
			sum(ifn(floor(ret11/2)=16,size1,.)*retd)/sum(ifn(floor(ret11/2)=16,size1,.)) as r16,
			sum(ifn(floor(ret11/2)=17,size1,.)*retd)/sum(ifn(floor(ret11/2)=17,size1,.)) as r17,
			sum(ifn(floor(ret11/2)=18,size1,.)*retd)/sum(ifn(floor(ret11/2)=18,size1,.)) as r18,
			sum(ifn(floor(ret11/2)=19,size1,.)*retd)/sum(ifn(floor(ret11/2)=19,size1,.)) as r19,
			sum(ifn(floor(ret11/2)=20,size1,.)*retd)/sum(ifn(floor(ret11/2)=20,size1,.)) as r20,
			sum(ifn(floor(ret11/2)=21,size1,.)*retd)/sum(ifn(floor(ret11/2)=21,size1,.)) as r21,
			sum(ifn(floor(ret11/2)=22,size1,.)*retd)/sum(ifn(floor(ret11/2)=22,size1,.)) as r22,
			sum(ifn(floor(ret11/2)=23,size1,.)*retd)/sum(ifn(floor(ret11/2)=23,size1,.)) as r23,
			sum(ifn(floor(ret11/2)=24,size1,.)*retd)/sum(ifn(floor(ret11/2)=24,size1,.)) as r24,
			sum(ifn(floor(ret11/2)=25,size1,.)*retd)/sum(ifn(floor(ret11/2)=25,size1,.)) as r25,
			sum(ifn(floor(ret11/2)=26,size1,.)*retd)/sum(ifn(floor(ret11/2)=26,size1,.)) as r26,
			sum(ifn(floor(ret11/2)=27,size1,.)*retd)/sum(ifn(floor(ret11/2)=27,size1,.)) as r27,
			sum(ifn(floor(ret11/2)=28,size1,.)*retd)/sum(ifn(floor(ret11/2)=28,size1,.)) as r28,
			sum(ifn(floor(ret11/2)=29,size1,.)*retd)/sum(ifn(floor(ret11/2)=29,size1,.)) as r29,
			sum(ifn(floor(ret11/2)=30,size1,.)*retd)/sum(ifn(floor(ret11/2)=30,size1,.)) as r30,
			sum(ifn(floor(ret11/2)=31,size1,.)*retd)/sum(ifn(floor(ret11/2)=31,size1,.)) as r31,
			sum(ifn(floor(ret11/2)=32,size1,.)*retd)/sum(ifn(floor(ret11/2)=32,size1,.)) as r32,
			sum(ifn(floor(ret11/2)=33,size1,.)*retd)/sum(ifn(floor(ret11/2)=33,size1,.)) as r33,
			sum(ifn(floor(ret11/2)=34,size1,.)*retd)/sum(ifn(floor(ret11/2)=34,size1,.)) as r34,
			sum(ifn(floor(ret11/2)=35,size1,.)*retd)/sum(ifn(floor(ret11/2)=35,size1,.)) as r35,
			sum(ifn(floor(ret11/2)=36,size1,.)*retd)/sum(ifn(floor(ret11/2)=36,size1,.)) as r36,
			sum(ifn(floor(ret11/2)=37,size1,.)*retd)/sum(ifn(floor(ret11/2)=37,size1,.)) as r37,
			sum(ifn(floor(ret11/2)=38,size1,.)*retd)/sum(ifn(floor(ret11/2)=38,size1,.)) as r38,
			sum(ifn(floor(ret11/2)=39,size1,.)*retd)/sum(ifn(floor(ret11/2)=39,size1,.)) as r39,
			sum(ifn(floor(ret11/2)=40,size1,.)*retd)/sum(ifn(floor(ret11/2)=40,size1,.)) as r40,
			sum(ifn(floor(ret11/2)=41,size1,.)*retd)/sum(ifn(floor(ret11/2)=41,size1,.)) as r41,
			sum(ifn(floor(ret11/2)=42,size1,.)*retd)/sum(ifn(floor(ret11/2)=42,size1,.)) as r42,
			sum(ifn(floor(ret11/2)=43,size1,.)*retd)/sum(ifn(floor(ret11/2)=43,size1,.)) as r43,
			sum(ifn(floor(ret11/2)=44,size1,.)*retd)/sum(ifn(floor(ret11/2)=44,size1,.)) as r44,
			sum(ifn(floor(ret11/2)=45,size1,.)*retd)/sum(ifn(floor(ret11/2)=45,size1,.)) as r45,
			sum(ifn(floor(ret11/2)=46,size1,.)*retd)/sum(ifn(floor(ret11/2)=46,size1,.)) as r46,
			sum(ifn(floor(ret11/2)=47,size1,.)*retd)/sum(ifn(floor(ret11/2)=47,size1,.)) as r47,
			sum(ifn(floor(ret11/2)=48,size1,.)*retd)/sum(ifn(floor(ret11/2)=48,size1,.)) as r48,
			sum(ifn(floor(ret11/2)=49,size1,.)*retd)/sum(ifn(floor(ret11/2)=49,size1,.)) as r49
		from retd_ret11
		group by date
		order by date;
quit;

proc download out=r.retd_ret11_50;
run;

endrsubmit;
