rsubmit;

proc sql;
	create table res11_rank as
		select permno,
			a.date,
			case when res11>res1199 then 99 when res11>res1198 then 98
				when res11>res1197 then 97 when res11>res1196 then 96
				when res11>res1195 then 95 when res11>res1194 then 94
				when res11>res1193 then 93 when res11>res1192 then 92
				when res11>res1191 then 91 when res11>res1190 then 90
				when res11>res1189 then 89 when res11>res1188 then 88
				when res11>res1187 then 87 when res11>res1186 then 86
				when res11>res1185 then 85 when res11>res1184 then 84
				when res11>res1183 then 83 when res11>res1182 then 82
				when res11>res1181 then 81 when res11>res1180 then 80
				when res11>res1179 then 79 when res11>res1178 then 78
				when res11>res1177 then 77 when res11>res1176 then 76
				when res11>res1175 then 75 when res11>res1174 then 74
				when res11>res1173 then 73 when res11>res1172 then 72
				when res11>res1171 then 71 when res11>res1170 then 70
				when res11>res1169 then 69 when res11>res1168 then 68
				when res11>res1167 then 67 when res11>res1166 then 66
				when res11>res1165 then 65 when res11>res1164 then 64
				when res11>res1163 then 63 when res11>res1162 then 62
				when res11>res1161 then 61 when res11>res1160 then 60
				when res11>res1159 then 59 when res11>res1158 then 58
				when res11>res1157 then 57 when res11>res1156 then 56
				when res11>res1155 then 55 when res11>res1154 then 54
				when res11>res1153 then 53 when res11>res1152 then 52
				when res11>res1151 then 51 when res11>res1150 then 50
				when res11>res1149 then 49 when res11>res1148 then 48
				when res11>res1147 then 47 when res11>res1146 then 46
				when res11>res1145 then 45 when res11>res1144 then 44
				when res11>res1143 then 43 when res11>res1142 then 42
				when res11>res1141 then 41 when res11>res1140 then 40
				when res11>res1139 then 39 when res11>res1138 then 38
				when res11>res1137 then 37 when res11>res1136 then 36
				when res11>res1135 then 35 when res11>res1134 then 34
				when res11>res1133 then 33 when res11>res1132 then 32
				when res11>res1131 then 31 when res11>res1130 then 30
				when res11>res1129 then 29 when res11>res1128 then 28
				when res11>res1127 then 27 when res11>res1126 then 26
				when res11>res1125 then 25 when res11>res1124 then 24
				when res11>res1123 then 23 when res11>res1122 then 22
				when res11>res1121 then 21 when res11>res1120 then 20
				when res11>res1119 then 19 when res11>res1118 then 18
				when res11>res1117 then 17 when res11>res1116 then 16
				when res11>res1115 then 15 when res11>res1114 then 14
				when res11>res1113 then 13 when res11>res1112 then 12
				when res11>res1111 then 11 when res11>res1110 then 10
				when res11>res119 then 9 when res11>res118 then 8
				when res11>res117 then 7 when res11>res116 then 6
				when res11>res115 then 5 when res11>res114 then 4
				when res11>res113 then 3 when res11>res112 then 2
				when res11>res111 then 1 else 0 end as res11
		from res11 a
			join res11_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
