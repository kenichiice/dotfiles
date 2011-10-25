set fileencodings=utf-8,euc-jp,cp932

"" vundle
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'a.vim'
Bundle 'matchit.zip'
Bundle 'taglist.vim'
Bundle 'vcscommand.vim'
filetype plugin indent on     " required! 

set hlsearch
set incsearch

set mouse=a
set ttymouse=xterm2

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set display=lastline

set history=1000
set scrolloff=100
set backspace=indent,eol,start
set wildmode=list:longest
"set ambiwidth=double
set ambiwidth=single
set undodir=~/.vimundo
set undofile
set virtualedit+=block

set makeprg=env\ LANG=C\ make

syntax on
colorscheme peachpuff

"autocmd FileType ruby set softtabstop=2 shiftwidth=2 autoindent
"autocmd FileType c,cpp set cindent
"autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*(\@=/
"autocmd FileType c,cpp hi CFunction ctermfg=darkcyan
"autocmd FileType c,cpp nmap <C-]> <C-]>ww
autocmd QuickfixCmdPost vimgrep copen 15
"autocmd BufRead,BufNewFile tmp*hg setfiletype hg
autocmd FileType gitcommit syntax off

"set cinoptions=g0,+2s
set cinoptions=:0,g0,t0
set formatoptions=qro

set listchars=tab:^\ ,trail:_
set list
highlight SpecialKey ctermfg=7

highlight nagasugi ctermfg=red
autocmd FileType c,cpp call matchadd("nagasugi", '.\%>81v')
highlight zenkakuda ctermbg=gray
autocmd VimEnter,WinEnter * call matchadd("zenkakuda", '\%u3000')

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

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>

set tags=tags;$HOME
nnoremap <C-]> g<C-]>
nnoremap <C-W><C-]> <C-W>g<C-]>
nnoremap <C-W>] <C-W>g<C-]>

" for include file searching
set path+=include

" pathogen.vim
"""call pathogen#runtime_append_all_bundles()
"""call pathogen#helptags()
"""
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-e> neocomplcache#cancel_popup()

" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
"let g:unite_enable_ignore_case = 1
"let g:unite_enable_smart_case = 1
call unite#set_buffer_name_option('default', 'ignorecase', 1)
call unite#set_buffer_name_option('default', 'smartcase', 1)

noremap <C-N> :Unite buffer<CR>

"for yankring
"set viminfo+=!
"let yankring_replace_n_pkey = ',p'
"let yankring_replace_n_nkey = ',n'

" fuzzyfinder
"nnoremap <C-N> :FufBuffer!<CR>
"nnoremap <C-P> :FufMruFile!<CR>
"let g:fuf_keyOpenSplit = '<C-s>'
"let g:fuf_keyPrevPattern = ''
"let g:fuf_modesDisable = [ 'mrucmd' ]

" autocomplpop
"let g:acp_ignorecaseOption = 0

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
""let Tlist_WinWidth=35
"let Tlist_Display_Tag_Scope = 0
""let Tlist_Display_Prototype=1
""let Tlist_Exit_OnlyWindow=1
""let Tlist_Use_Horiz_Window = 1
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
