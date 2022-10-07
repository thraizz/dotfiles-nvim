local lspconfig = require('lspconfig')
local ts_utils = require("nvim-lsp-ts-utils")
local null_ls = require("null-ls")
local lsp_status = require('lsp-status')
local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_installer.setup {}
lsp_status.register_progress()

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  signs = true,
  update_in_insert = false, -- delay update
  severity_sort = true
})

local signs = { Error = '✘', Warning = '', Hint = '', Information = '' }
for type, icon in pairs(signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

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

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    autostart = true
  }
end

-- lspconfig.pyright.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   autostart = false
-- }

-- lspconfig.stylelint_lsp.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   autostart = false
-- }

lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'packer' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
})

lspconfig.tsserver.setup {
  -- init_options = require("nvim-lsp-ts-utils").init_options,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    ts_utils.setup {
      -- import all
      import_all_timeout = 5000, -- ms
      import_all_priorities = {
        buffers = 4, -- loaded buffer names
        buffer_content = 3, -- loaded buffer content
        local_files = 2, -- git files or files with relative path markers
        same_file = 1, -- add to existing import statement
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- eslint
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint_d",
      eslint_enable_diagnostics = false,
    }

    ts_utils.setup_client(client)
    on_attach(client, bufnr)
  end,
}

-- local null_ls_sources = {
--   -- null_ls.builtins.diagnostics.eslint_d.with({
--   --   cwd = function(params)
--   --     return require("lspconfig.util").root_pattern("tsconfig.json")(params.bufname)
--   --   end,
--   -- }),
--   -- null_ls.builtins.code_actions.eslint_d.with({
--   --   cwd = function(params)
--   --     return require("lspconfig.util").root_pattern("tsconfig.json")(params.bufname)
--   --   end,
--   -- }),
--   -- null_ls.builtins.formatting.eslint_d.with({
--   --   cwd = function(params)
--   --     return require("lspconfig.util").root_pattern("tsconfig.json")(params.bufname)
--   --   end,
--   -- }),
--   null_ls.builtins.formatting.prettier.with({
--     filetypes = { "scss", "json", "yaml", "markdown", "css" },
--   }),
-- }
-- null_ls.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   autostart = true,
--   debug = true,
--   sources = null_ls_sources,
-- })
require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  server = { -- pass options to lspconfig's setup method
    on_attach = on_attach,
  },
})
