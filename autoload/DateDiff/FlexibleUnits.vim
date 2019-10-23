" DateDiff/FlexibleUnits.vim: Obtain date difference in flexible units.
"
" DEPENDENCIES:
"   - ingo-library.vim plugin
"
" Copyright: (C) 2019 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
let s:save_cpo = &cpo
set cpo&vim

function! s:AddDiffUnit( diffInUnits, renderedDiffValue, unit ) abort
    if a:renderedDiffValue ==# '0' || a:renderedDiffValue =~# '^\d\{5,}'
	" Skip values that are zero or too large.
	return
    endif

    call add(a:diffInUnits, printf('%s %s%s', a:renderedDiffValue, a:unit, (a:renderedDiffValue ==# '1' ? '' : 's')))
endfunction
function! s:CalculateUnit( diff, divisor ) abort
    let l:roundedDiffNumber = ((100 * a:diff / a:divisor) + 5) / 10
    let l:roundedDiffValue = '' . l:roundedDiffNumber
    let [l:integerPart,l:fraction] = [l:roundedDiffValue[0:-2], l:roundedDiffValue[-1:-1]]

    " If the integer part in in the thousands or larger, there's no use to
    " include any fractions. Just round off to the closest integer value then.
    return
    \   (empty(l:integerPart) ? '0' : l:integerPart) .
    \   (l:fraction ==# '0' || len(l:integerPart) >= 4 ?
    \       '' :
    \       '.' . l:fraction
    \   )
endfunction
function! s:ParseDate( date ) abort
    return (type(a:date) == type([]) ? a:date : [a:date, 0])
endfunction
function! s:SecondsToMicros( seconds, micros ) abort
    return 1000 * a:seconds + a:micros
endfunction
function! DateDiff#FlexibleUnits#Diff( date1, date2, unit ) abort
    let [l:seconds1, l:micros1] = s:ParseDate(a:date1)
    let [l:seconds2, l:micros2] = s:ParseDate(a:date2)
    if l:seconds1 == l:seconds2 && l:micros1 == l:micros2
	return 'dates are identical'
    endif

    let l:diffInUnits = []

    " Only combine micros with seconds if we're dealing with small date
    " differences, else that might overflow.
    let l:secondsDiff = ingo#compat#abs(l:seconds2 - l:seconds1)
    if l:secondsDiff <= 3600
	let l:microsDiff = ingo#compat#abs(s:SecondsToMicros(l:seconds1, l:micros1) - s:SecondsToMicros(l:seconds2, l:micros2))

	if l:micros1 != l:micros2
	    call s:AddDiffUnit(l:diffInUnits, l:microsDiff, 'milli')
	endif
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:microsDiff, 1000), 'second')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:microsDiff, 60000), 'minute')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:microsDiff, 3600000), 'hour')
    else
	let l:daysDiff = (l:secondsDiff + 43200) / 86400

	call s:AddDiffUnit(l:diffInUnits, l:secondsDiff, 'second')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:secondsDiff, 60), 'minute')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:secondsDiff, 3600), 'hour')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:secondsDiff, 86400), 'day')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 7), 'week')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 30), 'month')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 365), 'year')
	call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 9131), 'generation')
    endif

    if a:unit ==# '*'
	return join(l:diffInUnits, ' = ')
    elseif a:unit ==# '<'
	return get(l:diffInUnits, 0, '')
    elseif a:unit ==# '>'
	return get(l:diffInUnits, -1, '')
    elseif a:unit ==# '='
	" Choose the largest one that is not just a fraction; i.e. does not
	" start with 0.
	let l:offset = 1
	while get(l:diffInUnits, -1 * l:offset, '') =~# '^0' && len(l:diffInUnits) > l:offset
	    let l:offset += 1
	endwhile
	return get(l:diffInUnits, -1 * l:offset, '')
    else
	throw 'ASSERT: Invalid unit: ' . string(a:unit)
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
