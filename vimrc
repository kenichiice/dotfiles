set fileencodings=utf-8,cp932,euc-jp
scriptencoding utf-8

filetype plugin indent on

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
set autoread

set history=1000
set scrolloff=100
set backspace=indent,eol,start
set wildmode=list:longest
set wildignore=tags,*.o
set ambiwidth=double
"set ambiwidth=single

" 以下は vim 7.3 が必要
set undodir=~/.vimundo
set undofile

set virtualedit+=block

set makeprg=env\ LANG=C\ make

" helpがひけないので。http://d.hatena.ne.jp/vikke_bsd/20110926
set notagbsearch

set breakindent
set breakindentopt=shift:4
set linebreak

syntax on
set background=light
"colorscheme hybrid-light
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized
"colorscheme peachpuff
colorscheme kenichi
"colorscheme xcode-default

augroup vimrc
    autocmd!
    "autocmd ColorScheme * highlight Search ctermfg=white ctermbg=70
    "autocmd ColorScheme * highlight Statement ctermfg=20 cterm=bold
    "autocmd ColorScheme * highlight Todo ctermfg=white ctermbg=211

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

set fillchars+=diff:\ 
"highlight DiffText ctermfg=white ctermbg=red
"highlight DiffChange ctermfg=white ctermbg=magenta
"highlight DiffAdd ctermfg=white ctermbg=blue

"wrap
"set nowrap
"set sidescroll=1
"set listchars+=precedes:<,extends:>

"highlight Folded ctermfg=darkmagenta
"highlight Folded ctermbg=NONE
"set foldmethod=syntax
"set foldlevelstart=99
set foldtext=getline(v:foldstart).repeat('+',v:foldlevel)
"set fillchars+=fold:=

set whichwrap=b
"set whichwrap=b,s,h,<,>,[,]
set number
set numberwidth=6
set splitbelow

set laststatus=2
set showtabline=2
set statusline=%<%f\ %m%r%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%v

set tabline=%!MakeTabLine()
"highlight StatusLine cterm=NONE ctermfg=white ctermbg=35
"highlight StatusLineNC cterm=NONE ctermfg=white ctermbg=grey
"highlight VertSplit cterm=NONE ctermfg=white ctermbg=grey
"highlight TabLine cterm=NONE ctermfg=white ctermbg=162 cterm=bold
"highlight TabLineFill cterm=NONE ctermfg=white ctermbg=darkgrey
"highlight TabLineSel cterm=NONE ctermfg=white ctermbg=grey

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
nnoremap <C-G> :vimgrep /\<<C-R><C-W>\>/ **
"nnoremap <C-G> :vimgrep /\<<C-R><C-W>\>/ **/*.{c,cc,cpp,h,hpp,cu,py}

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>

set tags=tags;$HOME
nnoremap <C-]> g<C-]>
nnoremap <C-W><C-]> <C-W>g<C-]>
nnoremap <C-W>] <C-W>g<C-]>

" netrw
let g:netrw_liststyle = 3

if filereadable($HOME."/.vimrc_local")
    source $HOME/.vimrc_local
endif

