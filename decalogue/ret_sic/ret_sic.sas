rsubmit;

data j;
	set crsp.msenames;
	where 10<=shrcd<=11;
	by permno namedt;
	if last.permno then nameendt=intnx("month",nameendt,0,"end");
	do i=5,10,12,17,30,38,48,49;
		output;
	end;
run;

proc sql;
	create table j as
		select permno,namedt,nameendt,i,coalesce(portfolio_id,i) as j,
			coalesce(lowcase(portfolio_name),"other") as k
		from i left join siccodes
			on sic_first<=siccd<=sic_last & i=number_of_portfolios;
quit;

proc sql;
	create table ret_sic as
		select i.*,i,j,k
		from ret i join j on i.permno=j.permno and namedt<=date<=nameendt
		order by date,i,j;
quit;

endrsubmit;
