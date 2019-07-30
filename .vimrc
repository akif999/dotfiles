" Encoding, Format "
set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
scriptencoding utf-8
set fileformat=unix

" Edits "
syntax on

set title
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=indent,eol,start
set showcmd
set showmatch
set number
set list
set listchars=tab:>-,extends:<

" Diffopttion "
set diffopt=filler,context:10000,vertical,internal

" Search "
set ignorecase
set smartcase
set wrapscan

" Keybind "
nmap <ESC><ESC> :nohlsearch<cr>

nmap <DOWN>  :cnext<cr>
nmap <UP>    :cprev<cr>
nmap <LEFT>  :colder<cr>
nmap <RIGHT> :cnewer<cr>

nmap <A-RIGHT>  :diffget<cr>
nmap <A-LEFT> :diffput<cr>
nmap <A-DOWN>  ]c
nmap <A-UP>    [c
nmap <A-u> :Unite file_mru buffer<cr>

nmap <F1> :Unite file_mru<cr>

" Highlight endspace "
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Cache "
set directory=~/.vim/cache/swap
set backupdir=~/.vim/cache/backup
set undodir=~/.vim/cache/undo
"

" formatter options
" vim-go "
let g:go_fmt_command="goimports"
" rust.vim "
let g:rustfmt_autosave=1

" cscope options
set cscopequickfix=s+,c+,d+,i+,t+,e+,a+

" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('fatih/vim-go')
"  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('derekwyatt/vim-scala')
  call dein#add('rust-lang/rust.vim')
  call dein#add('sago35/mark.vim')
  call dein#add('zah/nim.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()

  " Required:
  filetype plugin indent on
  syntax enable

  " If you want to install not installed plugins on startup.
  "if dein#check_install()
  "  call dein#install()
  "endif

" End dein Scripts-------------------------"

