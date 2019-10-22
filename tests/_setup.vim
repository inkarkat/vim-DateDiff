let g:IngoLibrary_NowEpoch = 1540031418
let g:IngoLibrary_StrftimeEmulation = {'%Y': '2018'}
call vimtest#AddDependency('vim-ingo-library')

runtime plugin/DateDiff.vim


function! AssertionDiffer( date1, date2 )
    call vimtap#Is(a:date1, g:date1, g:description . ' - first date')
    call vimtap#Is(a:date2, g:date2, g:description . ' - second date')
    return ''
endfunction
function! NotCalledDiffer( date1, date2 )
    call vimtap#Ok(0, 'differ should not have been called')
endfunction

function! s:MakeDate( date ) abort
    if type(a:date) == type(0)
	return a:date
    elseif type(a:date) == type([])
	return [ingo#date#epoch#ConvertTo(a:date[0]), a:date[1]]
    else
	return ingo#date#epoch#ConvertTo(a:date)
    endif
endfunction
function! DateDiff( date1, date2, command )
    let g:date1 = s:MakeDate(a:date1)
    let g:date2 = s:MakeDate(a:date2)
    let g:description = a:command

    silent! execute a:command
endfunction
