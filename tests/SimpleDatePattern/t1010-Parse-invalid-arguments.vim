" Test parsing of invalid date arguments.

let g:DateDiff_Differ = function('NotCalledDiffer')

call vimtest#StartTap()
call vimtap#Plan(4)

call vimtap#err#Errors('No valid date found in arguments', 'DateDiff', 'no range, no arguments')
call vimtap#err#Errors('Must pass only two {date}s', 'DateDiff 2018-10-17 2018-10-18 2018-10-19', 'three date arguments')
call vimtap#err#Errors('Not a valid date from arguments: doesNotExist', 'DateDiff doesNotExist', 'bad argument')
call vimtap#err#Errors('Not a valid date from arguments: doesNotExist andThisNeitherADate', 'DateDiff doesNotExist andThisNeitherADate', 'bad arguments')

call vimtest#Quit()
