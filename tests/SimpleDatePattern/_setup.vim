source ../_setup.vim

let g:DateDiff_DatePattern = '\<\d\d\d\d-[01]\d-[0123]\d\>'

function! AssertionDiffer( date1, date2 )
    call vimtap#Is(a:date1, g:date1, g:description . ' - first date')
    call vimtap#Is(a:date2, g:date2, g:description . ' - second date')
    return ''
endfunction
let g:DateDiff_Differ = function('AssertionDiffer')

function! NotCalledDiffer( date1, date2 )
    call vimtap#Ok(0, 'differ should not have been called')
endfunction

function! DateDiff( date1, date2, command )
    let g:date1 = (type(a:date1) == type(0) ? a:date1 : ingo#date#epoch#ConvertTo(a:date1))
    let g:date2 = (type(a:date2) == type(0) ? a:date2 : ingo#date#epoch#ConvertTo(a:date2))
    let g:description = a:command

    silent! execute a:command
endfunction
