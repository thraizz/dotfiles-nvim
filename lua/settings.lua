local cmd = vim.cmd
local g = vim.g

g.indent_blankline_filetype_exclude = { "help", "terminal" }
g.indent_blankline_buftype_exclude = { "terminal" }
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
g.indentLine_conceallevel = 1
g.indentLine_char = '·'
g.indentLine_enabled = 1
g.indentLine_fileTypeExclude = { "notes", "json" }
g.vim_json_syntax_conceal = 0
g.mapleader = ','


-- Markdown syntax options by https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/
-- disable header folding
g.vim_markdown_folding_disabled = 1

-- do not use conceal feature, the implementation is not so good
g.vim_markdown_conceal = 0

-- disable math tex conceal feature
g.tex_conceal = ""
g.vim_markdown_math = 1

-- support front matter of various format
g.vim_markdown_frontmatter = 1 -- for YAML format
g.vim_markdown_toml_frontmatter = 1 -- for TOML format
g.vim_markdown_json_frontmatter = 1 -- for JSON format


g.notes_directories = { '~/Documents/Notes' }

cmd('syntax enable')
cmd('syntax on')
cmd('set title')
cmd('set titleold=')
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
cmd('set foldlevel=10')
cmd('set foldnestmax=10')
cmd('set foldminlines=5')
cmd('set foldmethod=manual')
cmd('set foldexpr=nvim_treesitter#foldexpr()')
cmd('set completeopt=menu,menuone,noselect')
cmd('set shortmess+=c')
cmd('set switchbuf=vsplit')
cmd('set noshowmode')
cmd('set listchars+=eol:↴')
cmd('set nowrap')
cmd('set updatetime=100')
cmd('set winminwidth=10')

vim.api.nvim_set_keymap('n', ',', '', {})
