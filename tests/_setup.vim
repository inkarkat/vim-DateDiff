let g:IngoLibrary_NowEpoch = 1540031418
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

function! DateDiff( date1, date2, command )
    let g:date1 = (type(a:date1) == type(0) ? a:date1 : ingo#date#epoch#ConvertTo(a:date1))
    let g:date2 = (type(a:date2) == type(0) ? a:date2 : ingo#date#epoch#ConvertTo(a:date2))
    let g:description = a:command

    silent! execute a:command
endfunction
