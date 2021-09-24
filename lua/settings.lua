local cmd = vim.cmd
local g = vim.g

g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_buftype_exclude = {"terminal"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
g.indentLine_conceallevel=1
g.indentLine_char='·'
g.indentLine_enabled=1

--g.notes_directories = ['~/Documents/Notes']

g.material_style = "darker"
cmd('syntax enable')
cmd('syntax on')

cmd('set background=dark')
cmd('set shell=/bin/bash')
cmd('set tabstop=4')
cmd('set softtabstop=2')
cmd('set shiftwidth=2')
cmd('set expandtab')
cmd('set autoindent')
cmd('set copyindent')
cmd('set clipboard+=unnamedplus')
cmd('set mouse=nv')
cmd('set splitright')
cmd('set signcolumn=yes')
cmd('set relativenumber')
cmd('set laststatus=2')
cmd('set cursorline')
cmd('set cmdheight=2')
cmd('set hidden')
cmd('set number')
cmd('set showcmd')
cmd('set wildmenu')
cmd('set showmatch')
cmd('set incsearch')
cmd('set smartcase')
cmd('set foldenable')
cmd('set foldlevelstart=10')
cmd('set foldnestmax=10')
cmd('set foldmethod=expr')
cmd('set foldexpr=nvim_treesitter#foldexpr()')
cmd('set completeopt=menuone,noinsert,noselect')
cmd('set shortmess+=c')
cmd('set switchbuf=vsplit')
cmd('set noshowmode')
cmd('set listchars+=eol:↴')
