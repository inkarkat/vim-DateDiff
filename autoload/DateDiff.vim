" DateDiff.vim: Calculate difference between two dates.
"
" DEPENDENCIES:
"   - ingo-library.vim plugin
"
" Copyright: (C) 2018-2019 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

function! DateDiff#ParseMonth( month ) abort
    for l:i in [index(g:DateDiff_ShortMonths, a:month), index(g:DateDiff_LongMonths, a:month)]
	if l:i != -1
	    return printf('%02d', l:i + 1)
	endif
    endfor

    throw 'DateDiff: No match'
endfunction

let s:microsPattern = ',\(\d\{3}\)$'
function! s:ParseDate( text ) abort
    for [l:datePattern, l:dateReplacement] in ingo#plugin#setting#GetBufferLocal('DateDiff_DatePatterns')
	" Don't use matchlist() here to obtain both date and rest in one pass, as it
	" would require adding capture groups, and we don't want to assume anything
	" about the configured (possibly already quite complex) regular expression.
	let l:start = match(a:text, l:datePattern)
	if l:start == -1
	    continue
	endif
	let l:end = matchend(a:text, l:datePattern)

	let l:dateString = strpart(a:text, l:start, (l:end - l:start))
	let l:rest = strpart(a:text, l:end)
	try
	    let l:convertedDateString = substitute(l:dateString, l:datePattern, l:dateReplacement, '')

	    if l:convertedDateString =~# s:microsPattern
		let [l:convertedDateString, l:microsString] = matchlist(l:convertedDateString, '^\(.*\)' . s:microsPattern)[1:2]
		let l:convertedDate = ingo#date#epoch#ConvertTo(l:convertedDateString)
		let l:date = [l:convertedDate, str2nr(l:microsString)]
	    else
		let l:convertedDate = ingo#date#epoch#ConvertTo(l:convertedDateString)
		let l:date = l:convertedDate
	    endif

	    if l:convertedDate > 0
		return [l:date, l:rest]
	    endif
	catch /^DateDiff:/
	    continue
	endtry
    endfor
    return [a:text, '']
endfunction
function! s:CheckValidness( date, source ) abort
    if empty(a:date)
	call ingo#err#Set('No valid date found in ' . a:source)
	return 0
    elseif type(a:date) != type(0) && type(a:date) != type([])
	call ingo#err#Set(printf('Not a valid date from %s: %s', a:source, a:date))
	return 0
    endif
    return 1
endfunction
function! DateDiff#Command( unit, Differ, isRangeGiven, startLnum, endLnum, arguments ) abort
    let [l:startLnum, l:endLnum] = [ingo#range#NetStart(a:startLnum), ingo#range#NetEnd(a:endLnum)]
    let [l:now, l:source1, l:source2] = [str2nr(ingo#date#epoch#Now()), 'arguments', 'arguments']
    if a:isRangeGiven
	let [l:date1, l:source1] = [s:ParseDate(getline(l:startLnum))[0], 'line ' . l:startLnum]
	if l:startLnum == l:endLnum
	    if ! empty(a:arguments)
		let [l:date2, l:rest] = s:ParseDate(a:arguments)
		if ! s:CheckValidness(l:date2, l:source2)
		    return 0
		elseif ! empty(l:rest)
		    let [l:date3, l:rest] = s:ParseDate(l:rest)
		    if s:CheckValidness(l:date3, '')
			call ingo#err#Set('Must pass only one {date}')
			return 0
		    endif
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

    let l:dateDiff = call(a:Differ, [l:date1, l:date2, a:unit])
    echomsg l:dateDiff
    return 1
endfunction
function! DateDiff#UnitCommand( Differ, isRangeGiven, startLnum, endLnum, arguments ) abort
    let l:supportedUnits = split('<>*', '\zs')
    let l:parse = matchlist(a:arguments, '\C\V\^\(' . join(map(copy(l:supportedUnits), 'escape(v:val, "\\")'), '\|') . '\)\%(\s\+\(\.\*\)\)\?\$')
    if empty(l:parse)
	call ingo#err#Set('No valid unit passed; need one of ' . join(l:supportedUnits, ', '))
	return 0
    endif
    return DateDiff#Command(l:parse[1], a:Differ, a:isRangeGiven, a:startLnum, a:endLnum, l:parse[2])
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
