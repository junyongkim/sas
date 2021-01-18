rsubmit;

proc sql;
	create table d.bm as select
	lpermno,
	datadate,
	(coalesce(seq,ceq+upstk,at-lt)
		+coalesce(txditc,0)
		-coalesce(pstkrv,pstkl,upstk))/(prcc_c*csho) as bm from
	comp.funda(where=(indfmt="INDL" &
		consol="C" &
		popsrc="D" &
		datafmt="STD")) i join
	crsp.ccmxpf_lnkhist(where=(linkprim in ("P","C") &
		linktype in ("LC","LU"))) j on i.gvkey=j.gvkey &
		linkdt<=datadate<=coalesce(linkenddt,"31dec9999"d)
	having bm>.;
quit;

endrsubmit;
