" Encoding, Format "
set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
scriptencoding utf-8
set fileformat=unix

set laststatus=2
set ambiwidth=double

set belloff=all

set termwinsize=12x900

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
set incsearch

" Keybind "
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

 " vim-lsp
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <C-]> :LspDefinition<cr>
  nmap <M-h> :LspHover<cr>
  nmap <M-n> :LspNextError<cr>
  nmap <M-p> :LspPreviousError<cr>
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 1
let g:lsp_text_edit_enabled = 1

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

" formatter options
" vim-go "
let g:go_fmt_command="goimports"
" rust.vim "
let g:rustfmt_autosave=1

" cscope options
" set cscopequickfix=s+,c+,d+,i+,t+,e+,a+
set cscopequickfix=s-,c-,d-,i-,t-,e-
:command Csu !cscope -Rb
:command Csk cscope kill 0
:command Csa cscope add cscope.out

" vim-lsp
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'clangd',
"         \ 'cmd': {server_info->['clangd', '-background-index']},
"         \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"         \})
" endif

" lsp for Go
" if executable('gopls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'gopls',
"         \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
"         \ 'whitelist': ['go'],
"         \ })
"     autocmd BufWritePre *.go LspDocumentFormatSync
" endif

" if executable('go-langserver')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'go-langserver',
"         \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
"         \ 'whitelist': ['go'],
"         \ })
" endif


" fzf
let g:fzf_preview_window=""

call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'derekwyatt/vim-scala'
Plug 'rust-lang/rust.vim'
Plug 'sago35/mark.vim'
Plug 'zah/nim.vim'
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

call plug#end()
