""        _             _            
""  _ __ | |_   _  __ _(_)_ __  ___  
"" | '_ \| | | | |/ _` | | '_ \/ __| 
"" | |_) | | |_| | (_| | | | | \__ \ 
"" | .__/|_|\__,_|\__, |_|_| |_|___/ 
"" |_|            |___/              
""
" Use fd for finding files with ctrl+p and ignore .git
let g:ctrlp_user_command = 'fd --type f --hidden --follow --exclude .git'
let g:indentLine_conceallevel=1
let g:indentLine_char='·'
let g:indentLine_enabled=1
" ACK! Settings
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1
" Vim-Notes Settings
let g:notes_directories = ['~/Documents/Notes']


let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ]
      \   ]
      \ },
      \ }


lua << EOF
vim.lsp.set_log_level("debug")
lspconfig = require'lspconfig'

completion_callback = require'completion'.on_attach
lspconfig.pyright.setup{on_attach=completion_callback}
lspconfig.tsserver.setup{on_attach=completion_callback}
require'trouble'.setup{}

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(require('lsp_extensions.workspace.diagnostic').handler, {
        underline = false,
        signs = true,
        update_in_insert = false -- delay update
    })

EOF
