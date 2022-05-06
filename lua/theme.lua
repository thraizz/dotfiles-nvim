local g = vim.g

g.indent_blankline_filetype_exclude = { "help", "terminal" }
g.indent_blankline_buftype_exclude = { "terminal" }
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
g.indentLine_conceallevel = 1
g.indentLine_char = '·'
g.indentLine_enabled = 1
g.material_style = "darker"

require('material').setup({

  contrast = {
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windows
    line_numbers = true, -- Enable contrast background for line numbers
    sign_column = false, -- Enable contrast background for the sign column
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    popup_menu = true, -- Enable lighter background for the popup menu
  },
  italics = {
    comments = true, -- Enable italic comments
    keywords = false, -- Enable italic keywords
    functions = false, -- Enable italic functions
    strings = false, -- Enable italic strings
    variables = false -- Enable italic variables
  },

  contrast_filetypes = { -- Specify which windows get the contrasted (darker) background
    "terminal", -- Darker terminal background
    "packer", -- Darker packer background
    "qf", -- Darker qf list background
    "telescope" -- Darker qf list background
  },

  high_visibility = {
    lighter = true, -- Enable higher contrast text for lighter style
    darker = true -- Enable higher contrast text for darker style
  },

  disable = {
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false -- Hide the end-of-buffer lines
  },

  custom_highlights = {} -- Overwrite highlights with your own
})
vim.cmd 'colorscheme material'
