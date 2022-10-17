require("luasnip.loaders.from_vscode").load()


require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require 'luasnip'
local cmp = require 'cmp'
local lspkind = require('lspkind')
local jump_forwards = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local jump_backwards = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

local next_snippet_or_confirm = function(fallback)
  if cmp.get_selected_entry() then
    cmp.confirm({ select = false })
  elseif luasnip.jumpable() then
    luasnip.jumpable(1)
    print("Jumpable, not expanding")
    luasnip.jump(1)
  elseif luasnip.in_snippet() then
    print("In snippet, not expanding")
    fallback()
  elseif luasnip.expandable() then
    print("Not in snippet, expanding")
    luasnip.expand()
  elseif cmp.visible() then
    cmp.confirm({ select = false })
  else
    fallback()
  end
end

local completion_or_enter = function(fallback)
  if cmp.get_selected_entry() then
    cmp.confirm({ select = false })
  else
    fallback()
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.confirm(),
    ['<C-e>'] = cmp.mapping.close(),
    ["<Down>"] = cmp.mapping(jump_forwards, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(next_snippet_or_confirm, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(jump_backwards, { "i", "s" }),
    ["<Up>"] = cmp.mapping(jump_backwards, { "i", "s" }),
    ["<CR>"] = cmp.mapping(completion_or_enter, { "i", "s" }),
  },
  sources = {
    -- { name = 'cmdline' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'buffer' },
    { name = 'omni' },
    { name = 'luasnip' },
    { name = 'friendly-snippets' },
  },
  formatting = {
    format = lspkind.cmp_format(),
  },
}
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = "git" },
  },
    {
      { name = 'buffer' },
    }
  )
})

require("cmp_git").setup()
