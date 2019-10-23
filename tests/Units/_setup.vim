source ../_setup.vim

function! UnitAssertionDiffer( date1, date2, unit ) abort
    call vimtap#Is(a:unit, g:unit, g:description)
endfunction
