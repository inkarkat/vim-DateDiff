source ../_setup.vim

let g:DateDiff_DatePattern = '\<\d\d\d\d-[01]\d-[0123]\d\>'
let g:DateDiff_Differ = function('AssertionDiffer')
