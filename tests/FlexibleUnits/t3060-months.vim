" Test converting a date difference into months.

call vimtest#SkipAndQuitIf(! has('float'), 'Need support for +float')

call vimtest#StartTap()
call vimtap#Plan(9)

let g:unit = 'm'
call vimtap#Is(Differ(2), '0 months', 'just 2 seconds')
call vimtap#Is(Differ(4), '0 months', '4 seconds')
call vimtap#Is(Differ(3600), '0 months', '3600 seconds')
call vimtap#Is(Differ(9999), '0 months', '9999 seconds')
let g:unit = 'months'
call vimtap#Is(Differ(172800), '0.066667 months', '172800 seconds')
call vimtap#Is(Differ(2000000), '0.766667 months', '2000000 seconds')
call vimtap#Is(Differ(10000000000), '3858.033333 months', '10000000000 seconds')
call vimtap#Is(Differ([0, 1]), '0 months', '1 milli')
call vimtap#Is(Differ([9, 999]), '0 months', '9999 seconds')

call vimtest#Quit()
