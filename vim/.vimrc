set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
scriptencoding utf-8
set fileformat=unix

set laststatus=2
set ambiwidth=double

set belloff=all

set termwinsize=12x900

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

set diffopt=filler,context:10000,vertical,internal

set ignorecase
set smartcase
set wrapscan
set incsearch

nmap <ESC><ESC> :nohlsearch<cr>

nmap <DOWN>  :cnext<cr>
nmap <UP>    :cprev<cr>
nmap <LEFT>  :colder<cr>
nmap <RIGHT> :cnewer<cr>

nmap <A-RIGHT>  :diffget<cr>
nmap <A-LEFT>   :diffput<cr>
nmap <A-DOWN>   ]c
nmap <A-UP>     [c
nmap <A-u> :Unite file_mru buffer<cr>
nmap <A-1> :Files<cr>
nmap <A-2> :GFiles<cr>
nmap <A-3> :Buffers<cr>

nmap <F1> :Unite file_mru<cr>
nmap <F9> :Git log --graph<cr>
nmap <F10> :Git log --graph --all<cr>

set directory=~/.vim/cache/swap
set backupdir=~/.vim/cache/backup
set undodir=~/.vim/cache/undo

" [32;2u
" imap <S-Space> <Space>
tnoremap <S-Space> <Space>

" Highlight endspace "
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

source ~/lightline.vimrc

" reload vimrc
command! VimReload
    \ source $MYVIMRC
    \ | if has('gui_running') && filereadable(expand('~/.gvimrc'))
    \ |    source ~/.gvimrc
    \ | source ~/.gvimrc
    \ | endif

" cmd.exe
function Cmd()
    silent! terminal
    set wfh
endfunction
command! Cmd call Cmd()

" git-bash
function Bash()
    silent! terminal ++close "c:\Program Files\Git\bin\bash.exe"
    set wfh
endfunction
command! Bash call Bash()

let g:rustfmt_autosave=1

" cscope options
" set cscopequickfix=s+,c+,d+,i+,t+,e+,a+
set cscopequickfix=s-,c-,d-,i-,t-,e-
:command Csu !cscope -Rb
:command Csk cscope kill 0
:command Csa cscope add cscope.out

" fzf
let g:fzf_preview_window=""

" ctrlp
let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
let g:ctrlp_switch_buffer = 0

" vaffle
let g:vaffle_show_hidden_files = 1

source ~/go.vimrc
source ~/vim-lsp.vimrc

call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
" Plug 'derekwyatt/vim-scala'
" Plug 'rust-lang/rust.vim'
Plug 'sago35/mark.vim'
Plug 'sago35/tinygo.vim', { 'branch': 'main' }
" Plug 'zah/nim.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'itchyny/lightline.vim'
Plug 'cocopon/vaffle.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-goimports'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'buoto/gotests-vim'
Plug 'ziglang/zig.vim'
Plug 'AndrewRadev/linediff.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-matchfuzzy'

call plug#end()
