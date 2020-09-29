data companylist;
	infile "https://old.nasdaq.com/screening/companies-by-name.aspx?render=download"
		url
		firstobs=2
		dsd
		truncover;
	input symbol :$9.
		name :$62.
		lastsale :$8.
		marketcap :$9.
		ipoyear :$7.
		sector :$21.
		industry :$62.
		summaryquote :$39.;
run;

data nasdaqlisted;
	infile "nasdaqlisted.txt"
		ftp
		host="ftp.nasdaqtrader.com"
		cd="/symboldirectory/"
		user=anonymous
		passive
		firstobs=2
		dlm="|"
		dsd
		truncover
		end=i;
	input symbol :$5.
		securityname :$100.
		marketcategory :$1.
		testissue :$1.
		financialstatus :$1.
		roundlotsize :$3.
		etf :$1.
		nextshares :$6.;
	if i then delete;
run;
