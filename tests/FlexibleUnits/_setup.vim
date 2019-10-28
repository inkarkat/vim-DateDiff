source ../_setup.vim

function! Differ( ... ) abort
    let l:defaultUnit = (exists('g:unit') ? g:unit : '*')
    if a:0 == 1
	let l:args = [0, a:1, l:defaultUnit]
    elseif a:0 == 2
	let l:args = [a:1, a:2, l:defaultUnit]
    else
	let l:args = a:000
    endif
    return call('DateDiff#FlexibleUnits#Diff', l:args)
endfunction

if has('num64')
    function! Num64( value ) abort
	return a:value
    endfunction
else
    function! Num64( value ) abort
	return ''
    endfunction
endif
