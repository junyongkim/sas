rsubmit;

proc sql;
	create table op_in as
		select a.lpermno,a.datadate,op,in
		from op a join in b on a.lpermno=b.lpermno and a.datadate=b.datadate
		order by lpermno,datadate;
quit;

endrsubmit;
