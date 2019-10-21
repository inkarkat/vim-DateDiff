" Test parsing of range with arguments.

let g:DateDiff_Differ = function('NotCalledDiffer')
edit dates.txt

call vimtest#StartTap()
call vimtap#Plan(2)

call vimtap#err#Errors('Cannot pass {date} when range is given', '2,6DateDiff 2018-01-01', 'range and date arg together not allowed')
call vimtap#err#Errors('Cannot pass {date} when range is given', '2,6DateDiff withExtraArguments', 'range and illegal arg together not allowed')

call vimtest#Quit()
