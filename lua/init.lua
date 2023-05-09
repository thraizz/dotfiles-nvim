local ts_utils = require 'nvim-treesitter.ts_utils'
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
  local node = ts_utils.get_node_at_cursor();
  if not node then
    return ""
  end
  local result = {};
  while node do
    if node:type() == 'pair' then
      local key_node = node:named_child(0):named_child(0)
      table.insert(result, 1, vim.treesitter.query.get_node_text(key_node, 0))
    end
    node = node:parent()
  end
  vim.fn.setreg('"', table.concat(result, "."))
end

vim.keymap.set('n', '<leader>cp', copyJSONPath)


local log = require('vim.lsp.log')
local util = require('vim.lsp.util')
local vim = vim
local api = vim.api
local handlers = vim.lsp.handlers
local function filterReactDTS(value)
  return string.match(value.targetUri, 'react/ts5.0/index.d.ts') == nil
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

local function bufwinid(bufnr)
  for _, win in ipairs(api.nvim_list_wins()) do
    if api.nvim_win_get_buf(win) == bufnr then
      return win
    end
  end
end

local function jump_to_location(location, offset_encoding, reuse_win)
  -- location may be Location or LocationLink
  local uri = location.uri or location.targetUri
  if uri == nil then
    return
  end
  if offset_encoding == nil then
    vim.notify_once(
      'jump_to_location must be called with valid offset encoding',
      vim.log.levels.WARN
    )
  end
  local bufnr = vim.uri_to_bufnr(uri)
  -- Save position in jumplist
  vim.cmd("normal! m'")

  -- Push a new item into tagstack
  local from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 }
  local items = { { tagname = vim.fn.expand('<cword>'), from = from } }
  vim.fn.settagstack(vim.fn.win_getid(), { items = items }, 't')

  --- Jump to new location (adjusting for UTF-16 encoding of characters)
  local win = reuse_win and bufwinid(bufnr)
  if win then
    api.nvim_set_current_win(win)
  else
    api.nvim_buf_set_option(bufnr, 'buflisted', true)
    vim.cmd("vs")
    api.nvim_set_current_buf(bufnr)
    vim.cmd("norm zz")
  end
  local range = location.range or location.targetSelectionRange
  local row = range.start.line
  local col = vim.lsp.util._get_line_byte_from_position(bufnr, range.start, offset_encoding)
  api.nvim_win_set_cursor(0, { row + 1, col })
  -- Open folds under the cursor
  vim.cmd('normal! zv')
  return true
end

local function location_handler(_, result, ctx, config)
  if result == nil or vim.tbl_isempty(result) then
    local _ = log.info() and log.info(ctx.method, 'No location found')
    return nil
  end
  local client = vim.lsp.get_client_by_id(ctx.client_id)

  config = config or {}

  -- textDocument/definition can return Location or Location[]
  -- https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_definition

  if vim.tbl_islist(result) then
    local title = 'LSP locations'
    local items = util.locations_to_items(result, client.offset_encoding)
    result = filter(result, filterReactDTS)
    if #result == 1 then
      jump_to_location(result[1], client.offset_encoding, config.reuse_win)
      return
    end
    vim.fn.setqflist({}, ' ', { title = title, items = items })
    api.nvim_command('botright copen')
  else
    jump_to_location(result, client.offset_encoding, client.reuse_win)
  end
end

handlers['textDocument/definition'] = location_handler

vim.keymap.set(
  'n', '<leader>ld',
  function()
    vim.lsp.buf.definition { reuse_win = true }
  end
)

function _G.switchTheme()
  require("material.functions").find_style()
end

function _G.createTest()
  vim.cmd("vs %:p:r.test.tsx")
end

vim.keymap.set(
  'n', '<leader>w',
  function()
    require('nvim-window').pick()
  end
)

local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local input = Input({
  position = "50%",
  size = {
    width = 70,
  },
  border = {
    style = "single",
    text = {
      top = "[Branch Name?]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}, {
  prompt = "> ",
  on_close = function()
    print("Input Closed!")
  end,
  on_submit = function(value)
    vim.cmd("Git checkout -b ", value)
  end,
})
input:map("n", "<Esc>", function()
  input:unmount()
end, { noremap = true })

local openBranchPicker = function()
  input:mount()
end

-- mount/open the component
vim.keymap.set('n', '<leader>gn', openBranchPicker)

-- unmount component when cursor leaves buffer
input:on(event.BufLeave, function()
  input:unmount()
end)
