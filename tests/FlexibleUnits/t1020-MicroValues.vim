" Test converting a date difference to microsecond flexible values.

call vimtest#StartTap()
call vimtap#Plan(32)

call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [0, 0]), 'dates are identical', 'same start and end date')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [0, 1]), '1 milli', 'end date one milli after start date')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 1], [0, 0]), '1 milli', 'end date one milli before start date')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [0, 2]), '2 millis', '2 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 28], [0, 30]), '2 millis', '2 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [0, 49]), '49 millis', '49 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [0, 50]), '50 millis = 0.1 seconds', '50 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [0, 100]), '100 millis = 0.1 seconds', '100 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 123], [0, 789]), '666 millis = 0.7 seconds', '666 millis')

call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 990], [1, 23]), '33 millis', '33 millis (1)')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 999], [1, 32]), '33 millis', '33 millis (2)')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([1, 10], [0, 977]), '33 millis', '33 millis (3)')

call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [6, 6]), '6006 millis = 6 seconds = 0.1 minutes', '6006 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [6, 60]), '6060 millis = 6.1 seconds = 0.1 minutes', '6060 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [6, 600]), '6600 millis = 6.6 seconds = 0.1 minutes', '6600 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [6, 900]), '6900 millis = 6.9 seconds = 0.1 minutes', '6900 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [6, 949]), '6949 millis = 6.9 seconds = 0.1 minutes', '6949 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [6, 950]), '6950 millis = 7 seconds = 0.1 minutes', '6950 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [6, 999]), '6999 millis = 7 seconds = 0.1 minutes', '6999 millis')

call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 1], [10, 0]), '9999 millis = 10 seconds = 0.2 minutes', '9999 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 1], [10, 1]), '10 seconds = 0.2 minutes', '10000 millis')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 1], [10, 2]), '10 seconds = 0.2 minutes', '10001 millis')

call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], 60), '60 seconds = 1 minute', '60 seconds, no micros')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [60, 0]), '60 seconds = 1 minute', '60 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [60, 1]), '60 seconds = 1 minute', '60.001 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [60, 100]), '60.1 seconds = 1 minute', '60.1 seconds')

call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [99, 100]), '99.1 seconds = 1.7 minutes', '99.1 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [120, 100]), '120.1 seconds = 2 minutes', '120.1 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [360, 100]), '360.1 seconds = 6 minutes = 0.1 hours', '360.1 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [1800, 100]), '1800 seconds = 30 minutes = 0.5 hours', '1800.1 seconds')
call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [3600, 100]), '3600 seconds = 60 minutes = 1 hour', '3600.1 seconds')

call vimtap#Is(DateDiff#FlexibleUnits#Diff([0, 0], [9999, 100]), '9999 seconds = 166.7 minutes = 2.8 hours = 0.1 days', '9999.1 seconds')

call vimtest#Quit()
