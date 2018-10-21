" Test parsing of dates comprised of YMD numbers and separators.

call vimtest#StartTap()
call vimtap#Plan(10)

call DateDiff('2018-01-19', '2018-01-20', 'DateDiff 2018-01-19 2018-01-20')
call DateDiff('2018-10-19 11:11:00', '2018-10-19 12:15:00', 'DateDiff 2018-10-19 11:11 2018-10-19 12:15')
call DateDiff('2018-12-19 11:11:00', '2018-12-19 11:12:11', 'DateDiff 2018-12-19 11:11:00 2018-12-19 11:12:11')

call DateDiff('2018-02-19 11:11:00', '2018-03-19 11:12:11', 'DateDiff 2018-02-19-11:11:00 2018-03-19-11:12:11')
call DateDiff('2018-05-19 11:11:00', '2018-08-19 11:12:11', 'DateDiff 2018-05-19_11:11:00 2018-08-19_11:12:11')

call vimtest#Quit()
