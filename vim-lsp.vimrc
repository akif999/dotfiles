let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 1
let g:lsp_text_edit_enabled = 1

let g:lsp_settings = {
\   'pyls-all': {
\       'workspace_config': {
\           'pyls': {
\                'configurationSources': ['flake8']
\            }
\       }
\   },
\  "go": {
\    "gopls": {
\      "initialization_options": {
\        "analyses" : {"fillstruct":v:false},
\        "staticcheck": v:true,
\        "directoryFilters": [
\          "-debug"
\        ],
\        "completeUnimported": v:true, "usePlaceholders": v:true,
\        "matcher": "fuzzy",
\        "codelenses": {
\          "gc_details": v:false,
\          "generate": v:true,
\          "test": v:true,
\          "tidy": v:true,
\          "vendor": v:false
\        },
\        "hoverKind": "SynopsisDocumentation"
\      }
\    }
\  }
\}

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <C-]> :LspDefinition<cr>
  nmap <M-h> :LspHover<cr>
  nmap <M-n> :LspNextError<cr>
  nmap <M-p> :LspPreviousError<cr>
endfunction

autocmd BufWritePre *.py LspDocumentFormatSync
" autocmd BufWritePre *.go silent !goimports -w expand("%")

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

