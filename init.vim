lua require('plugins')
lua require('init')
so $HOME/.config/nvim/keymaps.vim

autocmd FileType typescriptreact setlocal commentstring={/*\ %s\ */}

" autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.test.tsx EslintFixAll
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.test.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.svelte lua vim.buf.lsp.format()

command CreateScss norm :vs expand("%:p:r")<cr>
autocmd! gitgutter CursorHold,CursorHoldI
autocmd BufWritePost * GitGutter
