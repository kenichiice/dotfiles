setlocal cindent

syntax match CFunction /[a-zA-Z_]\w* *(\@=/
highlight CFunction ctermfg=darkcyan

setlocal shiftwidth=2
setlocal softtabstop=2

setlocal cinoptions=:0,g0,t0,N-s,(s,k2s,m1,i2s

setlocal path+=include
setlocal path+=/usr/include/c++/4.8.2
setlocal path+=/home/kenichi/include

setlocal matchpairs+=<:>

autocmd VimEnter,WinEnter *.{c,cpp,h} call matchadd("nagasugi", '.\%>101v')
"set colorcolumn=81

"highlight nagasugi ctermfg=red
"autocmd FileType c,cpp call matchadd("nagasugi", '.\%>81v')
