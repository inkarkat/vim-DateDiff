" Test parsing of dates comprised of month names, day, year.

call vimtest#StartTap()
call vimtap#Plan(8)

call DateDiff('2018-01-19', '2018-01-20', 'DateDiff Jan 19 2018 Jan 20 2018')
call DateDiff('2018-01-19', '2018-01-20', 'DateDiff Jan 19, 2018 Jan 20, 2018')

call DateDiff('2018-01-19', '2018-01-20', 'DateDiff January 19 2018 January 20 2018')
call DateDiff('2018-01-19', '2018-01-20', 'DateDiff January 19, 2018 January 20, 2018')

call vimtest#Quit()
