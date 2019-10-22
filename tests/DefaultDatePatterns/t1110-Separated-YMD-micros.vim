" Test parsing of dates comprised of YMD numbers and separators with microseconds.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff(['2018-12-19 11:11:00', 123], ['2018-12-19 11:12:11', 789], 'DateDiff 2018-12-19 11:11:00,123 2018-12-19 11:12:11,789')

call vimtest#Quit()
