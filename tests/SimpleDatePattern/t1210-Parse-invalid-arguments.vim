" Test parsing of one line with invalid arguments.

edit dates.txt

call vimtest#StartTap()
call vimtap#Plan(3)

call vimtap#err#Errors('Not a valid date from arguments: doesNotExist', '2DateDiff doesNotExist', 'bad argument')
call vimtap#err#Errors('Must pass only one {date}', '2DateDiff 2018-10-17 2018-10-18', 'two date arguments')
call vimtap#err#Errors('Must pass only one {date}', '2DateDiff 2018-10-17 2018-10-18 2018-10-19', 'three date arguments')

call vimtest#Quit()
