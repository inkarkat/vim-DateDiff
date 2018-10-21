" Test parsing of dates comprised of month names, day, time.

call vimtest#StartTap()
call vimtap#Plan(14)

call DateDiff('2018-10-19 11:11:00', '2018-10-19 12:15:00', 'DateDiff October 19 11:11 October 19 12:15')
call DateDiff('2018-12-19 11:11:00', '2018-12-19 11:12:00', 'DateDiff December 19 11:11 December 19 11:12')

call DateDiff('2018-10-19 11:11:00', '2018-10-19 12:15:00', 'DateDiff Oct 19 11:11 Oct 19 12:15')
call DateDiff('2018-12-19 11:11:00', '2018-12-19 11:12:00', 'DateDiff Dec 19 11:11 Dec 19 11:12')

call DateDiff('2018-02-19 11:11:00', '2018-03-19 11:12:00', 'DateDiff February 19, 11:11 Mar 19, 11:12')
call DateDiff('2018-02-19 11:11:00', '2018-03-19 11:12:00', 'DateDiff Feb 19, 11:11 March 19, 11:12')
call DateDiff('2018-05-19 11:11:00', '2018-08-19 11:12:00', 'DateDiff May 19, 11:11 August 19, 11:12')

call vimtest#Quit()
