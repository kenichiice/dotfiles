set fileencodings=cp932,utf-8,euc-jp
scriptencoding utf-8

"" vundle
"set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'itchyny/lightline.vim'
"Bundle 'kana/vim-smartinput'
"Bundle 'Shougo/neocomplete'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
"Bundle 'Shougo/unite-build'
Bundle 'Shougo/vimproc'
Bundle 'vim-jp/vimdoc-ja'
"Bundle 'w0ng/vim-hybrid'
Bundle 'tpope/vim-dispatch'
Bundle 't9md/vim-quickhl'
Bundle 'a.vim'
Bundle 'matchit.zip'
"Bundle 'diffchar.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'cohama/agit.vim'
"Bundle 'summerfruit256.vim'
"Bundle 'taglist.vim'
Bundle 'vcscommand.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'Yggdroot/indentLine'
filetype plugin indent on     " required! 

if !has('gui_running')
    set t_Co=256
endif

set hlsearch
set incsearch

set mouse=a
set ttymouse=xterm2
"set t_ti= t_te=

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set display=lastline

set history=1000
set scrolloff=100
set backspace=indent,eol,start
set wildmode=list:longest
set ambiwidth=double
"set ambiwidth=single

" 以下は vim 7.3 が必要
set undodir=~/.vimundo
set undofile

set virtualedit+=block

set makeprg=env\ LANG=C\ make

" helpがひけないので。http://d.hatena.ne.jp/vikke_bsd/20110926
set notagbsearch

syntax on
set background=light
"colorscheme hybrid-light
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized
colorscheme peachpuff

augroup vimrc
    autocmd!
    autocmd ColorScheme * highlight Search ctermfg=white ctermbg=70
    autocmd ColorScheme * highlight Statement ctermfg=20 cterm=bold
    autocmd ColorScheme * highlight Todo ctermfg=white ctermbg=211

    "autocmd FileType ruby set softtabstop=2 shiftwidth=2 autoindent
    "autocmd FileType c,cpp set cindent
    "autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*(\@=/
    "autocmd FileType c,cpp hi CFunction ctermfg=darkcyan
    "autocmd FileType c,cpp nmap <C-]> <C-]>ww
    autocmd QuickfixCmdPost vimgrep copen 10
    "autocmd BufRead,BufNewFile tmp*hg setfiletype hg
    autocmd FileType gitcommit syntax off

    "highlight nagasugi ctermfg=red
    "autocmd FileType c,cpp call matchadd("nagasugi", '.\%>81v')
    highlight zenkakuda ctermbg=gray
    autocmd VimEnter,WinEnter * call matchadd("zenkakuda", '\%u3000')
augroup END
"set cinoptions=g0,+2s
"set cinoptions=:0,g0,t0
set formatoptions=qro

set listchars=tab:^\ ,trail:_
set list
highlight SpecialKey ctermfg=7

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
set showtabline=2
set statusline=%<%f\ %m%r%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%v
set tabline=%!MakeTabLine()
highlight StatusLine cterm=NONE ctermfg=white ctermbg=32
highlight StatusLineNC cterm=NONE ctermfg=white ctermbg=grey
highlight VertSplit cterm=NONE ctermfg=white ctermbg=grey
highlight TabLine cterm=NONE ctermfg=white ctermbg=162 cterm=bold
highlight TabLineFill cterm=NONE ctermfg=white ctermbg=darkgrey
highlight TabLineSel cterm=NONE ctermfg=white ctermbg=grey

function! s:tabpage_label(n)
  " n 番目のタブのラベルを返す
  " t:title と言う変数があったらそれを使う
  let title = gettabvar(a:n, 'title')
  if title !=# ''
    return title
  endif

  " タブページ内のバッファのリスト
  let bufnrs = tabpagebuflist(a:n)

  " カレントタブページかどうかでハイライトを切り替える
  let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLineFill#'

  " バッファが複数あったらバッファ数を表示
  let no = ''
  "let no = len(bufnrs)
  "if no is 1
  "  let no = ''
  "endif
  " タブページ内に変更ありのバッファがあったら '+' を付ける
  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
  let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

  " カレントバッファ
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
  let fname = bufname(curbufnr)

  let label = no . mod . sp . fname

  return '%' . a:n . 'T' . hi . ' '. label . ' %T%#TabLineFill#'
endfunction

function! MakeTabLine()
  let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
  let sep = ''  " タブ間の区切り
  let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
  let left = '%#TabLine#' . fnamemodify(getcwd(), ":~")
  let right = ''
  return left . sep . tabpages . '%=' . right
endfunction

nnoremap <Space> <C-F>
nnoremap <C-G> :vimgrep /\<<C-R><C-W>\>/ **/*.{c,cc,cpp,h,hpp}

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>

set tags=tags;$HOME
nnoremap <C-]> g<C-]>
nnoremap <C-W><C-]> <C-W>g<C-]>
nnoremap <C-W>] <C-W>g<C-]>

" for include file searching
"set path+=include
"set path+=/usr/include/c++/4.8.2
"set path+=/home/kenichi/include

" pathogen.vim
"""call pathogen#runtime_append_all_bundles()
"""call pathogen#helptags()
"""
" neocomplcache
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_auto_select = 1
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-e> neocomplcache#cancel_popup()

"neocomplete
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_auto_select = 0
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-e> neocomplete#cancel_popup()

" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
"let g:unite_enable_ignore_case = 1
"let g:unite_enable_smart_case = 1
"call unite#set_buffer_name_option('default', 'ignorecase', 1)
"call unite#set_buffer_name_option('default', 'smartcase', 1)
"call unite#custom#profile('source/buffer', 'context.ignorecase', 1)
"call unite#custom#profile('source/buffer', 'context.smartcase', 1)
"call unite#custom#profile('source/buffer', 'context', {
call unite#custom#profile('default', 'context', {
            \   'ignorecase' : 1,
            \   'smartcase' : 1,
            \ })

noremap <C-N> :Unite buffer<CR>
nnoremap <silent> \f :Unite outline<CR>

" quickhl
nmap m <Plug>(quickhl-manual-this)
nmap <Leader>m <Plug>(quickhl-manual-reset)

" diffchar
let g:DiffUnit = "Word3"
""nnoreamp <Leader>c <Plug>ToggleDiffCharAllLines
nmap <silent> <Leader>c <Plug>ToggleDiffCharCurrentLine
""nnoremap <C-y> <Plug>ToggleDiffCharCurrentLine
"nmap <silent> <C-y> <Plug>ToggleDiffCharAllLines

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
"let Tlist_Inc_Winwidth=0
""let Tlist_WinWidth=35
"let Tlist_Display_Tag_Scope = 0
""let Tlist_Display_Prototype=1
""let Tlist_Exit_OnlyWindow=1
""let Tlist_Use_Horiz_Window = 1
""let Tlist_Use_Right_Window = 1
"nnoremap <silent> \f :TlistToggle<CR>

" ShowFunc.vim
"""let g:ShowFuncScanType = "current"
"""let g:ShowFuncSortType = "no"
"""map  NewKey   <Plug>ShowFunc
"""map! NewKey   <Plug>ShowFunc
"""map  \f   <Plug>ShowFunc
"""map! \f   <Plug>ShowFunc 

"" lightline
"let g:lightline = {
"            \ 'colorscheme': 'kenichi',
"            \ 'component': {
"            \   'rows': '%L',
"            \   'pwd': '%.55(%{fnamemodify(getcwd(), ":~")}%)',
"            \   'bom': '%{&bomb?"BOM":""}',
"            \ },
"            \ 'tab_component': {
"            \   'relativepath': '%f',
"            \ },
"            \ 'separator': { 'left': '●', 'right': '●' },
"            \ 'subseparator': { 'left': '|', 'right': '|' },
"            \ 'active': {
"            \   'left': [ [ 'mode', 'paste' ],
"            \             [ 'relativepath', 'modified', 'readonly' ],
"            \             [ 'bom' ],
"            \             [ 'fileencoding' ],
"            \             [ 'fileformat' ] ],
"            \   'right': [ [ 'lineinfo' ], [ 'rows' ], [ 'filetype' ] ]
"            \ },
"            \ 'inactive': {
"            \   'left': [ [ 'relativepath', 'modified', 'readonly'],
"            \             [ 'bom' ],
"            \             [ 'fileencoding'],
"            \             [ 'fileformat'] ],
"            \   'right': [ [ 'lineinfo' ], [ 'rows' ], [ 'filetype' ] ]
"            \ },
"            \ 'tabline': {
"            \   'left': [ [ 'pwd' ], [ 'tabs' ] ],
"            \   'right': [ [] ]
"            \ },
"            \ 'tab': {
"            \   'active': [ 'filename' ],
"            \   'inactive': [ 'filename' ]
"            \ },
"            \ }

if filereadable($HOME."/.vimrc_local")
    source $HOME/.vimrc_local
endif
