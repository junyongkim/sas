/*************************************************
csregsg
this code enables macro csregsg, which estimates
cross-sectional regressions and reports various
ols, gls, gmm, and emm stats using portfolios and
factors together
portfolio is long and then long-short returns
factor is factors and then one risk-free
longshort is the number of long-short returns
out is a data set of estimates
gpath is the image location (unless omitted)
imagename is the image name (unless omitted)
gpath2 is the gls image location (unless omitted)
imagename2 is the gls image name (unless omitted)
imagefmt is the image format (default png)
date in portfolio and date in factor must match
avoid csregsg as macro outside this
*************************************************/

%macro csregsg(portfolio=,factor=,longshort=,out=,gpath=,imagename=,gpath2=,imagename2=,imagefmt=);

proc sql noprint;
	select date,min(date),max(date) into :dat1 separated by " ",:min1 trimmed,:max1 trimmed from &portfolio. order by date;
	select date,min(date),max(date) into :dat2 separated by " ",:min2 trimmed,:max2 trimmed from &factor. order by date;
quit;

%if &dat1.=&dat2. %then %do;

%local n k fname min max grs grs_p chio chio_p rsquare_o mape_o chig chig_p rsquare_g mape_g;

proc iml;
	use &portfolio.(drop=date);
	read all var _all_ into r[colname=rname];
	use &factor.(drop=date);
	read all var _all_ into f[colname=fname];
	t=nrow(r);
	n=ncol(r);
	call symputx("n",n);
	k=ncol(f)-1;
	call symputx("k",k);
	call symputx("fname",compbl(rowcat(fname[1:k]`+" ")));
	%if %eval(&n.-&longshort.)>%eval(&k.+2) %then %do;
	n=n-&longshort.;
	re=r[,1:n]-f[,k+1];
	f=j(t,1)||f[,1:k];
	omega=(f-mean(f))`*(f-mean(f))/t;
	rbare=mean(re)`;
	beta=re`*f*inv(f`*f);
	sigma=(re-f*beta`)`*(re-f*beta`)/t;
	grs=(t-n-k)/n*beta[,1]`*inv(sigma)*beta[,1]/(1+mean(f)*ginv(omega)*mean(f)`);
	grs_p=1-probf(grs,n,t-n-k);
	mape_t=mean(abs(beta[,1]));
	cpe_t=beta[,1]`*diag(1/var(re))*beta[,1];
	beta[,1]=j(n,1);
	lambda_o=inv(beta`*beta)*beta`*rbare;
	lambda_o_v=(inv(beta`*beta)*beta`*sigma*beta*inv(beta`*beta)*(1+lambda_o`*ginv(omega)*lambda_o)+omega)/t;
	lambda_o_t=lambda_o/sqrt(vecdiag(lambda_o_v));
	alpha_o=rbare-beta*lambda_o;
	alpha_o_v=(i(n)-beta*inv(beta`*beta)*beta`)*sigma*(i(n)-beta*inv(beta`*beta)*beta`)*(1+lambda_o`*ginv(omega)*lambda_o)/t;
	mape_o=mean(abs(alpha_o));
	rsquare_o=var(beta*lambda_o)/var(rbare);
	chio=alpha_o`*ginv(alpha_o_v)*alpha_o;
	chio_p=1-probchi(chio,n-k);
	lambda_g=inv(beta`*inv(sigma)*beta)*beta`*inv(sigma)*rbare;
	lambda_g_v=(inv(beta`*inv(sigma)*beta)*(1+lambda_g`*ginv(omega)*lambda_g)+omega)/t;
	lambda_g_t=lambda_g/sqrt(vecdiag(lambda_g_v));
	alpha_g=rbare-beta*lambda_g;
	alpha_g0=rbare-beta[,1]*inv(beta[,1]`*inv(sigma)*beta[,1])*beta[,1]`*inv(sigma)*rbare;
	alpha_g_v=(sigma-beta*inv(beta`*inv(sigma)*beta)*beta`)*(1+lambda_g`*ginv(omega)*lambda_g)/t;
	mape_g=mean(abs(alpha_g));
	rsquare_g=1-alpha_g`*inv(sigma)*alpha_g/(alpha_g0`*inv(sigma)*alpha_g0);
	chig=alpha_g`*ginv(alpha_g_v)*alpha_g;
	chig_p=1-probchi(chig,n-k);
	out=beta*lambda_o||beta*lambda_g||rbare;
	call symputx("min",min(out));
	call symputx("max",max(out));
	mattrib out format=8.4;
	create &out. from out[rowname=rname colname={"ols","gls","real"}];
	append from out[rowname=rname];
	call symputx("grs",grs);
	call symputx("grs_p",grs_p);
	call symputx("chio",chio);
	call symputx("chio_p",chio_p);
	call symputx("rsquare_o",rsquare_o);
	call symputx("mape_o",mape_o);
	call symputx("chig",chig);
	call symputx("chig_p",chig_p);
	call symputx("rsquare_g",rsquare_g);
	call symputx("mape_g",mape_g);
	print (&min1.)[label="T1" format=best8.] (&max1.)[label="T2" format=best8.]
		,,n[label="N" format=best8.] k[label="K" format=best8.]
		,,mape_t[label="MAPE" format=8.4] cpe_t[label="CPE" format=8.4]
		,,grs[label="GRS" format=8.4] grs_p[label="P" format=pvalue8.4];
quit;

data &out.;
	out="&out.";
	t1=&min1.;
	t2=&max1.;
	format t1 t2 best8.;
	set &out.;
run;

%if &gpath.= or &imagename.= %then %do;

%end;

%else %do;

ods listing gpath=&gpath.;
ods graphics/reset noborder imagename=&imagename. imagefmt=&imagefmt. width=6.5in height=4.875in;
option topmargin=0.001in bottommargin=0.001in leftmargin=0.001in rightmargin=0.001in;
ods results=off;

proc sgplot noautolegend noborder;
	text x=ols y=real text=rname;
	xaxis min=&min. max=&max. display=(nolabel);
	yaxis min=&min. max=&max. display=(nolabel);
	lineparm x=0 y=0 slope=1;
	inset "OLS Cross-Sectional" "&fname.";
	inset ("T1"="%sysfunc(putn(&min1.,best8.))"
		"T2"="%sysfunc(putn(&max1.,best8.))"
		"RSQ"="%sysfunc(putn(&rsquare_o.,8.4))"
		"MPE"="%sysfunc(putn(&mape_o.,8.4))"
		"GRS"="%sysfunc(putn(&grs.,parenthesis.))%sysfunc(putn(&grs_p.,asterisk.))"
		"CHI"="%sysfunc(putn(&chio.,parenthesis.))%sysfunc(putn(&chio_p.,asterisk.))");
run;

%end;

%if &gpath2.= or &imagename2.= %then %do;

%end;

%else %do;

ods listing gpath=&gpath2.;
ods graphics/reset noborder imagename=&imagename2. imagefmt=&imagefmt. width=6.5in height=4.875in;
option topmargin=0.001in bottommargin=0.001in leftmargin=0.001in rightmargin=0.001in;
ods results=off;

proc sgplot noautolegend noborder;
	text x=gls y=real text=rname;
	xaxis min=&min. max=&max. display=(nolabel);
	yaxis min=&min. max=&max. display=(nolabel);
	lineparm x=0 y=0 slope=1;
	inset "GLS Cross-Sectional" "&fname.";
	inset ("T1"="%sysfunc(putn(&min1.,best8.))"
		"T2"="%sysfunc(putn(&max1.,best8.))"
		"RSQ"="%sysfunc(putn(&rsquare_g.,8.4))"
		"MPE"="%sysfunc(putn(&mape_g.,8.4))"
		"GRS"="%sysfunc(putn(&grs.,parenthesis.))%sysfunc(putn(&grs_p.,asterisk.))"
		"CHI"="%sysfunc(putn(&chig.,parenthesis.))%sysfunc(putn(&chig_p.,asterisk.))");
run;

%end;

ods results=on;
%put NOTE: Dates commensurate (&min1.-&max1., &min2.-&max2.).;

%end;

%else %do;
quit;

%put ERROR: Too many long-short (&longshort., must be <&n.-&k.-2).;

%end;

%end;

%else %put ERROR: Dates incommensurate (&min1.-&max1., &min2.-&max2.).;

%mend;
