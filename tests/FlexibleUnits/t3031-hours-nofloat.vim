" Test converting a date difference into hours.

let g:DateDiff#NoFloat = 1

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'h'
call vimtap#Is(Differ(2), '0 hours', 'just 2 seconds')
call vimtap#Is(Differ(4), '0 hours', '4 seconds')
call vimtap#Is(Differ(3600), '1 hour', '3600 seconds')
call vimtap#Is(Differ(9999), '2.8 hours', '9999 seconds')
let g:unit = 'hours'
call vimtap#Is(Differ(172800), '48 hours', '172800 seconds')
call vimtap#Is(Differ(2000000), '555.6 hours', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '2777777 hours', '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0 hours', '1 milli')
call vimtap#Is(Differ([9, 999]), '0 hours', '9999 seconds')

call vimtest#Quit()
