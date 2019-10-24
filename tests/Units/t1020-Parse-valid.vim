" Test parsing valid combinations with a unit.

let g:DateDiff_DatePattern = '\<\d\d\d\d-[01]\d-[0123]\d\>'
let g:DateDiff_Differ = function('AssertionDiffer')

edit ../dates.txt

call vimtest#StartTap()
call vimtap#Plan(4)

call DateDiff('2018-09-17', '2018-09-18', '2,3DateDiffUnit *')
call DateDiff('2018-09-17', '2018-10-10', '2DateDiffUnit < from 2018-10-10 base')

call vimtest#Quit()
