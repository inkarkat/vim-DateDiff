" Test parsing of one or two date arguments.

call vimtest#StartTap()
call vimtap#Plan(18)

call DateDiff('2018-10-19', '2018-10-20', 'DateDiff 2018-10-19 2018-10-20')
call DateDiff('2018-10-19', '2018-10-20', 'DateDiff this goes from 2018-10-19 until 2018-10-20 the latest')
call DateDiff('2018-10-19', '2018-10-20', 'DateDiff this goes from "2018-10-19" until "2018-10-20"')
call DateDiff('2018-10-19', '2018-10-20', 'DateDiff this-goes-from-2018-10-19-until-2018-10-20-the-latest')

call DateDiff('2018-10-19', g:IngoLibrary_NowEpoch, 'DateDiff 2018-10-19')
call DateDiff('2018-01-01', g:IngoLibrary_NowEpoch, 'DateDiff 2018-01-01')
call DateDiff('2018-10-19', g:IngoLibrary_NowEpoch, 'DateDiff from 2018-10-19 on')
call DateDiff('2018-10-19', g:IngoLibrary_NowEpoch, 'DateDiff the-2018-10-19-date')
call DateDiff('2018-10-19', g:IngoLibrary_NowEpoch, 'DateDiff from 2018-10-19 within 2018-10')

call vimtest#Quit()
