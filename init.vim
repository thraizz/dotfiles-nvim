lua require('plugins')
lua require('init')
so $HOME/.config/nvim/keymaps.vim

autocmd FileType typescriptreact setlocal commentstring={/*\ %s\ */}

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

command CreateScss vs expand("%:p:r").scss
