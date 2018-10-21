" DateDiff.vim: Calculate difference between two dates.
"
" DEPENDENCIES:
"   - ingo-library.vim plugin
"
" Copyright: (C) 2018 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_DateDiff') || (v:version < 700)
    finish
endif
let g:loaded_DateDiff = 1

"- configuration ---------------------------------------------------------------

if ! exists('g:DateDiff_DatePatterns')
    let s:monthsExpr = '\%(' . join(split('Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec' . ' ' . 'January February March April May June July August September October November December', ' '), '\|') . '\)'

    let g:DateDiff_DatePatterns = [
    \   '\<\d\d\d\d[01]\d[0123]\d\%([ _-][012]\d[0-5]\d\%(\d\d\)\?\)\?\>',
    \   '\<\d\d\d\d-\%([01]\d\|' . s:monthsExpr . '\)-[0123]\d\%([ _-][012]\d:[0-5]\d\%(:[0-5]\d\)\?\)\?\>',
    \   '\<[0123]\d-\%([01]\d\|' . s:monthsExpr . '\)-\d\d\d\d\%([ _-][012]\d:[0-5]\d\%(:[0-5]\d\)\?\)\?\>',
    \   '\<' . s:monthsExpr . '\s\+[0123]\?\d\s\+\(\d\d\d\d\|[012]\d:[0-5]\d\)\>',
    \   '\<\d\d\d\d-[01]\d-[0123]\dT[012]\d:[0-5]\d:[0-5]\dZ\>'
    \]
    unlet s:monthsExpr
endif

if ! exists('g:DateDiff_Differ')
    if v:version < 702 | runtime autoload/DateDiff.vim | endif  " The Funcref doesn't trigger the autoload in older Vim versions.
    let g:DateDiff_Differ = function('DateDiff#Diff')
endif

"- commands --------------------------------------------------------------------

command! -range=-1 -nargs=* DateDiff if ! DateDiff#Command(g:DateDiff_Differ, (<count> != -1), <line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
