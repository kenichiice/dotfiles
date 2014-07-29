setlocal cindent

syntax match CFunction /[a-zA-Z_]\w* *(\@=/
highlight CFunction ctermfg=darkcyan

set cinoptions=:0,g0,t0

"autocmd VimEnter,WinEnter *.{c,cpp,h} call matchadd("nagasugi", '.\%>81v')
"set colorcolumn=81
