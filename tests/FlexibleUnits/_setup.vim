source ../_setup.vim

function! Differ( ... ) abort
    if a:0 == 1
	let l:args = [0, a:1]
    else
	let l:args = a:000
    endif
    return call('DateDiff#FlexibleUnits#Diff', l:args)
endfunction
