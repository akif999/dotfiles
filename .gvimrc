" Font "
if has('win32')
    set guifont=Migu_1M:h12
    set linespace=1
    if has('kaoriya')
        set ambiwidth=auto
    endif
elseif has('mac')
    set guifont=Migu_1M:h11
elseif has('xfontset')
    set guifont=a14,r14,k14
endif

" Window "
set columns=150
set lines=80
set cmdheight=2

" Mouse -reflective on CUI-
set mouse=a
set mousefocus
set mousehide
set guioptions+=a

" HighlightSearch (it must be defined in .gvimrc)
set hlsearch

" test wininfo remind
let g:save_window_file = expand('~/.vimwinrec')
augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
          \ 'set columns=' . &columns,
          \ 'set lines=' . &lines,
          \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
          \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END

if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
endif

colorscheme molokai
source $HOME/.vim/dein/repos/github.com/sago35/mark.vim/plugin/mark.vim
