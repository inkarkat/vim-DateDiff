" Test parsing of one line with invalid arguments.

edit dates.txt

call vimtest#StartTap()
call vimtap#Plan(3)

2DateDiff doesNotExist
call vimtap#Is(ingo#err#Get(), 'Not a valid date from arguments: doesNotExist', 'bad argument')

2DateDiff 2018-10-17 2018-10-18
call vimtap#Is(ingo#err#Get(), 'Must pass only one {date}', 'two date arguments')

2DateDiff 2018-10-17 2018-10-18 2018-10-19
call vimtap#Is(ingo#err#Get(), 'Must pass only one {date}', 'three date arguments')

call vimtest#Quit()
