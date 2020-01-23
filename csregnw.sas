/*************************************************
csregnw
this code enables macro csregnw, which estimates
cross-sectional regressions and reports various
ols, gls, gmm, and emm stats using portfolios and
factors together
portfolio is long and then long-short returns
factor is factors and then one risk-free
longshort is the number of long-short returns
lag is the number of lags for newey-west stats
outest is a data set of estimates and their stats
date in portfolio and date in factor must match
avoid csregnw as macro outside this
*************************************************/

%macro csregnw(portfolio=,factor=,longshort=,lag=,outest=);

proc sql noprint;
	select date,min(date),max(date) into :dat1 separated by " ",:min1 trimmed,:max1 trimmed from &portfolio. order by date;
	select date,min(date),max(date) into :dat2 separated by " ",:min2 trimmed,:max2 trimmed from &factor. order by date;
quit;

%if &dat1.=&dat2. %then %do;

proc format;
	picture asterisk (fuzz=0 round) low-<0="LOW " 0-0.01="*** " 0.01<-0.05="**  " 0.05<-0.1="*   " 0.1<-1="    " 1<-high="HIGH";
	picture parenthesis (fuzz=0 round) low--99.995="NEGATIVE" -99.995<-0="0009.00)" (prefix="(-") 0-<999.995="0009.00)" (prefix="(") 999.995-high="POSITIVE";
run;

%local n k;

proc iml;
	use &portfolio.(drop=date);
	read all var _all_ into r[colname=rname];
	use &factor.(drop=date);
	read all var _all_ into f[colname=fname];
	l0=&lag.;
	t=nrow(r);
	n=ncol(r);
	call symputx("n",n);
	k=ncol(f)-1;
	call symputx("k",k);
	%if %eval(&n.-&longshort.)>%eval(&k.+2) %then %do;
	n=n-&longshort.;
	r=r[,1:n]-f[,k+1];
	f=f[,1:k];
	rm=mean(r)`;
	rv=cov(r)*(t-1)/t;
	f=j(t,1)||f;
	fm=mean(f)`;
	fv=cov(f)*(t-1)/t;
	b=inv(f`*f)*f`*r;
	a=b[1,]`;
	am=mean(abs(a));
	an=a`*diag(1/var(r))*a;
	u=r-f*b;
	br=mean(1-var(u)`/var(r)`);
	s=cov(u)*(t-1)/t;
	grs=(t-n-k)/n*a`*inv(s)*a/(1+fm`*ginv(fv)*fm);
	grsp=1-cdf("f",grs,n,t-n-k);
	b=j(n,1)||b[2:k+1,]`;
	o=inv(b`*b)*b`*rm;
	ov=(inv(b`*b)*b`*s*b*inv(b`*b)*(1+o`*ginv(fv)*o)+fv)/t;
	ot=o/sqrt(vecdiag(ov));
	ou=hdir(f,u)||r-o`*b`;
	oa=block(i(n*(k+1)),b`);
	od=-block(f`*f/t@i(n),b);
	od[n*(k+1)+1:n*(k+2),1:n*k]=-o[1:k]`@i(n);
	os=ou`*ou/t;
	do l=1 to l0;
		os=os+(ou[1:t-l,]`*ou[1+l:t,]+ou[1+l:t,]`*ou[1:t-l,])/t*(l0+1-l)/(l0+1);
	end;
	ow=inv(oa*od)*oa*os*oa`*inv(oa*od)`/t;
	oz=o/sqrt(vecdiag(ow)[n*(k+1)+1:(n+1)*(k+1)]);
	c=rm-b*o;
	cm=mean(abs(c));
	cn=c`*diag(1/var(r))*c;
	cv=(i(n)-b*inv(b`*b)*b`)*s*(i(n)-b*inv(b`*b)*b`)*(1+o`*ginv(fv)*o)/t;
	cc=c`*ginv(cv)*c;
	cp=1-cdf("chisq",cc,n-k);
	cw=(i(n*(k+2))-od*inv(oa*od)*oa)*os*(i(n*(k+2))-od*inv(oa*od)*oa)`/t;
	cd=mean(ou)*ginv(cw)*mean(ou)`;
	cq=1-cdf("chisq",cd,n-k-1);
	or=1-var(c)/var(rm);
	g=inv(b`*inv(s)*b)*b`*inv(s)*rm;
	gv=(inv(b`*inv(s)*b)*(1+g`*ginv(fv)*g)+fv)/t;
	gt=g/sqrt(vecdiag(gv));
	gu=hdir(f,u)||r-g`*b`;
	ga=block(i(n*(k+1)),b`*inv(s));
	gd=-block(f`*f/t@i(n),inv(s)*b);
	gd[n*(k+1)+1:n*(k+2),1:n*k]=-g[1:k]`@i(n);
	gs=gu`*gu/t;
	do l=1 to l0;
		gs=gs+(gu[1:t-l,]`*gu[1+l:t,]+gu[1+l:t,]`*gu[1:t-l,])/t*(l0+1-l)/(l0+1);
	end;
	gw=inv(ga*gd)*ga*gs*ga`*inv(ga*gd)`/t;
	gz=g/sqrt(vecdiag(gw)[n*(k+1)+1:(n+1)*(k+1)]);
	gc=rm-b*g;
	d=rm-b*g;
	dm=mean(abs(d));
	dn=d`*diag(1/var(r))*d;
	dv=(s-b*inv(b`*inv(s)*b)*b`)*(1+g`*ginv(fv)*g)/t;
	dc=d`*ginv(dv)*d;
	dp=1-cdf("chisq",dc,n-k);
	dw=(i(n*(k+2))-gd*inv(ga*gd)*ga)*gs*(i(n*(k+2))-gd*inv(ga*gd)*ga)`/t;
	dd=mean(gu)*ginv(dw)*mean(gu)`;
	dq=1-cdf("chisq",dd,n-k-1);
	gr=inv(j(1,n)*inv(s)*j(n,1))*j(1,n)*inv(s)*rm;
	gr=rm-gr;
	gr=1-d`*inv(rv)*d/(gr`*inv(rv)*gr);
	r=r/100;
	rm=rm/100;
	f=f[,2:k+1]/100;
	hd=r`*f/t;
	hw=inv(r`*r/t);
	hb=inv(hd`*hw*hd)*hd`*hw*rm;
	hu=-hdir(1-f*hb,r);
	hs=hu`*hu/t;
	do l=1 to l0;
		hs=hs+(hu[1:t-l,]`*hu[1+l:t,]+hu[1+l:t,]`*hu[1:t-l,])/t*(l0+1-l)/(l0+1);
	end;
	hv=inv(hd`*hw*hd)*hd`*hw*hs*hw*hd*inv(hd`*hw*hd)/t;
	hz=hb/sqrt(vecdiag(hv));
	hj=sqrt(mean(hu)*hw*mean(hu)`);
	hjp=root(hs)*root(hw)`*(i(n)-root(hw)*hd*inv(hd`*hw*hd)*hd`*root(hw)`)*root(hw)*root(hs)`;
	call randseed(1);
	hjp=mean(randfun(5000||n-k,"chisq",1)*eigval(hjp)[1:n-k]>t*hj**2);
	eb=inv(hd`*inv(hs)*hd)*hd`*inv(hs)*rm;
	eu=-hdir(1-f*eb,r);
	ev=inv(hd`*inv(hs)*hd)/t;
	ez=eb/sqrt(vecdiag(ev));
	sh=t*mean(eu)*inv(hs)*mean(eu)`;
	shp=1-cdf("chisq",sh,n-k);
	mattrib x format=8.4;
	x=min({&dat1.})||max({&dat1.})||n||k
		||shape(o||ot||oz,1)||shape(g||gt||gz,1)
		||shape(hb||hz,1)||shape(eb||ez,1)
		||grs||grsp
		||cc||cp||cd||cq
		||dc||dp||dd||dq
		||hj||hjp||sh||shp
		||br||am||an||or||cm||cn||gr||dm||dn;
	y="cons"//fname[1:k];
	z="T1"||"T2"||"N"||"K"
		||shape("ols_"+y||"t_ols_"+y||"z_ols_"+y,1)||shape("gls_"+y||"t_gls_"+y||"z_gls_"+y,1)
		||shape("gmm_"+y[2:k+1,]||"z_gmm_"+y[2:k+1,],1)||shape("emm_"+y[2:k+1,]||"z_emm_"+y[2:k+1,],1)
		||"grs"||"p_grs"
		||"c2s_ols"||"p_c2s_ols"||"c2g_ols"||"p_c2gols"
		||"c2s_gls"||"p_c2sgls"||"c2g_gls"||"p_c2g_gls"
		||"hj_gmm"||"p_hj_gmm"||"sh_emm"||"p_sh_emm"
		||"rsq_ts"||"mpe_ts"||"cpe_ts"||"rsq_ols"||"mpe_ols"||"cpe_ols"||"rsq_gls"||"mpe_gls"||"cpe_gls";
	outest="&outest.";
	create &outest. from x[colname=z rowname=outest];
	append from x[rowname=outest];
	print (&min1.)[label="T1" format=best8.] (&max1.)[label="T2" format=best8.]
		,,n[label="N" format=best8.] k[label="K" format=best8.]
		,,am[label="MAPE" format=8.4] an[label="CPE" format=8.4]
		,,grs[label="GRS" format=8.4] grsp[label="P" format=pvalue8.4];
quit;

data &outest.;
	set &outest.;
	format t1 t2 n k best8. t_: z_: parenthesis. p_: asterisk.;
run;

%put NOTE: Dates commensurate (&min1.-&max1., &min2.-&max2.).;

%end;

%else %do;
quit;

%put ERROR: Too many long-short (&longshort., must be <&n.-&k.-2).;

%end;

%end;

%else %put ERROR: Dates incommensurate (&min1.-&max1., &min2.-&max2.).;

%mend;
