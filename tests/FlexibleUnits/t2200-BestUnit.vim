" Test converting a date difference into the best unit.

call vimtest#StartTap()
call vimtap#Plan(8)

let g:unit = '='
call vimtap#Is(Differ(2), '2 seconds', 'just 2 seconds')
call vimtap#Is(Differ(4), '4 seconds', '4 seconds')
call vimtap#Is(Differ(3600), '1 hour', '3600 seconds')
call vimtap#Is(Differ(9999), '2.8 hours', '9999 seconds')
let g:unit = 'best'
call vimtap#Is(Differ(172800), '2 days', '172800 seconds')
call vimtap#Is(Differ(2000000), '3.3 weeks', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '12.7 generations', '10000000000 seconds')
call vimtap#Is(Differ([9, 999]), '10 seconds', '9999 millis')

call vimtest#Quit()
