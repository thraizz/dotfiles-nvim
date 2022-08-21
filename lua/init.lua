require "plugins"
require "theme"
require "statusline"
require "telescoped"
require "lsp"
require "completion"
require "treesitter"
require "settings"
require "apiKeys"


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

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

local function filterReactDTS(value)
  return string.match(value.filename, 'react/index.d.ts') == nil
end

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function on_list(options)
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst')
end

vim.keymap.set('n', '<leader>ld',
  function() vim.cmd('vsplit') vim.lsp.buf.definition { on_list = on_list } vim.cmd('norm zz') end)
