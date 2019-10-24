" Test converting a date difference into days.

call vimtest#SkipAndQuitIf(! has('float'), 'Need support for +float')

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'd'
call vimtap#Is(Differ(2), '0.000023 days', 'just 2 seconds')
call vimtap#Is(Differ(4), '0.000046 days', '4 seconds')
call vimtap#Is(Differ(3600), '0.041667 days', '3600 seconds')
call vimtap#Is(Differ(9999), '0.115729 days', '9999 seconds')
let g:unit = 'days'
call vimtap#Is(Differ(172800), '2 days', '172800 seconds')
call vimtap#Is(Differ(2000000), '23.148148 days', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '115740.740741 days', '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0 days', '1 milli')
call vimtap#Is(Differ([9, 999]), '0.000116 days', '9999 seconds')

call vimtest#Quit()
