" Test parsing of dates comprised of short month names and separators with microseconds.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff(['2018-05-19 11:11:00', 123], ['2018-08-19 11:12:11', 789], 'DateDiff 2018-May-19_11:11:00,123 2018-Aug-19_11:12:11,789')

call vimtest#Quit()
