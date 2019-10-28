" Test converting a date difference into generations.

call vimtest#SkipAndQuitIf(! has('float'), 'Need support for +float')

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'g'
call vimtap#Is(Differ(2), '0 generations', 'just 2 seconds')
call vimtap#Is(Differ(4), '0 generations', '4 seconds')
call vimtap#Is(Differ(3600), '0 generations', '3600 seconds')
call vimtap#Is(Differ(9999), '0 generations', '9999 seconds')
let g:unit = 'generations'
call vimtap#Is(Differ(172800), '0.000219 generations', '172800 seconds')
call vimtap#Is(Differ(2000000), '0.002519 generations', '2000000 seconds')
call vimtap#Is(Differ(10000000000), Num64('12.675611 generations'), '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0 generations', '1 milli')
call vimtap#Is(Differ([9, 999]), '0 generations', '9999 seconds')

call vimtest#Quit()
