local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
lsp_status.register_progress()

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(require('lsp_extensions.workspace.diagnostic').handler, {
        underline = false,
        signs = true,
        update_in_insert = false, -- delay update
        severity_sort = true
    })
local servers = { "cssls", "vuels", "phpactor", "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = lsp_status.capabilities
    }
end

local null_ls = require("null-ls")
null_ls.setup({
  on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
          vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2000)
          augroup END
          ]])
      end
  end,
  debug = true,
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.eslint_d
  },
})

