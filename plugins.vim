""        _             _            
""  _ __ | |_   _  __ _(_)_ __  ___  
"" | '_ \| | | | |/ _` | | '_ \/ __| 
"" | |_) | | |_| | (_| | | | | \__ \ 
"" | .__/|_|\__,_|\__, |_|_| |_|___/ 
"" |_|            |___/              
""
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
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ]
      \   ]
      \ },
      \ }


lua << EOF
local nvim_lsp = require('lspconfig')
local actions = require('telescope.actions')
require("telescope").setup {
    defaults = {
        prompt_prefix = ">",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.9,
            preview_cutoff = 120,
            prompt_position = "bottom"
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {"venv/"},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        color_devicons = true,
        set_env = {
           ["TERM"] = "xterm-256colors",
           ["COLORTERM"] = "truecolor"
        },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-y>"] = actions.send_to_loclist,
        ["<C-t>"] = actions.send_to_qflist,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
    },
  }
}
-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver", "vuels", "phpactor" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(require('lsp_extensions.workspace.diagnostic').handler, {
        underline = false,
        signs = true,
        update_in_insert = false -- delay update
    })
EOF
