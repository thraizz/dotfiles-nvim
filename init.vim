call plug#begin('~/.vim/bundle')
Plug 'mattn/emmet-vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'fadein/vim-FIGlet'
Plug 'itchyny/lightline.vim'
Plug 'vimlab/split-term.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'thraizz/git-blame.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-startify'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'gruvbox-community/gruvbox'

call plug#end()

let mapleader=","
" Set vim configuration path
let $VIM_CONFIG="$HOME/.config/nvim/"
" Load plugin configuration
so $VIM_CONFIG/plugins.vim
" Load keymaps
so $VIM_CONFIG/keymaps.vim
" Load autocommands
so $VIM_CONFIG/autocommands.vim


if (strftime("%H") >= 6 && strftime("%H") < 17 && !exists('$DARK')) 
  set background=light
else
  set background=dark
endif
colorscheme tokyonight
syntax enable

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
set hlsearch              " highlight matches
"set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is lower case
"set foldenable
"set foldlevelstart=10     " default folding level when buffer is opened
"set foldnestmax=10        " maximum nested fold
"set foldmethod=manual     " fold manual
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
set switchbuf=vsplit
set noshowmode

let g:completion_enable_auto_popup = 0
" Let our leader be ,
let mapleader=","
filetype plugin on
