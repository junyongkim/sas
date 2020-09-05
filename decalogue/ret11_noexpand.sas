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
	create table ret11 as
		select a.p as permno,
			a.d as date,
			a.r*b.r*c.r*d.r*e.r*f.r*g.r*h.r*i.r*j.r*k.r-1 as ret11
		from r a
			join r b on a.p=b.p and intnx("month",a.d,0)=intnx("month",b.d,1)
			join r c on a.p=c.p and intnx("month",a.d,0)=intnx("month",c.d,2)
			join r d on a.p=d.p and intnx("month",a.d,0)=intnx("month",d.d,3)
			join r e on a.p=e.p and intnx("month",a.d,0)=intnx("month",e.d,4)
			join r f on a.p=f.p and intnx("month",a.d,0)=intnx("month",f.d,5)
			join r g on a.p=g.p and intnx("month",a.d,0)=intnx("month",g.d,6)
			join r h on a.p=h.p and intnx("month",a.d,0)=intnx("month",h.d,7)
			join r i on a.p=i.p and intnx("month",a.d,0)=intnx("month",i.d,8)
			join r j on a.p=j.p and intnx("month",a.d,0)=intnx("month",j.d,9)
			join r k on a.p=k.p and intnx("month",a.d,0)=intnx("month",k.d,10)
		order by permno,date;
quit;

endrsubmit;
