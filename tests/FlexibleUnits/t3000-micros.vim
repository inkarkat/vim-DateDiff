" Test converting a date difference into microseconds.

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'ms'
call vimtap#Is(Differ(2), '2000 millis', 'just 2 seconds')
call vimtap#Is(Differ(4), '4000 millis', '4 seconds')
call vimtap#Is(Differ(3600), '3600000 millis', '3600 seconds')
call vimtap#Is(Differ(9999), '9999000 millis', '9999 seconds')
let g:unit = 'millis'
call vimtap#Is(Differ(172800), '172800000 millis', '172800 seconds')
call vimtap#Is(Differ(2000000), '2000000000 millis', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '10000000000000 millis', '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '1 milli', '1 milli')
call vimtap#Is(Differ([9, 999]), '9999 millis', '9999 millis')

call vimtest#Quit()
