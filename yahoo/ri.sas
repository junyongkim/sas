proc sql;
	create table ri as
		select i.ticker,i.date,i.adj as ri,j.adj as rm,k.adj as rf
		from adj(where=(ticker^="^gspc" and ticker^="^irx")) i
			join adj(where=(ticker="^gspc")) j on i.date=j.date
			join adj(where=(ticker="^irx")) k on i.date=k.date
		order by ticker,date;
quit;

proc expand method=none out=ri(where=(ri>.));
	by ticker;
	id date;
	convert ri/tout=(pctdif /100);
	convert rm/tout=(pctdif /100);
	convert rf/tout=(/1200);
run;
