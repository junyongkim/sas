proc iml;
	use ri(where=(&j.<=date<=&k.));
	read all var _all_;
	ticker=upcase(unique(ticker))`;
	n=nrow(ticker);
	t=nrow(ri)/n;
	ri=shape(ri,n)`;
	mu=mean(ri)`*12;
	omega=cov(ri)*12;
	sigma=sqrt(vecdiag(omega));
/*----------------------------------------------*/
	i=j(n,1);
	wmin=inv(omega)*i/(i`*inv(omega)*i);
	t2="Min";
	m2=wmin`*mu;
	s2=sqrt(wmin`*omega*wmin);
/*----------------------------------------------*/
	rf=rf[1:t];
	t2=t2//"Rf";
	m2=m2//mean(rf)*12;
	s2=s2//0;
/*----------------------------------------------*/
	m=mu-m2[2]*i;
	wmax=inv(omega)*m/(i`*inv(omega)*m);
	t2=t2//"Max";
	m2=m2//wmax`*mu;
	s2=s2//sqrt(wmax`*omega*wmax);
/*----------------------------------------------*/
	start sharpe(w) global(m,omega);
		return(w*m/sqrt(w*omega*w`));
	finish;
	k=(j(1,n,0)||{. .})//
		(j(1,n,1)||{. .})//
		(j(1,n,1)||{0 1});
	call nlpqn(j,wlong,"sharpe",j(n,1,0),1,k);
	t2=t2//"Long";
	m2=m2//wlong*mu;
	s2=s2//sqrt(wlong*omega*wlong`);
	date=date[1:t];
	yymm=year(date)*100+month(date);
	max=ri*wmax;
	long=ri*wlong`;
	create max var{date yymm max long rf};
	append;
/*----------------------------------------------*/
	do l=-2 to 3 by 0.1;
		wpo=l*wmax+(1-l)*wmin;
		if l=-1 then m3=wpo`*mu;
		else m3=m3//wpo`*mu;
		if l=-1 then s3=sqrt(wpo`*omega*wpo);
		else s3=s3//sqrt(wpo`*omega*wpo);
	end;
/*----------------------------------------------*/
	call symputx("l",m2[2]);
	call symputx("m",(m2[3]-m2[2])/s2[3]);
	call symputx("n",(m2[4]-m2[2])/s2[4]);
	create front var{ticker mu sigma t2 m2 s2 m3 s3};
	append;
quit;

proc export data=max replace file="!userprofile\desktop\max.csv";
run;

ods results=off;
ods listing gpath="!userprofile\desktop\";
ods graphics/reset imagename="front" width=1024px height=768px noborder;

proc sgplot data=front noborder noautolegend;
	lineparm x=0 y=0 slope=0/lineattrs=(color=lime);
	text x=sigma y=mu text=ticker/textattrs=(color=red);
	text x=s2 y=m2 text=t2/textattrs=(color=blue);
	lineparm x=0 y=&l. slope=&m./lineattrs=(color=blue);
	series x=s3 y=m3/lineattrs=(color=red);
	xaxis label="Sigma" values=(0 to 0.5 by 0.1);
	yaxis label="Mu" values=(-0.1 to 0.4 by 0.1);
	inset "The Maximum (long-only) Sharpe ratio
 from %cmpres(%sysfunc(putn(&j.,yymmn6.)))
 to %cmpres(%sysfunc(putn(&k.,yymmn6.)))
 is %cmpres(%sysfunc(putn(&m.,8.2)))
 (%cmpres(%sysfunc(putn(&n.,8.2))))."
"%upcase(&i.)."/position=topleft;
quit;

ods graphics/reset;
ods listing gpath=none;
ods results=on;
