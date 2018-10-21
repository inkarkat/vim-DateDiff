" Test parsing of dates comprised of invalid long month names and separators.

call vimtest#StartTap()
call vimtap#Plan(3)

DateDiff 2018-Febuary-19 2018-Jannuar-20
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: 2018-Febuary-19 2018-Jannuar-20', 'DateDiff 2018-Febuary-19 2018-Jannuar-20')

DateDiff 2018-Febuary-19 11:11 2018-Jannuar-19 12:15
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: 2018-Febuary-19 11:11 2018-Jannuar-19 12:15', 'DateDiff 2018-Febuary-19 11:11 2018-Jannuar-19 12:15')

DateDiff 2018-Febuary-19 11:11:00 2018-Jannuar-19 11:12:11
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: 2018-Febuary-19 11:11:00 2018-Jannuar-19 11:12:11', 'DateDiff 2018-Febuary-19 11:11:00 2018-Jannuar-19 11:12:11')

call vimtest#Quit()
