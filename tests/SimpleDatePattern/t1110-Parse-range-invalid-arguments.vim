" Test parsing of range with arguments.

let g:DateDiff_Differ = function('NotCalledDiffer')
edit dates.txt

call vimtest#StartTap()
call vimtap#Plan(2)

2,6DateDiff 2018-01-01
call vimtap#Is(ingo#err#Get(), 'Cannot pass {date} when range is given', 'range and date arg together not allowed')

2,6DateDiff withExtraArguments
call vimtap#Is(ingo#err#Get(), 'Cannot pass {date} when range is given', 'range and illegal arg together not allowed')

call vimtest#Quit()
