libname r "!userprofile\desktop\sas\decalogue\ret_beta60\";

rsubmit;

proc sql;
	create table ret_beta60_50 as
		select date,
			sum(ifn(floor(beta60/2)=0,size1,.)*ret)/sum(ifn(floor(beta60/2)=0,size1,.)) as b00,
			sum(ifn(floor(beta60/2)=1,size1,.)*ret)/sum(ifn(floor(beta60/2)=1,size1,.)) as b01,
			sum(ifn(floor(beta60/2)=2,size1,.)*ret)/sum(ifn(floor(beta60/2)=2,size1,.)) as b02,
			sum(ifn(floor(beta60/2)=3,size1,.)*ret)/sum(ifn(floor(beta60/2)=3,size1,.)) as b03,
			sum(ifn(floor(beta60/2)=4,size1,.)*ret)/sum(ifn(floor(beta60/2)=4,size1,.)) as b04,
			sum(ifn(floor(beta60/2)=5,size1,.)*ret)/sum(ifn(floor(beta60/2)=5,size1,.)) as b05,
			sum(ifn(floor(beta60/2)=6,size1,.)*ret)/sum(ifn(floor(beta60/2)=6,size1,.)) as b06,
			sum(ifn(floor(beta60/2)=7,size1,.)*ret)/sum(ifn(floor(beta60/2)=7,size1,.)) as b07,
			sum(ifn(floor(beta60/2)=8,size1,.)*ret)/sum(ifn(floor(beta60/2)=8,size1,.)) as b08,
			sum(ifn(floor(beta60/2)=9,size1,.)*ret)/sum(ifn(floor(beta60/2)=9,size1,.)) as b09,
			sum(ifn(floor(beta60/2)=10,size1,.)*ret)/sum(ifn(floor(beta60/2)=10,size1,.)) as b10,
			sum(ifn(floor(beta60/2)=11,size1,.)*ret)/sum(ifn(floor(beta60/2)=11,size1,.)) as b11,
			sum(ifn(floor(beta60/2)=12,size1,.)*ret)/sum(ifn(floor(beta60/2)=12,size1,.)) as b12,
			sum(ifn(floor(beta60/2)=13,size1,.)*ret)/sum(ifn(floor(beta60/2)=13,size1,.)) as b13,
			sum(ifn(floor(beta60/2)=14,size1,.)*ret)/sum(ifn(floor(beta60/2)=14,size1,.)) as b14,
			sum(ifn(floor(beta60/2)=15,size1,.)*ret)/sum(ifn(floor(beta60/2)=15,size1,.)) as b15,
			sum(ifn(floor(beta60/2)=16,size1,.)*ret)/sum(ifn(floor(beta60/2)=16,size1,.)) as b16,
			sum(ifn(floor(beta60/2)=17,size1,.)*ret)/sum(ifn(floor(beta60/2)=17,size1,.)) as b17,
			sum(ifn(floor(beta60/2)=18,size1,.)*ret)/sum(ifn(floor(beta60/2)=18,size1,.)) as b18,
			sum(ifn(floor(beta60/2)=19,size1,.)*ret)/sum(ifn(floor(beta60/2)=19,size1,.)) as b19,
			sum(ifn(floor(beta60/2)=20,size1,.)*ret)/sum(ifn(floor(beta60/2)=20,size1,.)) as b20,
			sum(ifn(floor(beta60/2)=21,size1,.)*ret)/sum(ifn(floor(beta60/2)=21,size1,.)) as b21,
			sum(ifn(floor(beta60/2)=22,size1,.)*ret)/sum(ifn(floor(beta60/2)=22,size1,.)) as b22,
			sum(ifn(floor(beta60/2)=23,size1,.)*ret)/sum(ifn(floor(beta60/2)=23,size1,.)) as b23,
			sum(ifn(floor(beta60/2)=24,size1,.)*ret)/sum(ifn(floor(beta60/2)=24,size1,.)) as b24,
			sum(ifn(floor(beta60/2)=25,size1,.)*ret)/sum(ifn(floor(beta60/2)=25,size1,.)) as b25,
			sum(ifn(floor(beta60/2)=26,size1,.)*ret)/sum(ifn(floor(beta60/2)=26,size1,.)) as b26,
			sum(ifn(floor(beta60/2)=27,size1,.)*ret)/sum(ifn(floor(beta60/2)=27,size1,.)) as b27,
			sum(ifn(floor(beta60/2)=28,size1,.)*ret)/sum(ifn(floor(beta60/2)=28,size1,.)) as b28,
			sum(ifn(floor(beta60/2)=29,size1,.)*ret)/sum(ifn(floor(beta60/2)=29,size1,.)) as b29,
			sum(ifn(floor(beta60/2)=30,size1,.)*ret)/sum(ifn(floor(beta60/2)=30,size1,.)) as b30,
			sum(ifn(floor(beta60/2)=31,size1,.)*ret)/sum(ifn(floor(beta60/2)=31,size1,.)) as b31,
			sum(ifn(floor(beta60/2)=32,size1,.)*ret)/sum(ifn(floor(beta60/2)=32,size1,.)) as b32,
			sum(ifn(floor(beta60/2)=33,size1,.)*ret)/sum(ifn(floor(beta60/2)=33,size1,.)) as b33,
			sum(ifn(floor(beta60/2)=34,size1,.)*ret)/sum(ifn(floor(beta60/2)=34,size1,.)) as b34,
			sum(ifn(floor(beta60/2)=35,size1,.)*ret)/sum(ifn(floor(beta60/2)=35,size1,.)) as b35,
			sum(ifn(floor(beta60/2)=36,size1,.)*ret)/sum(ifn(floor(beta60/2)=36,size1,.)) as b36,
			sum(ifn(floor(beta60/2)=37,size1,.)*ret)/sum(ifn(floor(beta60/2)=37,size1,.)) as b37,
			sum(ifn(floor(beta60/2)=38,size1,.)*ret)/sum(ifn(floor(beta60/2)=38,size1,.)) as b38,
			sum(ifn(floor(beta60/2)=39,size1,.)*ret)/sum(ifn(floor(beta60/2)=39,size1,.)) as b39,
			sum(ifn(floor(beta60/2)=40,size1,.)*ret)/sum(ifn(floor(beta60/2)=40,size1,.)) as b40,
			sum(ifn(floor(beta60/2)=41,size1,.)*ret)/sum(ifn(floor(beta60/2)=41,size1,.)) as b41,
			sum(ifn(floor(beta60/2)=42,size1,.)*ret)/sum(ifn(floor(beta60/2)=42,size1,.)) as b42,
			sum(ifn(floor(beta60/2)=43,size1,.)*ret)/sum(ifn(floor(beta60/2)=43,size1,.)) as b43,
			sum(ifn(floor(beta60/2)=44,size1,.)*ret)/sum(ifn(floor(beta60/2)=44,size1,.)) as b44,
			sum(ifn(floor(beta60/2)=45,size1,.)*ret)/sum(ifn(floor(beta60/2)=45,size1,.)) as b45,
			sum(ifn(floor(beta60/2)=46,size1,.)*ret)/sum(ifn(floor(beta60/2)=46,size1,.)) as b46,
			sum(ifn(floor(beta60/2)=47,size1,.)*ret)/sum(ifn(floor(beta60/2)=47,size1,.)) as b47,
			sum(ifn(floor(beta60/2)=48,size1,.)*ret)/sum(ifn(floor(beta60/2)=48,size1,.)) as b48,
			sum(ifn(floor(beta60/2)=49,size1,.)*ret)/sum(ifn(floor(beta60/2)=49,size1,.)) as b49
		from ret_beta60
		group by date
		order by date;
quit;

proc download out=r.ret_beta60_50;
run;

endrsubmit;
