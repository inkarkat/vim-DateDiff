" Test converting a date difference into years.

let g:DateDiff#NoFloat = 1

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'y'
call vimtap#Is(Differ(2), '0 years', 'just 2 seconds')
call vimtap#Is(Differ(4), '0 years', '4 seconds')
call vimtap#Is(Differ(3600), '0 years', '3600 seconds')
call vimtap#Is(Differ(9999), '0 years', '9999 seconds')
let g:unit = 'years'
call vimtap#Is(Differ(172800), '0 years', '172800 seconds')
call vimtap#Is(Differ(2000000), '0.1 years', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '317.1 years', '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0 years', '1 milli')
call vimtap#Is(Differ([9, 999]), '0 years', '9999 seconds')

call vimtest#Quit()
