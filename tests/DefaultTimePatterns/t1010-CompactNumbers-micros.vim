" Test parsing of times comprised of compact numbers with microseconds.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff(['11:11:00', 123], ['12:15:00', 789], 'TimeDiff 111100,123 121500,789')

call vimtest#Quit()
