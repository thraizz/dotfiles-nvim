call plug#begin('~/.vim/bundle')
  Plug 'mattn/emmet-vim'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-misc'
  Plug 'Yggdroot/indentLine'
  Plug 'junegunn/goyo.vim'
  Plug 'fadein/vim-FIGlet'

  Plug 'vimlab/split-term.vim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'neovim/nvim-lspconfig'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/lsp_extensions.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'

  Plug 'hoob3rt/lualine.nvim'
  Plug 'akinsho/bufferline.nvim'

  Plug 'thraizz/git-blame.nvim'

  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'nvim-telescope/telescope.nvim'

  Plug 'posva/vim-vue'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  " Window resizer
  " Plug 'sarumont/golden-ratio'
  Plug 'beauwilliams/focus.nvim'
  " Colorschemes
  Plug 'RRethy/nvim-base16'
  Plug 'folke/tokyonight.nvim'
  Plug 'gruvbox-community/gruvbox'
call plug#end()

" Let our leader be ,
let mapleader=","
filetype plugin on

" Set vim configuration path
let $VIM_CONFIG="$HOME/.config/nvim/"
" Load keymaps
so $VIM_CONFIG/keymaps.vim
" Load plugin configuration
lua require('plugins')

set background=dark
colorscheme base16-gruvbox-dark-hard
syntax enable

" Various preferences
set termguicolors
set shell=/bin/bash
set tabstop=4             " number of visual spaces per TAB
set softtabstop=2         " number of spaces in tab when editing
set shiftwidth=2          " number of spaces to use for autoindent
set expandtab             " tabs are space
set autoindent
set copyindent            " copy indent from the previous line
set clipboard+=unnamedplus
set mouse=nv
set splitright
set relativenumber
set laststatus=2
set cursorline
set cmdheight=2
set hidden
set number                " show line number
set showcmd               " show command in bottom bar
set wildmenu              " visual autocomplete for command menu
set showmatch             " highlight matching brace
set incsearch             " search as characters are entered
set smartcase             " ignore case if search pattern is lower case
set foldenable
set foldlevelstart=10     " default folding level when buffer is opened
set foldnestmax=10        " maximum nested fold
set foldmethod=expr     " fold manual
set foldexpr=nvim_treesitter#foldexpr()
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
set switchbuf=vsplit
set noshowmode
set listchars+=eol:↴
let g:notes_directories = ['~/Documents/Notes']
