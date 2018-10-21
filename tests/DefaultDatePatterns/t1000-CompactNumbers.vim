" Test parsing of dates comprised of compact numbers.

call vimtest#StartTap()
call vimtap#Plan(0)

call DateDiff('2018-10-19', '2018-10-20', 'DateDiff 20181019 20181020')
"call DateDiff('2018-10-19 11:11:00', '2018-10-19 11:12:11', 'DateDiff 20181019 111100 20181020 111211')

call vimtest#Quit()
