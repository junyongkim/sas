libname d "!userprofile\desktop\sas\decalogue2\ret11";
rsubmit;

proc sql;
	create table d.zoom_ret_ret11_200 as select
	date+0 as date format=yymmddn8.
	%zoom_r(ret11)
	%zoom_s(ret11)
	%zoom_t(ret11)
	%zoom_u(ret11) from
	zoom_ret_ret11
	group by date order by date;
quit;

proc download;
run;

endrsubmit;
