rsubmit;

proc sql;
	create table mecshr as
		select lpermno+0 as lpermno,
			datadate+0 as datadate,
			prcc_c*csho/cshr/1000 as mecshr
		from comp.funda(where=(indfmt="INDL" and consol="C" and popsrc="D" and datafmt="STD")) a
			join crsp.ccmxpf_lnkhist(where=(linkprim in ("P","C") and linktype in ("LC","LU"))) b
				on a.gvkey=b.gvkey and linkdt<=datadate<=coalesce(linkenddt,"31dec9999"d)
		having mecshr>.
		order by lpermno,datadate;
quit;

endrsubmit;
