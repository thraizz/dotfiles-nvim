require "plugins"
require "theme"
require "statusline"
require "telescoped"
require "lsp"
require "completion"
require "treesitter"
require "settings"
require "apiKeys"


vim.api.nvim_set_keymap('n', ',', '', {})
vim.g.mapleader = ','


local copyJSONPath = function()
  local ts_utils = require 'nvim-treesitter.ts_utils'
  local result = {};
  local node = ts_utils.get_node_at_cursor()
  while node do
    if tostring(node) == '<node pair>' then
      local key_node = node:named_child(0):named_child(0)
      table.insert(result, 1, ts_utils.get_node_text(key_node)[1])
    end
    node = node:parent()
  end
  vim.fn.setreg('"', vim.fn.join(result, '.'))
end

vim.keymap.set('n', '<leader>cp', copyJSONPath)
