rsubmit;

proc sql;
	create table ret5_rank as
		select permno,
			a.date,
			case when ret5>ret599 then 99 when ret5>ret598 then 98
				when ret5>ret597 then 97 when ret5>ret596 then 96
				when ret5>ret595 then 95 when ret5>ret594 then 94
				when ret5>ret593 then 93 when ret5>ret592 then 92
				when ret5>ret591 then 91 when ret5>ret590 then 90
				when ret5>ret589 then 89 when ret5>ret588 then 88
				when ret5>ret587 then 87 when ret5>ret586 then 86
				when ret5>ret585 then 85 when ret5>ret584 then 84
				when ret5>ret583 then 83 when ret5>ret582 then 82
				when ret5>ret581 then 81 when ret5>ret580 then 80
				when ret5>ret579 then 79 when ret5>ret578 then 78
				when ret5>ret577 then 77 when ret5>ret576 then 76
				when ret5>ret575 then 75 when ret5>ret574 then 74
				when ret5>ret573 then 73 when ret5>ret572 then 72
				when ret5>ret571 then 71 when ret5>ret570 then 70
				when ret5>ret569 then 69 when ret5>ret568 then 68
				when ret5>ret567 then 67 when ret5>ret566 then 66
				when ret5>ret565 then 65 when ret5>ret564 then 64
				when ret5>ret563 then 63 when ret5>ret562 then 62
				when ret5>ret561 then 61 when ret5>ret560 then 60
				when ret5>ret559 then 59 when ret5>ret558 then 58
				when ret5>ret557 then 57 when ret5>ret556 then 56
				when ret5>ret555 then 55 when ret5>ret554 then 54
				when ret5>ret553 then 53 when ret5>ret552 then 52
				when ret5>ret551 then 51 when ret5>ret550 then 50
				when ret5>ret549 then 49 when ret5>ret548 then 48
				when ret5>ret547 then 47 when ret5>ret546 then 46
				when ret5>ret545 then 45 when ret5>ret544 then 44
				when ret5>ret543 then 43 when ret5>ret542 then 42
				when ret5>ret541 then 41 when ret5>ret540 then 40
				when ret5>ret539 then 39 when ret5>ret538 then 38
				when ret5>ret537 then 37 when ret5>ret536 then 36
				when ret5>ret535 then 35 when ret5>ret534 then 34
				when ret5>ret533 then 33 when ret5>ret532 then 32
				when ret5>ret531 then 31 when ret5>ret530 then 30
				when ret5>ret529 then 29 when ret5>ret528 then 28
				when ret5>ret527 then 27 when ret5>ret526 then 26
				when ret5>ret525 then 25 when ret5>ret524 then 24
				when ret5>ret523 then 23 when ret5>ret522 then 22
				when ret5>ret521 then 21 when ret5>ret520 then 20
				when ret5>ret519 then 19 when ret5>ret518 then 18
				when ret5>ret517 then 17 when ret5>ret516 then 16
				when ret5>ret515 then 15 when ret5>ret514 then 14
				when ret5>ret513 then 13 when ret5>ret512 then 12
				when ret5>ret511 then 11 when ret5>ret510 then 10
				when ret5>ret59 then 9 when ret5>ret58 then 8
				when ret5>ret57 then 7 when ret5>ret56 then 6
				when ret5>ret55 then 5 when ret5>ret54 then 4
				when ret5>ret53 then 3 when ret5>ret52 then 2
				when ret5>ret51 then 1 else 0 end as ret5
		from ret5 a
			join ret5_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
