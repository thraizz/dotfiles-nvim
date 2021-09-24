require "plugins"
require "statusline"
require "telescoped"
require "lsp"
require "completion"
require "treesitter"
require "settings"

require("material").setup()
require("focus").setup()

vim.api.nvim_set_keymap('n', ',', '', {})
vim.g.mapleader = ','
