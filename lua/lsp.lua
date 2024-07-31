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

local on_attach = function(client, bufnr)
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
  -- Disable lua and yaml autostart
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      autostart = false
    }
  end,
  ["yamlls"] = function()
    lspconfig.yamlls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      autostart = false
    }
  end,
}
