" Test parsing of dates comprised of invalid day, short month names, year and separators.

call vimtest#StartTap()
call vimtap#Plan(3)

call vimtap#err#Errors('Not a valid date from arguments: 19-Bar-2018 20-Jox-2018', 'DateDiff 19-Bar-2018 20-Jox-2018', 'pass invalid short months')
call vimtap#err#Errors('Not a valid date from arguments: 19-Bar-2018 11:11 19-Jox-2018 12:15', 'DateDiff 19-Bar-2018 11:11 19-Jox-2018 12:15', 'pass invalid short months with HH:MM')
call vimtap#err#Errors('Not a valid date from arguments: 19-Bar-2018 11:11:00 19-Jox-2018 11:12:11', 'DateDiff 19-Bar-2018 11:11:00 19-Jox-2018 11:12:11', 'pass invalid short months with HH:MM:SS')

call vimtest#Quit()
