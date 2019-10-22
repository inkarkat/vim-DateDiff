" Test parsing of dates comprised of DMY numbers and separators with microseconds.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff(['2018-05-19 11:11:00', 123], ['2018-08-19 11:12:11', 789], 'DateDiff 19-05-2018_11:11:00,123 19-08-2018_11:12:11,789')

call vimtest#Quit()
