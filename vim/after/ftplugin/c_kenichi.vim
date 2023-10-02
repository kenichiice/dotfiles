setlocal cindent

syntax match CFunction /[a-zA-Z_]\w* *(\@=/
highlight CFunction ctermfg=darkcyan

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

setlocal cinoptions=:0,g0,t0,N-s,(s,k0,m1,i1s,+1s
"setlocal cinoptions=:0,g0,t0,N-s,(s,k2s,m1,i2s,Us

setlocal path+=include
setlocal path+=/usr/include/c++/4.8.2
setlocal path+=/home/kenichi/include

setlocal matchpairs+=<:>

"augroup c_kenichi
"    autocmd!
"    highlight nagasugi ctermfg=196
"    autocmd VimEnter,WinEnter *.{c,cpp,h} call matchadd("nagasugi", '.\%>81v')
"augroup END

"set colorcolumn=81
