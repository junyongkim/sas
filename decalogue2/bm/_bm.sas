rsubmit;

proc sql;
	create table d.bm as select
	lpermno,
	datadate,
	(coalesce(seq,ceq+upstk,at-lt)+coalesce(txditc,0)
		-coalesce(pstkrv,pstkl,upstk))/(prcc_c*csho) as bm from
	comp.funda(where=(indfmt="INDL" & consol="C" & popsrc="D" & datafmt="STD"))
		i join
	crsp.ccmxpf_lnkhist(where=(linkprim in ("P","C") & linktype in ("LC","LU")))
		j on i.gvkey=j.gvkey & linkdt<=datadate<=coalesce(linkenddt,2**21)
	group by lpermno,intnx("year.6",datadate,0) having bm>. &
		datadate=max(datadate);
quit;

endrsubmit;
