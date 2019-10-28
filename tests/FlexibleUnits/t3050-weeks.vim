" Test converting a date difference into weeks.

call vimtest#SkipAndQuitIf(! has('float'), 'Need support for +float')

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'w'
call vimtap#Is(Differ(2), '0.000003 weeks', 'just 2 seconds')
call vimtap#Is(Differ(4), '0.000007 weeks', '4 seconds')
call vimtap#Is(Differ(3600), '0.005952 weeks', '3600 seconds')
call vimtap#Is(Differ(9999), '0 weeks', '9999 seconds')
let g:unit = 'weeks'
call vimtap#Is(Differ(172800), '0.285714 weeks', '172800 seconds')
call vimtap#Is(Differ(2000000), '3.285714 weeks', '2000000 seconds')
call vimtap#Is(Differ(10000000000), Num64('16534.428571 weeks'), '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0 weeks', '1 milli')
call vimtap#Is(Differ([9, 999]), '0.000017 weeks', '9999 seconds')

call vimtest#Quit()
