" Test parsing of dates comprised of numbers and separators.

call vimtest#StartTap()
call vimtap#Plan(0)

call DateDiff('2018-10-19', '2018-10-20', 'DateDiff 2018-10-19 2018-10-20')
call DateDiff('2018-10-19 11:11:00', '2018-10-19 11:12:11', 'DateDiff 2018-10-19 11:11:00 2018-10-19 11:12:11')
call DateDiff('2018-10-19 11:11:00', '2018-10-19 11:12:11', 'DateDiff 2018-10-19-11:11:00 2018-10-19-11:12:11')
"call DateDiff('2018-10-19 11:11:00', '2018-10-19 11:12:11', 'DateDiff 2018-10-19_11:11:00 2018-10-19_11:12:11')

call vimtest#Quit()
