rsubmit;

proc sql;
	create table ret6_rank as
		select permno,
			a.date,
			case when ret6>ret699 then 99 when ret6>ret698 then 98
				when ret6>ret697 then 97 when ret6>ret696 then 96
				when ret6>ret695 then 95 when ret6>ret694 then 94
				when ret6>ret693 then 93 when ret6>ret692 then 92
				when ret6>ret691 then 91 when ret6>ret690 then 90
				when ret6>ret689 then 89 when ret6>ret688 then 88
				when ret6>ret687 then 87 when ret6>ret686 then 86
				when ret6>ret685 then 85 when ret6>ret684 then 84
				when ret6>ret683 then 83 when ret6>ret682 then 82
				when ret6>ret681 then 81 when ret6>ret680 then 80
				when ret6>ret679 then 79 when ret6>ret678 then 78
				when ret6>ret677 then 77 when ret6>ret676 then 76
				when ret6>ret675 then 75 when ret6>ret674 then 74
				when ret6>ret673 then 73 when ret6>ret672 then 72
				when ret6>ret671 then 71 when ret6>ret670 then 70
				when ret6>ret669 then 69 when ret6>ret668 then 68
				when ret6>ret667 then 67 when ret6>ret666 then 66
				when ret6>ret665 then 65 when ret6>ret664 then 64
				when ret6>ret663 then 63 when ret6>ret662 then 62
				when ret6>ret661 then 61 when ret6>ret660 then 60
				when ret6>ret659 then 59 when ret6>ret658 then 58
				when ret6>ret657 then 57 when ret6>ret656 then 56
				when ret6>ret655 then 55 when ret6>ret654 then 54
				when ret6>ret653 then 53 when ret6>ret652 then 52
				when ret6>ret651 then 51 when ret6>ret650 then 50
				when ret6>ret649 then 49 when ret6>ret648 then 48
				when ret6>ret647 then 47 when ret6>ret646 then 46
				when ret6>ret645 then 45 when ret6>ret644 then 44
				when ret6>ret643 then 43 when ret6>ret642 then 42
				when ret6>ret641 then 41 when ret6>ret640 then 40
				when ret6>ret639 then 39 when ret6>ret638 then 38
				when ret6>ret637 then 37 when ret6>ret636 then 36
				when ret6>ret635 then 35 when ret6>ret634 then 34
				when ret6>ret633 then 33 when ret6>ret632 then 32
				when ret6>ret631 then 31 when ret6>ret630 then 30
				when ret6>ret629 then 29 when ret6>ret628 then 28
				when ret6>ret627 then 27 when ret6>ret626 then 26
				when ret6>ret625 then 25 when ret6>ret624 then 24
				when ret6>ret623 then 23 when ret6>ret622 then 22
				when ret6>ret621 then 21 when ret6>ret620 then 20
				when ret6>ret619 then 19 when ret6>ret618 then 18
				when ret6>ret617 then 17 when ret6>ret616 then 16
				when ret6>ret615 then 15 when ret6>ret614 then 14
				when ret6>ret613 then 13 when ret6>ret612 then 12
				when ret6>ret611 then 11 when ret6>ret610 then 10
				when ret6>ret69 then 9 when ret6>ret68 then 8
				when ret6>ret67 then 7 when ret6>ret66 then 6
				when ret6>ret65 then 5 when ret6>ret64 then 4
				when ret6>ret63 then 3 when ret6>ret62 then 2
				when ret6>ret61 then 1 else 0 end as ret6
		from ret6 a
			join ret6_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
