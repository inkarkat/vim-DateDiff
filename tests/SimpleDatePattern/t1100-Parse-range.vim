" Test parsing of a range of lines for dates.

edit dates.txt

call vimtest#StartTap()
call vimtap#Plan(8)

call DateDiff('2018-09-17', '2018-09-18', '2,3DateDiff')
call DateDiff('2018-09-17', '2018-10-10', '2,$-1DateDiff')
call DateDiff('2018-09-21', '2018-09-24', '5,6DateDiff')
call DateDiff('2018-10-05', '2018-10-06', '12,13DateDiff')

call vimtest#Quit()
