libname r "!userprofile\desktop\sas\decalogue\ret_bm\";

rsubmit;

proc sql;
	create table ret_bm_50 as
		select date,
			sum(ifn(bm=-1,size1,.)*ret)/sum(ifn(bm=-1,size1,.)) as bn,
			sum(ifn(floor(bm/2)=0,size1,.)*ret)/sum(ifn(floor(bm/2)=0,size1,.)) as b00,
			sum(ifn(floor(bm/2)=1,size1,.)*ret)/sum(ifn(floor(bm/2)=1,size1,.)) as b01,
			sum(ifn(floor(bm/2)=2,size1,.)*ret)/sum(ifn(floor(bm/2)=2,size1,.)) as b02,
			sum(ifn(floor(bm/2)=3,size1,.)*ret)/sum(ifn(floor(bm/2)=3,size1,.)) as b03,
			sum(ifn(floor(bm/2)=4,size1,.)*ret)/sum(ifn(floor(bm/2)=4,size1,.)) as b04,
			sum(ifn(floor(bm/2)=5,size1,.)*ret)/sum(ifn(floor(bm/2)=5,size1,.)) as b05,
			sum(ifn(floor(bm/2)=6,size1,.)*ret)/sum(ifn(floor(bm/2)=6,size1,.)) as b06,
			sum(ifn(floor(bm/2)=7,size1,.)*ret)/sum(ifn(floor(bm/2)=7,size1,.)) as b07,
			sum(ifn(floor(bm/2)=8,size1,.)*ret)/sum(ifn(floor(bm/2)=8,size1,.)) as b08,
			sum(ifn(floor(bm/2)=9,size1,.)*ret)/sum(ifn(floor(bm/2)=9,size1,.)) as b09,
			sum(ifn(floor(bm/2)=10,size1,.)*ret)/sum(ifn(floor(bm/2)=10,size1,.)) as b10,
			sum(ifn(floor(bm/2)=11,size1,.)*ret)/sum(ifn(floor(bm/2)=11,size1,.)) as b11,
			sum(ifn(floor(bm/2)=12,size1,.)*ret)/sum(ifn(floor(bm/2)=12,size1,.)) as b12,
			sum(ifn(floor(bm/2)=13,size1,.)*ret)/sum(ifn(floor(bm/2)=13,size1,.)) as b13,
			sum(ifn(floor(bm/2)=14,size1,.)*ret)/sum(ifn(floor(bm/2)=14,size1,.)) as b14,
			sum(ifn(floor(bm/2)=15,size1,.)*ret)/sum(ifn(floor(bm/2)=15,size1,.)) as b15,
			sum(ifn(floor(bm/2)=16,size1,.)*ret)/sum(ifn(floor(bm/2)=16,size1,.)) as b16,
			sum(ifn(floor(bm/2)=17,size1,.)*ret)/sum(ifn(floor(bm/2)=17,size1,.)) as b17,
			sum(ifn(floor(bm/2)=18,size1,.)*ret)/sum(ifn(floor(bm/2)=18,size1,.)) as b18,
			sum(ifn(floor(bm/2)=19,size1,.)*ret)/sum(ifn(floor(bm/2)=19,size1,.)) as b19,
			sum(ifn(floor(bm/2)=20,size1,.)*ret)/sum(ifn(floor(bm/2)=20,size1,.)) as b20,
			sum(ifn(floor(bm/2)=21,size1,.)*ret)/sum(ifn(floor(bm/2)=21,size1,.)) as b21,
			sum(ifn(floor(bm/2)=22,size1,.)*ret)/sum(ifn(floor(bm/2)=22,size1,.)) as b22,
			sum(ifn(floor(bm/2)=23,size1,.)*ret)/sum(ifn(floor(bm/2)=23,size1,.)) as b23,
			sum(ifn(floor(bm/2)=24,size1,.)*ret)/sum(ifn(floor(bm/2)=24,size1,.)) as b24,
			sum(ifn(floor(bm/2)=25,size1,.)*ret)/sum(ifn(floor(bm/2)=25,size1,.)) as b25,
			sum(ifn(floor(bm/2)=26,size1,.)*ret)/sum(ifn(floor(bm/2)=26,size1,.)) as b26,
			sum(ifn(floor(bm/2)=27,size1,.)*ret)/sum(ifn(floor(bm/2)=27,size1,.)) as b27,
			sum(ifn(floor(bm/2)=28,size1,.)*ret)/sum(ifn(floor(bm/2)=28,size1,.)) as b28,
			sum(ifn(floor(bm/2)=29,size1,.)*ret)/sum(ifn(floor(bm/2)=29,size1,.)) as b29,
			sum(ifn(floor(bm/2)=30,size1,.)*ret)/sum(ifn(floor(bm/2)=30,size1,.)) as b30,
			sum(ifn(floor(bm/2)=31,size1,.)*ret)/sum(ifn(floor(bm/2)=31,size1,.)) as b31,
			sum(ifn(floor(bm/2)=32,size1,.)*ret)/sum(ifn(floor(bm/2)=32,size1,.)) as b32,
			sum(ifn(floor(bm/2)=33,size1,.)*ret)/sum(ifn(floor(bm/2)=33,size1,.)) as b33,
			sum(ifn(floor(bm/2)=34,size1,.)*ret)/sum(ifn(floor(bm/2)=34,size1,.)) as b34,
			sum(ifn(floor(bm/2)=35,size1,.)*ret)/sum(ifn(floor(bm/2)=35,size1,.)) as b35,
			sum(ifn(floor(bm/2)=36,size1,.)*ret)/sum(ifn(floor(bm/2)=36,size1,.)) as b36,
			sum(ifn(floor(bm/2)=37,size1,.)*ret)/sum(ifn(floor(bm/2)=37,size1,.)) as b37,
			sum(ifn(floor(bm/2)=38,size1,.)*ret)/sum(ifn(floor(bm/2)=38,size1,.)) as b38,
			sum(ifn(floor(bm/2)=39,size1,.)*ret)/sum(ifn(floor(bm/2)=39,size1,.)) as b39,
			sum(ifn(floor(bm/2)=40,size1,.)*ret)/sum(ifn(floor(bm/2)=40,size1,.)) as b40,
			sum(ifn(floor(bm/2)=41,size1,.)*ret)/sum(ifn(floor(bm/2)=41,size1,.)) as b41,
			sum(ifn(floor(bm/2)=42,size1,.)*ret)/sum(ifn(floor(bm/2)=42,size1,.)) as b42,
			sum(ifn(floor(bm/2)=43,size1,.)*ret)/sum(ifn(floor(bm/2)=43,size1,.)) as b43,
			sum(ifn(floor(bm/2)=44,size1,.)*ret)/sum(ifn(floor(bm/2)=44,size1,.)) as b44,
			sum(ifn(floor(bm/2)=45,size1,.)*ret)/sum(ifn(floor(bm/2)=45,size1,.)) as b45,
			sum(ifn(floor(bm/2)=46,size1,.)*ret)/sum(ifn(floor(bm/2)=46,size1,.)) as b46,
			sum(ifn(floor(bm/2)=47,size1,.)*ret)/sum(ifn(floor(bm/2)=47,size1,.)) as b47,
			sum(ifn(floor(bm/2)=48,size1,.)*ret)/sum(ifn(floor(bm/2)=48,size1,.)) as b48,
			sum(ifn(floor(bm/2)=49,size1,.)*ret)/sum(ifn(floor(bm/2)=49,size1,.)) as b49
		from ret_bm
		group by date
		order by date;
quit;

proc download out=r.ret_bm_50;
run;

endrsubmit;
