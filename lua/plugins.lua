vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'mattn/emmet-vim'
  use 'xolox/vim-notes'
  use 'xolox/vim-misc'
  use 'Yggdroot/indentLine'
  use 'junegunn/goyo.vim'
  use 'fadein/vim-FIGlet'

  use 'vimlab/split-term.vim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'rafamadriz/friendly-snippets'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use 'hoob3rt/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  use 'thraizz/git-blame.nvim'
  use 'tpope/vim-fugitive'

  use 'kyazdani42/nvim-web-devicons'

  use 'nvim-telescope/telescope.nvim'

  use 'posva/vim-vue'
  use 'mxw/vim-jsx'
  use 'pangloss/vim-javascript'
  -- Window resizer
  use 'beauwilliams/focus.nvim'
  -- Colorschemes
  use 'RRethy/nvim-base16'
  use 'folke/tokyonight.nvim'
  use 'gruvbox-community/gruvbox'
  use 'marko-cerovac/material.nvim'
end)
