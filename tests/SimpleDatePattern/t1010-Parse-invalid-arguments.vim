" Test parsing of invalid date arguments.

let g:DateDiff_Differ = function('NotCalledDiffer')

call vimtest#StartTap()
call vimtap#Plan(4)

DateDiff
call vimtap#Is(ingo#err#Get(), 'No valid date found in arguments', 'no range, no arguments')

DateDiff 2018-10-17 2018-10-18 2018-10-19
call vimtap#Is(ingo#err#Get(), 'Must pass only two {date}s', 'three arguments')

DateDiff doesNotExist
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: doesNotExist', 'bad argument')

DateDiff doesNotExist andThisNeitherADate
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: doesNotExist andThisNeitherADate', 'bad arguments')

call vimtest#Quit()
