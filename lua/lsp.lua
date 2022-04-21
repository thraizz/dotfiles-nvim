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

-- local null_ls = require("null-ls")
-- null_ls.setup({
--   debug = true,
--   sources = {
--     null_ls.builtins.diagnostics.eslint_d, -- eslint or eslint_d
--     null_ls.builtins.code_actions.eslint_d, -- eslint or eslint_d
--     null_ls.builtins.formatting.eslint -- prettier, eslint, eslint_d, or prettierd
--   },
-- })


nvim_lsp.tsserver.setup {
  capabilities = lsp_status.capabilities,
  on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
	    ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

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
            eslint_enable_diagnostics = true,
            eslint_opts = {},

            -- formatting
            enable_formatting = true,
            formatter = "eslint_d",
            formatter_opts = {},

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        }

        ts_utils.setup_client(client)
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
}

