libname d "!userprofile\desktop\sas\decalogue2\bm";
rsubmit;

proc sql;
	create table d.zoom_reu_bm_200 as select
	date+0 as date format=yymmddn8.
	%zoom_r(bm)
	%zoom_s(bm) from
	zoom_reu_bm
	group by date order by date;
quit;

proc download;
run;

endrsubmit;
