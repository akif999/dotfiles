let g:lightline = {
\   'active': {
\       'left': [ [ 'mode', 'paste' ],
\                 [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\   },
\   'inactive': {
\       'left': [ [ 'relativepath' ] ]
\   },
\   'component_function': {
\       'gitbranch': 'FugitiveHead'
\   }
\}
