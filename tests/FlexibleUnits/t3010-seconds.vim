" Test converting a date difference into seconds.

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 's'
call vimtap#Is(Differ(2), '2 seconds', 'just 2 seconds')
call vimtap#Is(Differ(4), '4 seconds', '4 seconds')
call vimtap#Is(Differ(3600), '3600 seconds', '3600 seconds')
call vimtap#Is(Differ(9999), '9999 seconds', '9999 seconds')
let g:unit = 'seconds'
call vimtap#Is(Differ(172800), '172800 seconds', '172800 seconds')
call vimtap#Is(Differ(2000000), '2000000 seconds', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '10000000000 seconds', '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0.001 seconds', '1 milli')
call vimtap#Is(Differ([9, 999]), '9.999 seconds', '9999 seconds')

call vimtest#Quit()
