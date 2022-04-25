local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- Emmet foo in <p>foo</p> with <C-y>,
  use 'mattn/emmet-vim'
  use 'tpope/vim-surround'
  use 'chentau/marks.nvim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  -- Jump anywhere easy
  use 'justinmk/vim-sneak'
  -- Note taking with :Note something
  use 'xolox/vim-notes'
  use 'xolox/vim-misc'
  -- Markdown enhancers
  -- tabular plugin is used to format tables
  use 'godlygeek/tabular'
  -- JSON front matter highlight plugin
  use 'elzr/vim-json'
  use 'plasticboy/vim-markdown'
  -- Give hints on current indent
  use 'Yggdroot/indentLine'
  -- Ultra focus mode for current file with :Goyo
  use 'junegunn/goyo.vim'
  -- Ascii art generator with :FIGlet foo
  use 'fadein/vim-FIGlet'
  -- Better terminal
  use 'vimlab/split-term.vim'
  -- Treesitter (Syntax detection engine) support
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-angular'
  use 'SmiteshP/nvim-gps'
  -- LSP Configuration
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind-nvim'
  -- Completion via nvim-cmp (snippets included)
  use 'hrsh7th/nvim-cmp'
  use 'petertriho/cmp-git'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'rafamadriz/friendly-snippets'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  -- Pretty statusline (bottom) and buffers as tabs (top)
  use 'hoob3rt/lualine.nvim'
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require("bufferline").setup {
        options = {
          diagnostics = "nvim_lsp",
          mode = "tabs",
        }
      }
    end
  }
  -- Pretty git experience
  use 'thraizz/git-blame.nvim'
  use 'tpope/vim-fugitive'
  -- Icons for statusline and telescope
  use 'kyazdani42/nvim-web-devicons'
  -- Searcher+Picker
  use {
    'nvim-telescope/telescope.nvim', 
    requires = {
      {'nvim-telescope/telescope-file-browser.nvim', 'nvim-telescope/telescope-live-grep-raw.nvim' }
    }
  }
  -- Debugger
  use 'mfussenegger/nvim-dap'
  -- Python Debugger
  -- requires debugpy!
  use 'mfussenegger/nvim-dap-python'
  -- JS/TS specific LSP configuration
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Vue specific configuration
  use 'posva/vim-vue'
  use 'mxw/vim-jsx'
  use 'pangloss/vim-javascript'
  -- use 'lepture/vim-jinja'
  -- Automatic window resizer
  use 'beauwilliams/focus.nvim'
  -- Colorschemes
  use 'RRethy/nvim-base16'
  use 'folke/tokyonight.nvim'
  use 'gruvbox-community/gruvbox'
  use 'marko-cerovac/material.nvim'
  use 'EdenEast/nightfox.nvim'
end)
