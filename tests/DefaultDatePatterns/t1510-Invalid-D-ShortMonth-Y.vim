" Test parsing of dates comprised of invalid day, short month names, year and separators.

call vimtest#StartTap()
call vimtap#Plan(3)

DateDiff 19-Bar-2018 20-Jox-2018
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: 19-Bar-2018 20-Jox-2018', 'DateDiff 19-Bar-2018 20-Jox-2018')

DateDiff 19-Bar-2018 11:11 19-Jox-2018 12:15
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: 19-Bar-2018 11:11 19-Jox-2018 12:15', 'DateDiff 19-Bar-2018 11:11 19-Jox-2018 12:15')

DateDiff 19-Bar-2018 11:11:00 19-Jox-2018 11:12:11
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: 19-Bar-2018 11:11:00 19-Jox-2018 11:12:11', 'DateDiff 19-Bar-2018 11:11:00 19-Jox-2018 11:12:11')

call vimtest#Quit()
