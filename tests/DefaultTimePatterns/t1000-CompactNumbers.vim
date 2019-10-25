" Test parsing of times comprised of compact numbers.

call vimtest#StartTap()
call vimtap#Plan(4)

call DateDiff('11:11:00', '12:15:00', 'TimeDiff 111100 121500')
call DateDiff('11:11:00', '11:12:11', 'TimeDiff 111100 111211')

call vimtest#Quit()
