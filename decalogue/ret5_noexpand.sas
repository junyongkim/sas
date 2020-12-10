rsubmit;

proc sql;
	create table r as
		select permno+0 as p,
			date+0 as d,
			ret+1 as r
		from crsp.msf
			where ret>.z;
quit;

proc sql;
	create table ret5 as
		select a.p as permno,
			a.d as date,
			a.r*b.r*c.r*d.r*e.r-1 as ret5
		from r a
			join r b on a.p=b.p and intnx("month",a.d,0)=intnx("month",b.d,1)
			join r c on a.p=c.p and intnx("month",a.d,0)=intnx("month",c.d,2)
			join r d on a.p=d.p and intnx("month",a.d,0)=intnx("month",d.d,3)
			join r e on a.p=e.p and intnx("month",a.d,0)=intnx("month",e.d,4)
		order by permno,date;
quit;

endrsubmit;
