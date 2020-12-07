rsubmit;

proc sql;
	create table beta60_rank as
		select permno,
			a.date,
			case when beta60>beta6099 then 99 when beta60>beta6098 then 98
				when beta60>beta6097 then 97 when beta60>beta6096 then 96
				when beta60>beta6095 then 95 when beta60>beta6094 then 94
				when beta60>beta6093 then 93 when beta60>beta6092 then 92
				when beta60>beta6091 then 91 when beta60>beta6090 then 90
				when beta60>beta6089 then 89 when beta60>beta6088 then 88
				when beta60>beta6087 then 87 when beta60>beta6086 then 86
				when beta60>beta6085 then 85 when beta60>beta6084 then 84
				when beta60>beta6083 then 83 when beta60>beta6082 then 82
				when beta60>beta6081 then 81 when beta60>beta6080 then 80
				when beta60>beta6079 then 79 when beta60>beta6078 then 78
				when beta60>beta6077 then 77 when beta60>beta6076 then 76
				when beta60>beta6075 then 75 when beta60>beta6074 then 74
				when beta60>beta6073 then 73 when beta60>beta6072 then 72
				when beta60>beta6071 then 71 when beta60>beta6070 then 70
				when beta60>beta6069 then 69 when beta60>beta6068 then 68
				when beta60>beta6067 then 67 when beta60>beta6066 then 66
				when beta60>beta6065 then 65 when beta60>beta6064 then 64
				when beta60>beta6063 then 63 when beta60>beta6062 then 62
				when beta60>beta6061 then 61 when beta60>beta6060 then 60
				when beta60>beta6059 then 59 when beta60>beta6058 then 58
				when beta60>beta6057 then 57 when beta60>beta6056 then 56
				when beta60>beta6055 then 55 when beta60>beta6054 then 54
				when beta60>beta6053 then 53 when beta60>beta6052 then 52
				when beta60>beta6051 then 51 when beta60>beta6050 then 50
				when beta60>beta6049 then 49 when beta60>beta6048 then 48
				when beta60>beta6047 then 47 when beta60>beta6046 then 46
				when beta60>beta6045 then 45 when beta60>beta6044 then 44
				when beta60>beta6043 then 43 when beta60>beta6042 then 42
				when beta60>beta6041 then 41 when beta60>beta6040 then 40
				when beta60>beta6039 then 39 when beta60>beta6038 then 38
				when beta60>beta6037 then 37 when beta60>beta6036 then 36
				when beta60>beta6035 then 35 when beta60>beta6034 then 34
				when beta60>beta6033 then 33 when beta60>beta6032 then 32
				when beta60>beta6031 then 31 when beta60>beta6030 then 30
				when beta60>beta6029 then 29 when beta60>beta6028 then 28
				when beta60>beta6027 then 27 when beta60>beta6026 then 26
				when beta60>beta6025 then 25 when beta60>beta6024 then 24
				when beta60>beta6023 then 23 when beta60>beta6022 then 22
				when beta60>beta6021 then 21 when beta60>beta6020 then 20
				when beta60>beta6019 then 19 when beta60>beta6018 then 18
				when beta60>beta6017 then 17 when beta60>beta6016 then 16
				when beta60>beta6015 then 15 when beta60>beta6014 then 14
				when beta60>beta6013 then 13 when beta60>beta6012 then 12
				when beta60>beta6011 then 11 when beta60>beta6010 then 10
				when beta60>beta609 then 9 when beta60>beta608 then 8
				when beta60>beta607 then 7 when beta60>beta606 then 6
				when beta60>beta605 then 5 when beta60>beta604 then 4
				when beta60>beta603 then 3 when beta60>beta602 then 2
				when beta60>beta601 then 1 else 0 end as beta60
		from beta60 a
			join beta60_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
