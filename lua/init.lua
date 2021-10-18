require "plugins"
require "theme"
require "statusline"
require "telescoped"
require "lsp"
require "completion"
require "treesitter"
require "settings"

require("focus").setup()

vim.api.nvim_set_keymap('n', ',', '', {})
vim.g.mapleader = ','
