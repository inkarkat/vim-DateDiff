" Test parsing of times comprised of HH:MM:SS.

call vimtest#StartTap()
call vimtap#Plan(4)

call DateDiff('11:11:00', '12:15:00', 'TimeDiff 11:11:00 12:15:00')
call DateDiff('11:11:59', '11:12:11', 'TimeDiff 11:11:59 11:12:11')

call vimtest#Quit()
