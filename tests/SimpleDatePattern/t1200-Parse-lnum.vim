" Test parsing of one line for date.

edit dates.txt

call vimtest#StartTap()
call vimtap#Plan(6)

call DateDiff('2018-09-17', '2018-09-18', '2DateDiff 2018-09-18')
call DateDiff('2018-09-17', '2018-10-10', '2DateDiff from 2018-10-10 base')
call DateDiff('2018-09-21', g:IngoLibrary_NowEpoch, '5DateDiff')

call vimtest#Quit()
