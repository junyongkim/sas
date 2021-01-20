libname d "!userprofile\desktop\sas\decalogue2\bm";
rsubmit;

proc sql;
	create table d.zoom_ret_bm_200 as select
	date+0 as date format=yymmddn8.
	%zoom_r(bm)
	%zoom_s(bm)
	%zoom_t(bm)
	%zoom_u(bm) from
	zoom_ret_bm
	group by date order by date;
quit;

proc download;
run;

endrsubmit;
