" Test converting a date difference into the smallest unit.

call vimtest#StartTap()
call vimtap#Plan(8)

let g:unit = '<'
call vimtap#Is(Differ(2), '2 seconds', 'just 2 seconds')
call vimtap#Is(Differ(4), '4 seconds', '4 seconds')
call vimtap#Is(Differ(3600), '3600 seconds', '3600 seconds')
call vimtap#Is(Differ(9999), '9999 seconds', '9999 seconds')
let g:unit = 'smallest'
call vimtap#Is(Differ(172800), '2880 minutes', '172800 seconds')
call vimtap#Is(Differ(2000000), '555.6 hours', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '3858 months', '10000000000 seconds')
call vimtap#Is(Differ([9, 999]), '9999 millis', '9999 millis')

call vimtest#Quit()
