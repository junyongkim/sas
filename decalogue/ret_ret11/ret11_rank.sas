rsubmit;

proc sql;
	create table ret11_rank as
		select permno,
			a.date,
			case when ret11>ret1199 then 99 when ret11>ret1198 then 98
				when ret11>ret1197 then 97 when ret11>ret1196 then 96
				when ret11>ret1195 then 95 when ret11>ret1194 then 94
				when ret11>ret1193 then 93 when ret11>ret1192 then 92
				when ret11>ret1191 then 91 when ret11>ret1190 then 90
				when ret11>ret1189 then 89 when ret11>ret1188 then 88
				when ret11>ret1187 then 87 when ret11>ret1186 then 86
				when ret11>ret1185 then 85 when ret11>ret1184 then 84
				when ret11>ret1183 then 83 when ret11>ret1182 then 82
				when ret11>ret1181 then 81 when ret11>ret1180 then 80
				when ret11>ret1179 then 79 when ret11>ret1178 then 78
				when ret11>ret1177 then 77 when ret11>ret1176 then 76
				when ret11>ret1175 then 75 when ret11>ret1174 then 74
				when ret11>ret1173 then 73 when ret11>ret1172 then 72
				when ret11>ret1171 then 71 when ret11>ret1170 then 70
				when ret11>ret1169 then 69 when ret11>ret1168 then 68
				when ret11>ret1167 then 67 when ret11>ret1166 then 66
				when ret11>ret1165 then 65 when ret11>ret1164 then 64
				when ret11>ret1163 then 63 when ret11>ret1162 then 62
				when ret11>ret1161 then 61 when ret11>ret1160 then 60
				when ret11>ret1159 then 59 when ret11>ret1158 then 58
				when ret11>ret1157 then 57 when ret11>ret1156 then 56
				when ret11>ret1155 then 55 when ret11>ret1154 then 54
				when ret11>ret1153 then 53 when ret11>ret1152 then 52
				when ret11>ret1151 then 51 when ret11>ret1150 then 50
				when ret11>ret1149 then 49 when ret11>ret1148 then 48
				when ret11>ret1147 then 47 when ret11>ret1146 then 46
				when ret11>ret1145 then 45 when ret11>ret1144 then 44
				when ret11>ret1143 then 43 when ret11>ret1142 then 42
				when ret11>ret1141 then 41 when ret11>ret1140 then 40
				when ret11>ret1139 then 39 when ret11>ret1138 then 38
				when ret11>ret1137 then 37 when ret11>ret1136 then 36
				when ret11>ret1135 then 35 when ret11>ret1134 then 34
				when ret11>ret1133 then 33 when ret11>ret1132 then 32
				when ret11>ret1131 then 31 when ret11>ret1130 then 30
				when ret11>ret1129 then 29 when ret11>ret1128 then 28
				when ret11>ret1127 then 27 when ret11>ret1126 then 26
				when ret11>ret1125 then 25 when ret11>ret1124 then 24
				when ret11>ret1123 then 23 when ret11>ret1122 then 22
				when ret11>ret1121 then 21 when ret11>ret1120 then 20
				when ret11>ret1119 then 19 when ret11>ret1118 then 18
				when ret11>ret1117 then 17 when ret11>ret1116 then 16
				when ret11>ret1115 then 15 when ret11>ret1114 then 14
				when ret11>ret1113 then 13 when ret11>ret1112 then 12
				when ret11>ret1111 then 11 when ret11>ret1110 then 10
				when ret11>ret119 then 9 when ret11>ret118 then 8
				when ret11>ret117 then 7 when ret11>ret116 then 6
				when ret11>ret115 then 5 when ret11>ret114 then 4
				when ret11>ret113 then 3 when ret11>ret112 then 2
				when ret11>ret111 then 1 else 0 end as ret11
		from ret11 a
			join ret11_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
