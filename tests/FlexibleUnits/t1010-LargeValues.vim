" Test converting a date difference to flexible values.

call vimtest#StartTap()
call vimtap#Plan(17)

call vimtap#Is(Differ(86400), '1440 minutes = 24 hours = 1 day = 0.1 weeks', '86400 seconds')
call vimtap#Is(Differ(172800), '2880 minutes = 48 hours = 2 days = 0.3 weeks = 0.1 months', '172800 seconds')
call vimtap#Is(Differ(259200), '4320 minutes = 72 hours = 3 days = 0.4 weeks = 0.1 months', '259200 seconds')

call vimtap#Is(Differ(604800), '168 hours = 7 days = 1 week = 0.2 months', '604800 seconds')
call vimtap#Is(Differ(604801), '168 hours = 7 days = 1 week = 0.2 months', '604801 seconds')
call vimtap#Is(Differ(604860), '168 hours = 7 days = 1 week = 0.2 months', '604860 seconds')
call vimtap#Is(Differ(604900), '168 hours = 7 days = 1 week = 0.2 months', '604960 seconds')
call vimtap#Is(Differ(605000), '168.1 hours = 7 days = 1 week = 0.2 months', '605000 seconds')

call vimtap#Is(Differ(1209600), '336 hours = 14 days = 2 weeks = 0.5 months', '1209600 seconds')
call vimtap#Is(Differ(2000000), '555.6 hours = 23.1 days = 3.3 weeks = 0.8 months = 0.1 years', '2000000 seconds')
call vimtap#Is(Differ(3333333), '925.9 hours = 38.6 days = 5.6 weeks = 1.3 months = 0.1 years', '3333333 seconds')

call vimtap#Is(Differ(10000000), '2777 hours = 115.7 days = 16.6 weeks = 3.9 months = 0.3 years', '10000000 seconds')
call vimtap#Is(Differ(100000000), '1157 days = 165.3 weeks = 38.6 months = 3.2 years = 0.1 generations', '100000000 seconds')
call vimtap#Is(Differ(1000000000), '1653 weeks = 385.8 months = 31.7 years = 1.3 generations', '1000000000 seconds')
call vimtap#Is(Differ(10000000000), '3858 months = 317.1 years = 12.7 generations', '10000000000 seconds')
call vimtap#Is(Differ(100000000000), '3171 years = 126.8 generations', '100000000000 seconds')
call vimtap#Is(Differ(1000000000000), '1267 generations', '1000000000000 seconds')

call vimtest#Quit()
