rsubmit;

proc sql;
	create table exchcd as
		select permno+0 as permno,
			namedt+0 as namedt,
			ifn(namedt<max(namedt),nameendt,intnx("month",nameendt,0,"end")) as nameendt,
			exchcd+0 as exchcd
		from crsp.msenames
			where shrcd in (10,11)
		group by permno
		order by permno,namedt;
quit;

endrsubmit;
