" gvimrc "

" Font "

if has('win32')
    set guifont=Migu_1M:h12
    set linespace=1
    if has('kaoriya')
        set ambiwidth=auto
    endif
elseif has('mac')
    set guifont=Monaco:h11
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

colorscheme molokai
source $HOME/.vim/dein/repos/github.com/sago35/mark.vim/plugin/mark.vim
