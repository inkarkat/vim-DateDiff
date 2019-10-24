" Test parsing of passed unit.

let g:DateDiff_Differ = function('UnitAssertionDiffer')

call vimtest#StartTap()
call vimtap#Plan(4)

let g:unit = '*'
call DateDiff('2018-10-19', '2018-10-20', 'DateDiff 2018-10-19 2018-10-20')
call DateDiff('2018-10-19', '2018-10-20', 'DateDiffUnit * 2018-10-19 2018-10-20')

let g:unit = '<'
call DateDiff('2018-10-19', '2018-10-20', 'DateDiffUnit < 2018-10-19 2018-10-20')
let g:unit = '>'
call DateDiff('2018-10-19', '2018-10-20', 'DateDiffUnit > 2018-10-19 2018-10-20')

call vimtest#Quit()
