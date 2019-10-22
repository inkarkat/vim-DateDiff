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
function! DateDiff#FlexibleUnits#Diff( date1, date2 ) abort
    let l:secondsDiff = ingo#compat#abs(a:date2 - a:date1)
    if l:secondsDiff == 0
	return 'dates are identical'
    endif
    let l:daysDiff = (l:secondsDiff + 43200) / 86400

    let l:diffInUnits = []
    call s:AddDiffUnit(l:diffInUnits, l:secondsDiff, 'second')
    call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:secondsDiff, 60), 'minute')
    call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:secondsDiff, 3600), 'hour')
    call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:secondsDiff, 86400), 'day')
    call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 7), 'week')
    call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 30), 'month')
    call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 365), 'year')
    call s:AddDiffUnit(l:diffInUnits, s:CalculateUnit(l:daysDiff, 9131), 'generation')

    return join(l:diffInUnits, ' = ')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :