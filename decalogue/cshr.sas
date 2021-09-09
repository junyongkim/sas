rsubmit;

proc sql;
	create table cshr as
		select lpermno+0 as lpermno,
			datadate+0 as datadate,
			cshr+0 as cshr
		from comp.funda(where=(indfmt="INDL" and consol="C" and popsrc="D" and datafmt="STD")) a
			join crsp.ccmxpf_lnkhist(where=(linkprim in ("P","C") and linktype in ("LC","LU"))) b
				on a.gvkey=b.gvkey and linkdt<=datadate<=coalesce(linkenddt,"31dec9999"d)
		having cshr>.
		order by lpermno,datadate;
quit;

endrsubmit;
