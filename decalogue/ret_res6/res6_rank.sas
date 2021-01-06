rsubmit;

proc sql;
	create table res6_rank as
		select permno,
			a.date,
			case when res6>res699 then 99 when res6>res698 then 98
				when res6>res697 then 97 when res6>res696 then 96
				when res6>res695 then 95 when res6>res694 then 94
				when res6>res693 then 93 when res6>res692 then 92
				when res6>res691 then 91 when res6>res690 then 90
				when res6>res689 then 89 when res6>res688 then 88
				when res6>res687 then 87 when res6>res686 then 86
				when res6>res685 then 85 when res6>res684 then 84
				when res6>res683 then 83 when res6>res682 then 82
				when res6>res681 then 81 when res6>res680 then 80
				when res6>res679 then 79 when res6>res678 then 78
				when res6>res677 then 77 when res6>res676 then 76
				when res6>res675 then 75 when res6>res674 then 74
				when res6>res673 then 73 when res6>res672 then 72
				when res6>res671 then 71 when res6>res670 then 70
				when res6>res669 then 69 when res6>res668 then 68
				when res6>res667 then 67 when res6>res666 then 66
				when res6>res665 then 65 when res6>res664 then 64
				when res6>res663 then 63 when res6>res662 then 62
				when res6>res661 then 61 when res6>res660 then 60
				when res6>res659 then 59 when res6>res658 then 58
				when res6>res657 then 57 when res6>res656 then 56
				when res6>res655 then 55 when res6>res654 then 54
				when res6>res653 then 53 when res6>res652 then 52
				when res6>res651 then 51 when res6>res650 then 50
				when res6>res649 then 49 when res6>res648 then 48
				when res6>res647 then 47 when res6>res646 then 46
				when res6>res645 then 45 when res6>res644 then 44
				when res6>res643 then 43 when res6>res642 then 42
				when res6>res641 then 41 when res6>res640 then 40
				when res6>res639 then 39 when res6>res638 then 38
				when res6>res637 then 37 when res6>res636 then 36
				when res6>res635 then 35 when res6>res634 then 34
				when res6>res633 then 33 when res6>res632 then 32
				when res6>res631 then 31 when res6>res630 then 30
				when res6>res629 then 29 when res6>res628 then 28
				when res6>res627 then 27 when res6>res626 then 26
				when res6>res625 then 25 when res6>res624 then 24
				when res6>res623 then 23 when res6>res622 then 22
				when res6>res621 then 21 when res6>res620 then 20
				when res6>res619 then 19 when res6>res618 then 18
				when res6>res617 then 17 when res6>res616 then 16
				when res6>res615 then 15 when res6>res614 then 14
				when res6>res613 then 13 when res6>res612 then 12
				when res6>res611 then 11 when res6>res610 then 10
				when res6>res69 then 9 when res6>res68 then 8
				when res6>res67 then 7 when res6>res66 then 6
				when res6>res65 then 5 when res6>res64 then 4
				when res6>res63 then 3 when res6>res62 then 2
				when res6>res61 then 1 else 0 end as res6
		from res6 a
			join res6_breakpoint b
				on a.date=b.date
		order by permno,date;
quit;

endrsubmit;
