" Test converting a date difference into the largest unit.

call vimtest#StartTap()
call vimtap#Plan(8)

let g:unit = '>'
call vimtap#Is(Differ(2), '2 seconds', 'just 2 seconds')
call vimtap#Is(Differ(4), '0.1 minutes', '4 seconds')
call vimtap#Is(Differ(3600), '1 hour', '3600 seconds')
call vimtap#Is(Differ(9999), '0.1 days', '9999 seconds')
let g:unit = 'largest'
call vimtap#Is(Differ(172800), '0.1 months', '172800 seconds')
call vimtap#Is(Differ(2000000), '0.1 years', '2000000 seconds')
call vimtap#Is(Differ(10000000000), Num64('12.7 generations'), '10000000000 seconds')
call vimtap#Is(Differ([9, 999]), '0.2 minutes', '9999 millis')

call vimtest#Quit()
