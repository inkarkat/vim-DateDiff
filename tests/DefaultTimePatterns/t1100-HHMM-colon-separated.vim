" Test parsing of times comprised of HH:MM.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff('11:11:00', '12:15:00', 'TimeDiff 11:11 12:15')

call vimtest#Quit()
