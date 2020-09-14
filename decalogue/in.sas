rsubmit;

proc sql;
	create table in as
		select lpermno+0 as lpermno,
			a.datadate+0 as datadate,
			a.at/b.at-1 as in
		from comp.funda(where=(fyear and indfmt="INDL" and consol="C" and popsrc="D" and datafmt="STD" and acctstd="DS")) a
			join comp.funda(where=(fyear and indfmt="INDL" and consol="C" and popsrc="D" and datafmt="STD" and acctstd="DS")) b
				on a.gvkey=b.gvkey and a.fyear=b.fyear+1
			join crsp.ccmxpf_lnkhist(where=(linkprim in ("P","C") and linktype in ("LC","LU"))) c
				on a.gvkey=c.gvkey and linkdt<=a.datadate<=coalesce(linkenddt,"31dec9999"d)
		having in>.
		order by lpermno,datadate;
quit;

endrsubmit;
