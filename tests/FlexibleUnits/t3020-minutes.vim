" Test converting a date difference into minutes.

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'min'
call vimtap#Is(Differ(2), '0.033333 minutes', 'just 2 seconds')
call vimtap#Is(Differ(4), '0.066667 minutes', '4 seconds')
call vimtap#Is(Differ(3600), '60 minutes', '3600 seconds')
call vimtap#Is(Differ(9999), '1.6665 minutes', '9999 seconds')
let g:unit = 'minutes'
call vimtap#Is(Differ(172800), '28.8 minutes', '172800 seconds')
call vimtap#Is(Differ(2000000), '333.333333 minutes', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '1666666.666667 minutes', '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0.000017 minutes', '1 milli')
call vimtap#Is(Differ([9, 999]), '0.16665 minutes', '9999 seconds')

call vimtest#Quit()
