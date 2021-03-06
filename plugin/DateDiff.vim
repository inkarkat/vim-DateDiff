" DateDiff.vim: Calculate difference between two dates.
"
" DEPENDENCIES:
"   - ingo-library.vim plugin
"
" Copyright: (C) 2018-2020 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_DateDiff') || (v:version < 700)
    finish
endif
let g:loaded_DateDiff = 1
let s:save_cpo = &cpo
set cpo&vim

"- configuration ---------------------------------------------------------------

if ! exists('g:DateDiff_ShortMonths')
    let g:DateDiff_ShortMonths = split('Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec', ' ')
endif
if ! exists('g:DateDiff_LongMonths')
    let g:DateDiff_LongMonths = split('January February March April May June July August September October November December', ' ')
endif
if ! exists('g:DateDiff_DatePatterns')
    let s:monthsExpr = '\%(' . join(g:DateDiff_ShortMonths + g:DateDiff_LongMonths, '\|') . '\)'

    let g:DateDiff_DatePatterns = [
    \   ['\<\(\d\d\d\d\)\([01]\d\)\([0123]\d\)[ _-]\([012]\d\)\([0-5]\d\)\([0-5]\d\)\(,\d\{3}\)\?\>', '\1-\2-\3 \4:\5:\6\7'],
    \   ['\<\(\d\d\d\d\)\([01]\d\)\([0123]\d\)[ _-]\([012]\d\)\([0-5]\d\)\>', '\1-\2-\3 \4:\5:00'],
    \   ['\<\(\d\d\d\d\)\([01]\d\)\([0123]\d\)\>', '\1-\2-\3'],
    \   ['\<\(\d\d\d\d-[01]\d-[0123]\d\)[ _-]\([012]\d:[0-5]\d:[0-5]\d\)\(,\d\{3}\)\?\>', '\1 \2\3'],
    \   ['\<\(\d\d\d\d-[01]\d-[0123]\d\)[ _-]\([012]\d:[0-5]\d\)\>', '\1 \2:00'],
    \   ['\<\(\d\d\d\d-[01]\d-[0123]\d\)\>', '&'],
    \   ['\<\(\d\d\d\d\)-\(' . s:monthsExpr . '\)-\([0123]\d\)[ _-]\([012]\d:[0-5]\d:[0-5]\d\)\(,\d\{3}\)\?\>', '\=submatch(1) . "-" . DateDiff#ParseMonth(submatch(2)) . "-" . submatch(3) . " " . submatch(4) . submatch(5)'],
    \   ['\<\(\d\d\d\d\)-\(' . s:monthsExpr . '\)-\([0123]\d\)[ _-]\([012]\d:[0-5]\d\)\>', '\=submatch(1) . "-" . DateDiff#ParseMonth(submatch(2)) . "-" . submatch(3) . " " . submatch(4) . ":00"'],
    \   ['\<\(\d\d\d\d\)-\(' . s:monthsExpr . '\)-\([0123]\d\)\>', '\=submatch(1) . "-" . DateDiff#ParseMonth(submatch(2)) . "-" . submatch(3)'],
    \   ['\<\([0123]\d\)-\([01]\d\)-\(\d\d\d\d\)[ _-]\([012]\d:[0-5]\d:[0-5]\d\)\(,\d\{3}\)\?\>', '\3-\2-\1 \4\5'],
    \   ['\<\([0123]\d\)-\([01]\d\)-\(\d\d\d\d\)[ _-]\([012]\d:[0-5]\d\)\>', '\3-\2-\1 \4:00'],
    \   ['\<\([0123]\d\)-\([01]\d\)-\(\d\d\d\d\)\>', '\3-\2-\1'],
    \   ['\<\([0123]\d\)-\(' . s:monthsExpr . '\)-\(\d\d\d\d\)[ _-]\([012]\d:[0-5]\d:[0-5]\d\(,\d\{3}\)\?\)\>', '\=submatch(3) . "-" . DateDiff#ParseMonth(submatch(2)) . "-" . submatch(1) . " " . submatch(4) . submatch(5)'],
    \   ['\<\([0123]\d\)-\(' . s:monthsExpr . '\)-\(\d\d\d\d\)[ _-]\([012]\d:[0-5]\d\)\>',  '\=submatch(3) . "-" . DateDiff#ParseMonth(submatch(2)) . "-" . submatch(1) . " " . submatch(4) . ":00"'],
    \   ['\<\([0123]\d\)-\(' . s:monthsExpr . '\)-\(\d\d\d\d\)\>',  '\=submatch(3) . "-" . DateDiff#ParseMonth(submatch(2)) . "-" . submatch(1) . " " . submatch(4)'],
    \   ['\<\(' . s:monthsExpr . '\)\s\+\([0123]\?\d\),\?\s\+\(\d\d\d\d\)\s\+\([012]\d:[0-5]\d\)\>', '\=submatch(3) . "-" . DateDiff#ParseMonth(submatch(1)) . "-" . submatch(2) . " " . submatch(4) . ":00"'],
    \   ['\<\(' . s:monthsExpr . '\)\s\+\([0123]\?\d\),\?\s\+\(\d\d\d\d\)\>', '\=submatch(3) . "-" . DateDiff#ParseMonth(submatch(1)) . "-" . submatch(2)'],
    \   ['\<\(' . s:monthsExpr . '\)\s\+\([0123]\?\d\),\?\s\+\([012]\d:[0-5]\d\)\>', '\=ingo#date#strftime("%Y") . "-" . DateDiff#ParseMonth(submatch(1)) . "-" . submatch(2) . " " . submatch(3) . ":00"'],
    \   ['\<\(\d\d\d\d-[01]\d-[0123]\d\)T\([012]\d:[0-5]\d:[0-5]\d\)Z\>', '\1 \2']
    \]
    unlet s:monthsExpr
endif
if ! exists('g:DateDiff_TimePatterns')
    let g:DateDiff_TimePatterns = [
    \   ['\<\([012]\d\)\([0-5]\d\)\([0-5]\d\)\(,\d\{3}\)\?\>', '\1:\2:\3\4'],
    \   ['\<\([012]\d\)\([0-5]\d\)\>', '\1:\2:00'],
    \   ['\<[012]\d:[0-5]\d:[0-5]\d\(,\d\{3}\)\?\>', '&'],
    \   ['\<[012]\d:[0-5]\d\>', '&:00']
    \]
endif

if ! exists('g:DateDiff_Differ')
    if v:version < 702 | runtime autoload/DateDiff/FlexibleUnits.vim | endif  " The Funcref doesn't trigger the autoload in older Vim versions.
    let g:DateDiff_Differ = function('DateDiff#FlexibleUnits#Diff')
endif

"- commands --------------------------------------------------------------------

command! -range=-1 -nargs=* DateDiff
\ if ! DateDiff#Command('*', 'DateDiff_DatePatterns', g:DateDiff_Differ, (<count> != -1), <line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif
command! -range=-1 -nargs=* TimeDiff
\ if ! DateDiff#Command('*', 'DateDiff_TimePatterns', g:DateDiff_Differ, (<count> != -1), <line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif

call ingo#plugin#cmdcomplete#MakeFirstArgumentFixedListCompleteFunc(g:DateDiff#AllUnits, '', 'DateDiffUnitComplete')
command! -range=-1 -nargs=+ -complete=customlist,DateDiffUnitComplete DateDiffUnit
\ if ! DateDiff#UnitCommand( 'DateDiff_DatePatterns', g:DateDiff_Differ, (<count> != -1), <line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif
command! -range=-1 -nargs=+ -complete=customlist,DateDiffUnitComplete TimeDiffUnit
\ if ! DateDiff#UnitCommand( 'DateDiff_TimePatterns', g:DateDiff_Differ, (<count> != -1), <line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
