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
set guioptions+=k
set guioptions-=b
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" HighlightSearch (it must be defined in .gvimrc)
set hlsearch

set background=dark

" colorscheme kalisi
colorscheme github
