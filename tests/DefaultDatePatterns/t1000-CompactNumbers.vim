" Test parsing of dates comprised of compact numbers.

call vimtest#StartTap()
call vimtap#Plan(6)

call DateDiff('2018-01-19', '2018-01-20', 'DateDiff 20180119 20180120')
call DateDiff('2018-10-19 11:11:00', '2018-10-19 12:15:00', 'DateDiff 20181019 111100 20181019 121500')
call DateDiff('2018-12-19 11:11:00', '2018-12-19 11:12:11', 'DateDiff 20181219 111100 20181219 111211')

call vimtest#Quit()
