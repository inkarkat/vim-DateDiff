" DateDiff.vim: Calculate difference between two dates.
"
" DEPENDENCIES:
"   - ingo-library.vim plugin
"
" Copyright: (C) 2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

function! s:ParseDate( text )
    let l:datePattern = ingo#plugin#setting#GetBufferLocal('DateDiff_DatePattern')

    " Don't use matchlist() here to obtain both date and rest in one pass, as it
    " would require adding capture groups, and we don't want to assume anything
    " about the configured (possibly already quite complex) regular expression.
    let l:start = match(a:text, l:datePattern)
    if l:start == -1
	return [a:text, '']
    endif
    let l:end = matchend(a:text, l:datePattern)

    let l:dateString = strpart(a:text, l:start, (l:end - l:start))
    let l:rest = strpart(a:text, l:end)
    let l:date = ingo#date#epoch#ConvertTo(l:dateString)

    return [(l:date > 0 ? l:date : l:dateString), l:rest]
endfunction
function! s:CheckValidness( date, source )
    if empty(a:date)
	call ingo#err#Set('No valid date found in ' . a:source)
	return 0
    elseif type(a:date) != type(0)
	call ingo#err#Set(printf('Not a valid date from %s: %s', a:source, a:date))
	return 0
    endif
    return 1
endfunction
function! DateDiff#Command( Differ, isRangeGiven, startLnum, endLnum, arguments )
    let [l:startLnum, l:endLnum] = [ingo#range#NetStart(a:startLnum), ingo#range#NetEnd(a:endLnum)]
    let [l:now, l:source1, l:source2] = [str2nr(ingo#date#epoch#Now()), 'arguments', 'arguments']
    if a:isRangeGiven
	let [l:date1, l:source1] = [s:ParseDate(getline(l:startLnum))[0], 'line ' . l:startLnum]
	if l:startLnum == l:endLnum
	    if empty(a:arguments)
		let l:date2 = l:now
	    else
		let [l:date2, l:rest] = s:ParseDate(a:arguments)
		if ! empty(l:rest)
		    call ingo#err#Set('Must pass only one {date}')
		    return 0
		endif
	    endif
	elseif empty(a:arguments)
	    let [l:date2, l:source2] = [s:ParseDate(getline(l:endLnum))[0], 'line ' . l:endLnum]
	else
	    call ingo#err#Set('Cannot pass {date} when range is given')
	    return 0
	endif
    else
	let [l:date1, l:rest] = s:ParseDate(a:arguments)
	if ! empty(l:rest)
	    let [l:date2, l:rest] = s:ParseDate(l:rest)
	    if ! empty(l:rest)
		let [l:date3, l:rest] = s:ParseDate(l:rest)
		if s:CheckValidness(l:date3, '')
		    call ingo#err#Set('Must pass only two {date}s')
		    return 0
		endif
	    endif
	endif
    endif

    if ! s:CheckValidness(l:date1, l:source1)
	return 0
    elseif ! exists('l:date2') || ! s:CheckValidness(l:date2, l:source2)
	let l:date2 = l:now
    endif

    let l:dateDiff = call(a:Differ, [l:date1, l:date2])
    echomsg l:dateDiff
    return 1
endfunction

function! DateDiff#Diff( date1, date2 )
    return a:date1.' - '.a:date2
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
