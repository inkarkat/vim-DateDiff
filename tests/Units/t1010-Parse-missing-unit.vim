" Test parsing of arguments that omit the unit or have a wrong one.

let g:DateDiff_Differ = function('NotCalledDiffer')

call vimtest#StartTap()
call vimtap#Plan(7)

call vimtap#err#ErrorsLike('^E471:', 'DateDiffUnit', 'no range, no arguments')

let s:errorMessage = 'No valid unit passed; need one of *, all, <, smallest, >, largest, =, best'
call vimtap#err#Errors(s:errorMessage, 'DateDiffUnit 2018-10-17 2018-10-18', 'no unit, two date arguments')
call vimtap#err#Errors(s:errorMessage, 'DateDiffUnit 2018-10-17 2018-10-18 2018-10-19', 'no unit, three date arguments')
call vimtap#err#Errors(s:errorMessage, 'DateDiffUnit doesNotExist', 'no unit, bad argument')
call vimtap#err#Errors(s:errorMessage, 'DateDiffUnit doesNotExist andThisNeitherADate', 'no unit, bad arguments')

call vimtap#err#Errors(s:errorMessage, 'DateDiffUnit Z 2018-10-17 2018-10-18', 'invalid unit, two date arguments')
call vimtap#err#Errors(s:errorMessage, 'DateDiffUnit Z', 'just invalid unit')

call vimtest#Quit()
