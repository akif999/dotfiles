function! s:warnCrlfGoFile()
    if exists('g:disable_warnCrlfGoFile') && g:disable_warnCrlfGoFile == 1
        return
    endif
    if &ff != 'unix'
        call confirm("Please fix the line endings to LF", "OK")
    endif
endfunction

function! s:disableWarnCrlfGoFile()
    let g:disable_warnCrlfGoFile = 1
endfunction


autocmd FileType go execute s:warnCrlfGoFile()
command! WarnCrlfGoFile call s:disableWarnCrlfGoFile()
