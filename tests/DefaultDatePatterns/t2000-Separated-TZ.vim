" Test parsing of dates comprised of YMD numbers separated by T and Z.

call vimtest#StartTap()
call vimtap#Plan(4)

call DateDiff('2018-12-19 11:11:00', '2018-12-19 11:12:11', 'DateDiff 2018-12-19T11:11:00Z 2018-12-19T11:12:11Z')
call DateDiff('2018-02-19 11:11:00', '2018-03-19 11:12:11', 'DateDiff 2018-02-19T11:11:00Z 2018-03-19T11:12:11Z')

call vimtest#Quit()
