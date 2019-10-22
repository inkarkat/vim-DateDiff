" Test converting a date difference to small flexible values.

call vimtest#StartTap()
call vimtap#Plan(18)

call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 0), 'dates are identical', 'same start and end date')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 1), '1 second', 'end date one second after start date')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(1, 0), '1 second', 'end date one second before start date')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 2), '2 seconds', '2 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(28, 30), '2 seconds', '2 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 4, '4 seconds', '4 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 5, '5 seconds = 0.1 minutes', '5 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 10), '10 seconds = 0.2 minutes', '10 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 30), '30 seconds = 0.5 minutes', '30 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 56), '56 seconds = 0.9 minutes', '56 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 57), '57 seconds = 1 minute', '57 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 58), '58 seconds = 1 minute', '58 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 59), '59 seconds = 1 minute', '59 seconds')

call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 60), '60 seconds = 1 minute', '60 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 120), '120 seconds = 2 minutes', '120 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 360), '360 seconds = 6 minutes = 0.1 hours', '360 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 1800), '1800 seconds = 30 minutes = 0.5 hours', '1800 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 3600), '3600 seconds = 60 minutes = 1 hour', '3600 seconds')

call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 9999), '9999 seconds = 166.7 minutes = 2.8 hours = 0.1 days', '9999 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff(0, 10000), '166.7 minutes = 2.8 hours = 0.1 days', '10000 seconds')

call vimtest#Quit()
