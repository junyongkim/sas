rsubmit;

proc sql;
	create table res5_rank as
		select permno,
			a.date,
			case when res5>res599 then 99 when res5>res598 then 98
				when res5>res597 then 97 when res5>res596 then 96
				when res5>res595 then 95 when res5>res594 then 94
				when res5>res593 then 93 when res5>res592 then 92
				when res5>res591 then 91 when res5>res590 then 90
				when res5>res589 then 89 when res5>res588 then 88
				when res5>res587 then 87 when res5>res586 then 86
				when res5>res585 then 85 when res5>res584 then 84
				when res5>res583 then 83 when res5>res582 then 82
				when res5>res581 then 81 when res5>res580 then 80
				when res5>res579 then 79 when res5>res578 then 78
				when res5>res577 then 77 when res5>res576 then 76
				when res5>res575 then 75 when res5>res574 then 74
				when res5>res573 then 73 when res5>res572 then 72
				when res5>res571 then 71 when res5>res570 then 70
				when res5>res569 then 69 when res5>res568 then 68
				when res5>res567 then 67 when res5>res566 then 66
				when res5>res565 then 65 when res5>res564 then 64
				when res5>res563 then 63 when res5>res562 then 62
				when res5>res561 then 61 when res5>res560 then 60
				when res5>res559 then 59 when res5>res558 then 58
				when res5>res557 then 57 when res5>res556 then 56
				when res5>res555 then 55 when res5>res554 then 54
				when res5>res553 then 53 when res5>res552 then 52
				when res5>res551 then 51 when res5>res550 then 50
				when res5>res549 then 49 when res5>res548 then 48
				when res5>res547 then 47 when res5>res546 then 46
				when res5>res545 then 45 when res5>res544 then 44
				when res5>res543 then 43 when res5>res542 then 42
				when res5>res541 then 41 when res5>res540 then 40
				when res5>res539 then 39 when res5>res538 then 38
				when res5>res537 then 37 when res5>res536 then 36
				when res5>res535 then 35 when res5>res534 then 34
				when res5>res533 then 33 when res5>res532 then 32
				when res5>res531 then 31 when res5>res530 then 30
				when res5>res529 then 29 when res5>res528 then 28
				when res5>res527 then 27 when res5>res526 then 26
				when res5>res525 then 25 when res5>res524 then 24
				when res5>res523 then 23 when res5>res522 then 22
				when res5>res521 then 21 when res5>res520 then 20
				when res5>res519 then 19 when res5>res518 then 18
				when res5>res517 then 17 when res5>res516 then 16
				when res5>res515 then 15 when res5>res514 then 14
				when res5>res513 then 13 when res5>res512 then 12
				when res5>res511 then 11 when res5>res510 then 10
				when res5>res59 then 9 when res5>res58 then 8
				when res5>res57 then 7 when res5>res56 then 6
				when res5>res55 then 5 when res5>res54 then 4
				when res5>res53 then 3 when res5>res52 then 2
				when res5>res51 then 1 else 0 end as res5
		from res5 a
			join res5_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
