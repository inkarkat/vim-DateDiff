" Test parsing of dates comprised of compact numbers with microseconds.

call vimtest#StartTap()
call vimtap#Plan(2)

call DateDiff(['2018-10-19 11:11:00', 123], ['2018-10-19 12:15:00', 789], 'DateDiff 20181019 111100,123 20181019 121500,789')

call vimtest#Quit()
