libname e "!userprofile\desktop\pincette\pipe\";

%http(pipe\MacroFinanceUncertainty_202006_update.zip,https://www.sydneyludvigson.com/s/MacroFinanceUncertainty_202006_update.zip)

data _null_;
	infile 'bandizip x -o:%userprofile%\desktop\pincette\pipe\ -target:auto -y %userprofile%\desktop\pincette\pipe\MacroFinanceUncertainty_202006_update.zip' pipe;
run;

%import(pipe\MacroFinanceUncertainty_202006_update\MacroUncertaintyToCirculate.csv,csv,e.uncertaintymacro)
%import(pipe\MacroFinanceUncertainty_202006_update\RealUncertaintyToCirculate.csv,csv,e.uncertaintyreal)
%import(pipe\MacroFinanceUncertainty_202006_update\FinancialUncertaintyToCirculate.csv,csv,e.uncertaintyfinancial)

%macro pipe01(data);

data e.&data.;
	set e.&data.;
	date=100*year(datepart(date))+month(datepart(date));
	format date;
run;

%mend;

%pipe01(uncertaintymacro)
%pipe01(uncertaintyreal)
%pipe01(uncertaintyfinancial)

%http(pipe\FT_portfolio_sorts-daily-05FEB2020.7z,https://drive.google.com/uc?id=18xFaoM_JX773DB6pjLDHxXW2GWnbc-Sg)
%http(pipe\FT_portfolio_sorts-monthly-05FEB2020.7z,https://drive.google.com/uc?id=19195VlC3wsrX6KKuSYSrRD_V5RS5dbHw)
%http(pipe\SCS_managed_portfolios-daily-05FEB2020.7z,https://drive.google.com/uc?id=19KBuezUe_38KXLmKS6ue6SJMMKSuZE4C)
%http(pipe\SCS_managed_portfolios-monthly-05FEB2020.7z,https://drive.google.com/uc?id=19GkdT_HRsPs94dBJV5NnnmiAKVEOe1lI)

data _null_;
	infile 'bandizip x -o:%userprofile%\desktop\pincette\pipe\ -target:auto -y %userprofile%\desktop\pincette\pipe\FT_portfolio_sorts-daily-05FEB2020.7z' pipe;
	infile 'bandizip x -o:%userprofile%\desktop\pincette\pipe\ -target:auto -y %userprofile%\desktop\pincette\pipe\FT_portfolio_sorts-monthly-05FEB2020.7z' pipe;
	infile 'bandizip x -o:%userprofile%\desktop\pincette\pipe\ -target:auto -y %userprofile%\desktop\pincette\pipe\SCS_managed_portfolios-daily-05FEB2020.7z' pipe;
	infile 'bandizip x -o:%userprofile%\desktop\pincette\pipe\ -target:auto -y %userprofile%\desktop\pincette\pipe\SCS_managed_portfolios-monthly-05FEB2020.7z' pipe;
run;

%macro pipe02(data,infile,input,date);

data e.&data.(drop=q);
	infile "dir /b /s %sysget(userprofile)\desktop\pincette\pipe\&infile." pipe;
	input i $127.;
	file=scan(i,-1,"\");
	infile j filevar=i firstobs=2 dsd truncover end=k;
	do until(k);
		input date &input. +1 p1-p10;
		date=&date.;
		if file=:"r" then do;
			array p(*) p:;
			do q=1 to dim(p);
				p(q)=p(q)*100;
			end;
		end;
		output;
	end;
run;

%mend;

%pipe02(ft_portfolio_sorts_daily,FT_portfolio_sorts-daily-05FEB2020\daily\,mmddyy10.,input(put(date,yymmddn8.),8.))
%pipe02(ft_portfolio_sorts_monthly,FT_portfolio_sorts-monthly-05FEB2020\monthly\,anydtdte7.,100*year(date)+month(date))

%macro pipe03(file,out,date);

proc import file="!userprofile\desktop\pincette\pipe\&file." dbms=csv replace out=e.&out.;
	guessingrows=max;
run;

data e.&out.;
	set e.&out.;
	date=&date.;
	format date;
run;

%mend;

%pipe03(SCS_managed_portfolios-monthly-05FEB2020\managed_portfolios_anom_55.csv,managed_portfolios_anom,100*year(datepart(date))+month(datepart(date)))
%pipe03(SCS_managed_portfolios-daily-05FEB2020\managed_portfolios_anom_d_55.csv,managed_portfolios_anom_d,input(put(date,yymmddn8.),8.))
