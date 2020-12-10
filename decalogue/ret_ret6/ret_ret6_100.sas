libname r "!userprofile\desktop\sas\decalogue\ret_ret6\";

rsubmit;

proc sql;
	create table ret_ret6_100 as
		select date,
			sum(ifn(ret6=0,size1,.)*ret)/sum(ifn(ret6=0,size1,.)) as r00,
			sum(ifn(ret6=1,size1,.)*ret)/sum(ifn(ret6=1,size1,.)) as r01,
			sum(ifn(ret6=2,size1,.)*ret)/sum(ifn(ret6=2,size1,.)) as r02,
			sum(ifn(ret6=3,size1,.)*ret)/sum(ifn(ret6=3,size1,.)) as r03,
			sum(ifn(ret6=4,size1,.)*ret)/sum(ifn(ret6=4,size1,.)) as r04,
			sum(ifn(ret6=5,size1,.)*ret)/sum(ifn(ret6=5,size1,.)) as r05,
			sum(ifn(ret6=6,size1,.)*ret)/sum(ifn(ret6=6,size1,.)) as r06,
			sum(ifn(ret6=7,size1,.)*ret)/sum(ifn(ret6=7,size1,.)) as r07,
			sum(ifn(ret6=8,size1,.)*ret)/sum(ifn(ret6=8,size1,.)) as r08,
			sum(ifn(ret6=9,size1,.)*ret)/sum(ifn(ret6=9,size1,.)) as r09,
			sum(ifn(ret6=10,size1,.)*ret)/sum(ifn(ret6=10,size1,.)) as r10,
			sum(ifn(ret6=11,size1,.)*ret)/sum(ifn(ret6=11,size1,.)) as r11,
			sum(ifn(ret6=12,size1,.)*ret)/sum(ifn(ret6=12,size1,.)) as r12,
			sum(ifn(ret6=13,size1,.)*ret)/sum(ifn(ret6=13,size1,.)) as r13,
			sum(ifn(ret6=14,size1,.)*ret)/sum(ifn(ret6=14,size1,.)) as r14,
			sum(ifn(ret6=15,size1,.)*ret)/sum(ifn(ret6=15,size1,.)) as r15,
			sum(ifn(ret6=16,size1,.)*ret)/sum(ifn(ret6=16,size1,.)) as r16,
			sum(ifn(ret6=17,size1,.)*ret)/sum(ifn(ret6=17,size1,.)) as r17,
			sum(ifn(ret6=18,size1,.)*ret)/sum(ifn(ret6=18,size1,.)) as r18,
			sum(ifn(ret6=19,size1,.)*ret)/sum(ifn(ret6=19,size1,.)) as r19,
			sum(ifn(ret6=20,size1,.)*ret)/sum(ifn(ret6=20,size1,.)) as r20,
			sum(ifn(ret6=21,size1,.)*ret)/sum(ifn(ret6=21,size1,.)) as r21,
			sum(ifn(ret6=22,size1,.)*ret)/sum(ifn(ret6=22,size1,.)) as r22,
			sum(ifn(ret6=23,size1,.)*ret)/sum(ifn(ret6=23,size1,.)) as r23,
			sum(ifn(ret6=24,size1,.)*ret)/sum(ifn(ret6=24,size1,.)) as r24,
			sum(ifn(ret6=25,size1,.)*ret)/sum(ifn(ret6=25,size1,.)) as r25,
			sum(ifn(ret6=26,size1,.)*ret)/sum(ifn(ret6=26,size1,.)) as r26,
			sum(ifn(ret6=27,size1,.)*ret)/sum(ifn(ret6=27,size1,.)) as r27,
			sum(ifn(ret6=28,size1,.)*ret)/sum(ifn(ret6=28,size1,.)) as r28,
			sum(ifn(ret6=29,size1,.)*ret)/sum(ifn(ret6=29,size1,.)) as r29,
			sum(ifn(ret6=30,size1,.)*ret)/sum(ifn(ret6=30,size1,.)) as r30,
			sum(ifn(ret6=31,size1,.)*ret)/sum(ifn(ret6=31,size1,.)) as r31,
			sum(ifn(ret6=32,size1,.)*ret)/sum(ifn(ret6=32,size1,.)) as r32,
			sum(ifn(ret6=33,size1,.)*ret)/sum(ifn(ret6=33,size1,.)) as r33,
			sum(ifn(ret6=34,size1,.)*ret)/sum(ifn(ret6=34,size1,.)) as r34,
			sum(ifn(ret6=35,size1,.)*ret)/sum(ifn(ret6=35,size1,.)) as r35,
			sum(ifn(ret6=36,size1,.)*ret)/sum(ifn(ret6=36,size1,.)) as r36,
			sum(ifn(ret6=37,size1,.)*ret)/sum(ifn(ret6=37,size1,.)) as r37,
			sum(ifn(ret6=38,size1,.)*ret)/sum(ifn(ret6=38,size1,.)) as r38,
			sum(ifn(ret6=39,size1,.)*ret)/sum(ifn(ret6=39,size1,.)) as r39,
			sum(ifn(ret6=40,size1,.)*ret)/sum(ifn(ret6=40,size1,.)) as r40,
			sum(ifn(ret6=41,size1,.)*ret)/sum(ifn(ret6=41,size1,.)) as r41,
			sum(ifn(ret6=42,size1,.)*ret)/sum(ifn(ret6=42,size1,.)) as r42,
			sum(ifn(ret6=43,size1,.)*ret)/sum(ifn(ret6=43,size1,.)) as r43,
			sum(ifn(ret6=44,size1,.)*ret)/sum(ifn(ret6=44,size1,.)) as r44,
			sum(ifn(ret6=45,size1,.)*ret)/sum(ifn(ret6=45,size1,.)) as r45,
			sum(ifn(ret6=46,size1,.)*ret)/sum(ifn(ret6=46,size1,.)) as r46,
			sum(ifn(ret6=47,size1,.)*ret)/sum(ifn(ret6=47,size1,.)) as r47,
			sum(ifn(ret6=48,size1,.)*ret)/sum(ifn(ret6=48,size1,.)) as r48,
			sum(ifn(ret6=49,size1,.)*ret)/sum(ifn(ret6=49,size1,.)) as r49,
			sum(ifn(ret6=50,size1,.)*ret)/sum(ifn(ret6=50,size1,.)) as r50,
			sum(ifn(ret6=51,size1,.)*ret)/sum(ifn(ret6=51,size1,.)) as r51,
			sum(ifn(ret6=52,size1,.)*ret)/sum(ifn(ret6=52,size1,.)) as r52,
			sum(ifn(ret6=53,size1,.)*ret)/sum(ifn(ret6=53,size1,.)) as r53,
			sum(ifn(ret6=54,size1,.)*ret)/sum(ifn(ret6=54,size1,.)) as r54,
			sum(ifn(ret6=55,size1,.)*ret)/sum(ifn(ret6=55,size1,.)) as r55,
			sum(ifn(ret6=56,size1,.)*ret)/sum(ifn(ret6=56,size1,.)) as r56,
			sum(ifn(ret6=57,size1,.)*ret)/sum(ifn(ret6=57,size1,.)) as r57,
			sum(ifn(ret6=58,size1,.)*ret)/sum(ifn(ret6=58,size1,.)) as r58,
			sum(ifn(ret6=59,size1,.)*ret)/sum(ifn(ret6=59,size1,.)) as r59,
			sum(ifn(ret6=60,size1,.)*ret)/sum(ifn(ret6=60,size1,.)) as r60,
			sum(ifn(ret6=61,size1,.)*ret)/sum(ifn(ret6=61,size1,.)) as r61,
			sum(ifn(ret6=62,size1,.)*ret)/sum(ifn(ret6=62,size1,.)) as r62,
			sum(ifn(ret6=63,size1,.)*ret)/sum(ifn(ret6=63,size1,.)) as r63,
			sum(ifn(ret6=64,size1,.)*ret)/sum(ifn(ret6=64,size1,.)) as r64,
			sum(ifn(ret6=65,size1,.)*ret)/sum(ifn(ret6=65,size1,.)) as r65,
			sum(ifn(ret6=66,size1,.)*ret)/sum(ifn(ret6=66,size1,.)) as r66,
			sum(ifn(ret6=67,size1,.)*ret)/sum(ifn(ret6=67,size1,.)) as r67,
			sum(ifn(ret6=68,size1,.)*ret)/sum(ifn(ret6=68,size1,.)) as r68,
			sum(ifn(ret6=69,size1,.)*ret)/sum(ifn(ret6=69,size1,.)) as r69,
			sum(ifn(ret6=70,size1,.)*ret)/sum(ifn(ret6=70,size1,.)) as r70,
			sum(ifn(ret6=71,size1,.)*ret)/sum(ifn(ret6=71,size1,.)) as r71,
			sum(ifn(ret6=72,size1,.)*ret)/sum(ifn(ret6=72,size1,.)) as r72,
			sum(ifn(ret6=73,size1,.)*ret)/sum(ifn(ret6=73,size1,.)) as r73,
			sum(ifn(ret6=74,size1,.)*ret)/sum(ifn(ret6=74,size1,.)) as r74,
			sum(ifn(ret6=75,size1,.)*ret)/sum(ifn(ret6=75,size1,.)) as r75,
			sum(ifn(ret6=76,size1,.)*ret)/sum(ifn(ret6=76,size1,.)) as r76,
			sum(ifn(ret6=77,size1,.)*ret)/sum(ifn(ret6=77,size1,.)) as r77,
			sum(ifn(ret6=78,size1,.)*ret)/sum(ifn(ret6=78,size1,.)) as r78,
			sum(ifn(ret6=79,size1,.)*ret)/sum(ifn(ret6=79,size1,.)) as r79,
			sum(ifn(ret6=80,size1,.)*ret)/sum(ifn(ret6=80,size1,.)) as r80,
			sum(ifn(ret6=81,size1,.)*ret)/sum(ifn(ret6=81,size1,.)) as r81,
			sum(ifn(ret6=82,size1,.)*ret)/sum(ifn(ret6=82,size1,.)) as r82,
			sum(ifn(ret6=83,size1,.)*ret)/sum(ifn(ret6=83,size1,.)) as r83,
			sum(ifn(ret6=84,size1,.)*ret)/sum(ifn(ret6=84,size1,.)) as r84,
			sum(ifn(ret6=85,size1,.)*ret)/sum(ifn(ret6=85,size1,.)) as r85,
			sum(ifn(ret6=86,size1,.)*ret)/sum(ifn(ret6=86,size1,.)) as r86,
			sum(ifn(ret6=87,size1,.)*ret)/sum(ifn(ret6=87,size1,.)) as r87,
			sum(ifn(ret6=88,size1,.)*ret)/sum(ifn(ret6=88,size1,.)) as r88,
			sum(ifn(ret6=89,size1,.)*ret)/sum(ifn(ret6=89,size1,.)) as r89,
			sum(ifn(ret6=90,size1,.)*ret)/sum(ifn(ret6=90,size1,.)) as r90,
			sum(ifn(ret6=91,size1,.)*ret)/sum(ifn(ret6=91,size1,.)) as r91,
			sum(ifn(ret6=92,size1,.)*ret)/sum(ifn(ret6=92,size1,.)) as r92,
			sum(ifn(ret6=93,size1,.)*ret)/sum(ifn(ret6=93,size1,.)) as r93,
			sum(ifn(ret6=94,size1,.)*ret)/sum(ifn(ret6=94,size1,.)) as r94,
			sum(ifn(ret6=95,size1,.)*ret)/sum(ifn(ret6=95,size1,.)) as r95,
			sum(ifn(ret6=96,size1,.)*ret)/sum(ifn(ret6=96,size1,.)) as r96,
			sum(ifn(ret6=97,size1,.)*ret)/sum(ifn(ret6=97,size1,.)) as r97,
			sum(ifn(ret6=98,size1,.)*ret)/sum(ifn(ret6=98,size1,.)) as r98,
			sum(ifn(ret6=99,size1,.)*ret)/sum(ifn(ret6=99,size1,.)) as r99
		from ret_ret6
		group by date
		order by date;
quit;

proc download out=r.ret_ret6_100;
run;

endrsubmit;