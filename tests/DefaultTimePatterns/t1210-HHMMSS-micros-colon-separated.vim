" Test parsing of times comprised of HH:MM:SS with microseconds.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff(['11:11:00', 123], ['11:12:11', 789], 'TimeDiff 11:11:00,123 11:12:11,789')

call vimtest#Quit()
