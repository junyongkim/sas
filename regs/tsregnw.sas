/*************************************************
tsregnw
this code enables macro tsregnw, which estimates
time-series regressions and reports newey-west and
gibbons-ross-shanken stats using portfolios and
factors together
portfolio is long and then long-short returns
factor is factors and then one risk-free
longshort is the number of long-short returns
lag is the number of lags for newey-west stats
outest is a data set of estimates and their stats
date in portfolio and date in factor must match
avoid b0 p0 t0 inside work
avoid tsregnw as macro outside this
*************************************************/

%macro tsregnw(portfolio=,factor=,longshort=,lag=,outest=);

proc sql noprint;
	select date,min(date),max(date) into :dat1 separated by " ",:min1 trimmed,:max1 trimmed from &portfolio. order by date;
	select date,min(date),max(date) into :dat2 separated by " ",:min2 trimmed,:max2 trimmed from &factor. order by date;
quit;

%if &dat1.=&dat2. %then %do;

%local fname n0;

proc iml;
	use &portfolio.(drop=date);
	read all var _all_ into r[colname=rname];
	use &factor.(drop=date);
	read all var _all_ into f[colname=fname];
	l0=&lag.;
	t0=nrow(r);
	n0=ncol(r);
	k=ncol(f)-1;
	if n0>&longshort. then do;
		r[,1:n0-&longshort.]=r[,1:n0-&longshort.]-f[,k+1];
	end;
	f=j(t0,1)||f[,1:k];
	b=r`*f*inv(f`*f);
	e=r-f*b`;
	do n=1 to n0;
		do t=1 to t0;
			if t=1 then q=e[t,n]**2*f[t,]`*f[t,];
			else q=q+e[t,n]**2*f[t,]`*f[t,];
		end;
		if l0 then do l=1 to l0;
			do t=l+1 to t0;
				q=q+(l0+1-l)/(l0+1)*e[t,n]*e[t-l,n]*(f[t,]`*f[t-l,]+f[t-l,]`*f[t,]);
			end;
		end;
		if n=1 then v=sqrt(vecdiag(inv(f`*f)*q*inv(f`*f))`);
		else v=v//sqrt(vecdiag(inv(f`*f)*q*inv(f`*f))`);
	end;
	z=b/v;
	p=2*cdf("t",-abs(z),t);
	if n0>&longshort. then do;
		a=b[1:n0-&longshort.,1];
		s=e[,1:n0-&longshort.]`*e[,1:n0-&longshort.]/t0;
		m=mean(f)`;
		o=cov(f)*(t0-1)/t0;
		g=(t0-n0+&longshort.-k)/(n0-&longshort.)*a`*inv(s)*a/(1+m`*ginv(o)*m);
		q=1-cdf("f",g,n0,t0-n0-k);
		c=a`*diag(1/var(r[,1:n0-&longshort.]))*a;
		a=mean(abs(a));
		print (&min1.)[label="T1" format=best8.] (&max1.)[label="T2" format=best8.]
			,,(n0-&longshort.)[label="N" format=best8.] k[label="K" format=best8.]
			,,a[label="MAPE" format=8.4] c[label="CPE" format=8.4]
			,,g[label="GRS" format=8.4] q[label="P" format=pvalue8.4];
	end;
	else do;
		c=b[,1]`*diag(1/var(r))*b[,1];
		a=mean(abs(b[,1]));
		print (&min1.)[label="T1" format=best8.] (&max1.)[label="T2" format=best8.]
			,,(&longshort.)[label="N" format=best8.] k[label="K" format=best8.]
			,,a[label="MAPE" format=8.4] a[label="CPE" format=8.4];
	end;
	mattrib b format=8.4 z format=parenthesis. p format=asterisk.;
	fname="cons"//fname[1:k];
	create b0 from b[rowname=rname colname=fname];
	append from b[rowname=rname];
	fname="t"+fname;
	create t0 from z[rowname=rname colname=fname];
	append from z[rowname=rname];
	fname="p"+substr(fname,2);
	create p0 from p[rowname=rname colname=fname];
	append from p[rowname=rname];
	fname=compbl(rowcat(rowcat(substr(fname,2)+" "||fname+" "||"t"+substr(fname,2)+" ")`+" "));
	call symputx("fname",fname);
	call symputx("n0",n0);
quit;

data &outest.;
	outest="&outest.";
	t1=&min1.;
	t2=&max1.;
	format t1 t2 best8. rname &fname.;
	merge b0 t0 p0;
run;

proc delete data=b0 t0 p0;
run;

%put NOTE: Dates commensurate (&min1.-&max1., &min2.-&max2.).;
%if &n0.=&longshort. %then %put NOTE: No GRS as all long-short.;

%end;

%else %put ERROR: Dates incommensurate (&min1.-&max1., &min2.-&max2.).;

%mend;
