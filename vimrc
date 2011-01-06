set fileencodings=utf-8,euc-jp,cp932
set hlsearch
set incsearch

set mouse=a
set ttymouse=xterm2

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set display=lastline

set scrolloff=100
set backspace=indent,eol,start
set wildmode=list:longest
"set ambiwidth=double
set ambiwidth=single

set makeprg=env\ LANG=C\ make

syntax on
colorscheme peachpuff

filetype plugin indent on
"autocmd FileType ruby set softtabstop=2 shiftwidth=2 autoindent
"autocmd FileType c,cpp set cindent
"autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*(\@=/
"autocmd FileType c,cpp hi CFunction ctermfg=darkcyan
"autocmd FileType c,cpp nmap <C-]> <C-]>ww
autocmd QuickfixCmdPost vimgrep copen 20
"autocmd BufRead,BufNewFile tmp*hg setfiletype hg

"set cinoptions=g0,+2s
set cinoptions=:0,g0,t0,(1s
set formatoptions=qro

set listchars=tab:^\ ,trail:_
set list
highlight SpecialKey ctermfg=7

highlight zenkakuda ctermbg=7
match zenkakuda /　/
"syntax match zenkakuda /　/
"highlight nagasugi ctermbg=yellow
"syntax match nagasugi /.\%>81v/

highlight DiffText ctermfg=white ctermbg=red
highlight DiffChange ctermfg=white ctermbg=magenta
highlight DiffAdd ctermfg=white ctermbg=blue

"wrap
"set nowrap
"set sidescroll=1
"set listchars+=precedes:<,extends:>

highlight Folded ctermfg=darkmagenta
highlight Folded ctermbg=NONE
"set foldmethod=syntax
"set foldlevelstart=99

set whichwrap=b
"set whichwrap=b,s,h,<,>,[,]
set number
set numberwidth=6
set splitbelow

set laststatus=2
set statusline=%<%f\ %m%r%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%v

nnoremap <Space> <C-F>
nnoremap <C-G> :vimgrep /\<<C-R><C-W>\>/ **/*

set tags=tags;$HOME
nnoremap <C-]> g<C-]>

" for include file searching
set path+=include

"for yankring
"set viminfo+=!
"let yankring_replace_n_pkey = ',p'
"let yankring_replace_n_nkey = ',n'

" fuzzyfinder
nnoremap <C-N> :FufBuffer!<CR>
nnoremap <C-P> :FufMruFile!<CR>
"let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}
let g:fuf_keyOpenSplit = '<C-s>'
let g:fuf_keyPrevPattern = ''
let g:fuf_modesDisable = [ 'mrucmd' ]

" autocomplpop
let g:acp_ignorecaseOption = 0

" netrw
let g:netrw_liststyle = 3

" yanktmp.vim
"map <silent> sy :call YanktmpYank()<CR>
"nmap <silent> sp :call YanktmpPaste_p()<CR>
"nmap <silent> sP :call YanktmpPaste_P()<CR>

" gtags.vim
"nmap  :Gtags -r <C-R><C-W><CR>
"nmap  :GtagsCursor<CR>W

" taglist.vim
"let Tlist_Auto_Open=1
let Tlist_Inc_Winwidth=0
let Tlist_WinWidth=35
"let Tlist_Display_Tag_Scope = 0
""let Tlist_Display_Prototype=1
""let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Horiz_Window = 1
""let Tlist_Use_Right_Window = 1
nnoremap <silent> \f :TlistToggle<CR>

" ShowFunc.vim
"""let g:ShowFuncScanType = "current"
"""let g:ShowFuncSortType = "no"
"""map  NewKey   <Plug>ShowFunc
"""map! NewKey   <Plug>ShowFunc
"""map  \f   <Plug>ShowFunc
"""map! \f   <Plug>ShowFunc 

if filereadable($HOME."/.vimrc_local")
    source $HOME/.vimrc_local
endif
