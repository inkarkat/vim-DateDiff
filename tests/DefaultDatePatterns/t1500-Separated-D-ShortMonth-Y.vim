" Test parsing of dates comprised of day, short month names, year and separators.

call vimtest#StartTap()
call vimtap#Plan(10)

call DateDiff('2018-01-19', '2018-01-20', 'DateDiff 19-Jan-2018 20-Jan-2018')
call DateDiff('2018-10-19 11:11:00', '2018-10-19 12:15:00', 'DateDiff 19-Oct-2018 11:11 19-Oct-2018 12:15')
call DateDiff('2018-12-19 11:11:00', '2018-12-19 11:12:11', 'DateDiff 19-Dec-2018 11:11:00 19-Dec-2018 11:12:11')

call DateDiff('2018-02-19 11:11:00', '2018-03-19 11:12:11', 'DateDiff 19-Feb-2018-11:11:00 19-Mar-2018-11:12:11')
call DateDiff('2018-05-19 11:11:00', '2018-08-19 11:12:11', 'DateDiff 19-May-2018_11:11:00 19-Aug-2018_11:12:11')

call vimtest#Quit()
