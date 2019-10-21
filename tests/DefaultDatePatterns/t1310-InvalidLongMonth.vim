" Test parsing of dates comprised of invalid long month names and separators.

call vimtest#StartTap()
call vimtap#Plan(3)

call vimtap#err#Errors('Not a valid date from arguments: 2018-Febuary-19 2018-Jannuar-20', 'DateDiff 2018-Febuary-19 2018-Jannuar-20', 'pass invalid long months')
call vimtap#err#Errors('Not a valid date from arguments: 2018-Febuary-19 11:11 2018-Jannuar-19 12:15', 'DateDiff 2018-Febuary-19 11:11 2018-Jannuar-19 12:15', 'pass invalid long months with HH:MM')
call vimtap#err#Errors('Not a valid date from arguments: 2018-Febuary-19 11:11:00 2018-Jannuar-19 11:12:11', 'DateDiff 2018-Febuary-19 11:11:00 2018-Jannuar-19 11:12:11', 'pass invalid long months with HH:MM:SS')

call vimtest#Quit()
