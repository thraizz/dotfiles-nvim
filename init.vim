lua require('plugins')
lua require('init')
so $HOME/.config/nvim/keymaps.vim

autocmd FileType typescriptreact setlocal commentstring={/*\ %s\ */}

command CreateScss norm :vs expand("%:p:r")<cr>
autocmd BufWritePost * GitGutter

if exists("g:neovide")
  " Extend shell to know homebrew path
  let $PATH = $PATH . ':/opt/homebrew/bin'
  
  " Start in user home directory
  cd ~
endif
