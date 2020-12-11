rsubmit;

proc sql;
	create table bm_rank as
		select lpermno,
			a.datadate,
			case when bm>bm99 then 99 when bm>bm98 then 98
				when bm>bm97 then 97 when bm>bm96 then 96
				when bm>bm95 then 95 when bm>bm94 then 94
				when bm>bm93 then 93 when bm>bm92 then 92
				when bm>bm91 then 91 when bm>bm90 then 90
				when bm>bm89 then 89 when bm>bm88 then 88
				when bm>bm87 then 87 when bm>bm86 then 86
				when bm>bm85 then 85 when bm>bm84 then 84
				when bm>bm83 then 83 when bm>bm82 then 82
				when bm>bm81 then 81 when bm>bm80 then 80
				when bm>bm79 then 79 when bm>bm78 then 78
				when bm>bm77 then 77 when bm>bm76 then 76
				when bm>bm75 then 75 when bm>bm74 then 74
				when bm>bm73 then 73 when bm>bm72 then 72
				when bm>bm71 then 71 when bm>bm70 then 70
				when bm>bm69 then 69 when bm>bm68 then 68
				when bm>bm67 then 67 when bm>bm66 then 66
				when bm>bm65 then 65 when bm>bm64 then 64
				when bm>bm63 then 63 when bm>bm62 then 62
				when bm>bm61 then 61 when bm>bm60 then 60
				when bm>bm59 then 59 when bm>bm58 then 58
				when bm>bm57 then 57 when bm>bm56 then 56
				when bm>bm55 then 55 when bm>bm54 then 54
				when bm>bm53 then 53 when bm>bm52 then 52
				when bm>bm51 then 51 when bm>bm50 then 50
				when bm>bm49 then 49 when bm>bm48 then 48
				when bm>bm47 then 47 when bm>bm46 then 46
				when bm>bm45 then 45 when bm>bm44 then 44
				when bm>bm43 then 43 when bm>bm42 then 42
				when bm>bm41 then 41 when bm>bm40 then 40
				when bm>bm39 then 39 when bm>bm38 then 38
				when bm>bm37 then 37 when bm>bm36 then 36
				when bm>bm35 then 35 when bm>bm34 then 34
				when bm>bm33 then 33 when bm>bm32 then 32
				when bm>bm31 then 31 when bm>bm30 then 30
				when bm>bm29 then 29 when bm>bm28 then 28
				when bm>bm27 then 27 when bm>bm26 then 26
				when bm>bm25 then 25 when bm>bm24 then 24
				when bm>bm23 then 23 when bm>bm22 then 22
				when bm>bm21 then 21 when bm>bm20 then 20
				when bm>bm19 then 19 when bm>bm18 then 18
				when bm>bm17 then 17 when bm>bm16 then 16
				when bm>bm15 then 15 when bm>bm14 then 14
				when bm>bm13 then 13 when bm>bm12 then 12
				when bm>bm11 then 11 when bm>bm10 then 10
				when bm>bm9 then 9 when bm>bm8 then 8
				when bm>bm7 then 7 when bm>bm6 then 6
				when bm>bm5 then 5 when bm>bm4 then 4
				when bm>bm3 then 3 when bm>bm2 then 2
				when bm>bm1 then 1 when bm>0 then 0 else -1 end as bm
		from bm a
			join bm_breakpoint b
				on intck("year.6",a.datadate,b.datadate)=0
		order by lpermno,datadate;
quit;

endrsubmit;
