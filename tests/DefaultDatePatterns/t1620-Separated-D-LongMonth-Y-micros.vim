" Test parsing of dates comprised of day, long month names, year and separators with microseconds.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff(['2018-05-19 11:11:00', 123], ['2018-08-19 11:12:11', 789], 'DateDiff 19-May-2018_11:11:00,123 19-August-2018_11:12:11,789')

call vimtest#Quit()
