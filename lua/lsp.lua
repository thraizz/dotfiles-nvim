require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
lsp_status.register_progress()

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  signs = true,
  update_in_insert = false, -- delay update
  severity_sort = true
})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client) return client.name ~= "tsserver" end,
    bufnr = bufnr,
  })
end

local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting_group,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end

local capabilities = cmp_nvim_lsp.default_capabilities()
require("typescript").setup({
  disable_commands = false,   -- prevent the plugin from creating Vim commands
  debug = false,              -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true,          -- fall back to standard LSP definition on failure
  },
  server = {                  -- pass options to lspconfig's setup method
    on_attach = ...,
  },
})
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.completion.spell,
    require("typescript.extensions.null-ls.code-actions"),
  },
})

require("mason-lspconfig").setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      autostart = true
    }
  end,
  ["tsserver"] = function()
    lspconfig.tsserver.setup {
      init_options = require("nvim-lsp-ts-utils").init_options,
      capabilities = capabilities,
      on_attach = on_attach,
      autostart = true,
    }
  end,
}
