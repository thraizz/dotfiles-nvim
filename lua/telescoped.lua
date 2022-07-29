local actions = require('telescope.actions')
require("telescope").setup {
  defaults = {
    theme = { "ivy" },
    path_display = { "truncate" },
    layout_config = {
      bottom_pane = { width = 0.9 },
      vertical = { width = 0.9 },
      center = { width = 0.9 },
      horizontal = { width = 0.9 }
    },
    file_ignore_patterns = { "venv/", "package-lock.json", ".*.snap", ".git/" },
    color_devicons = true,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-y>"] = actions.send_to_loclist,
        ["<C-t>"] = actions.select_tab,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
    },
  },
  pickers = {
    lsp_workspace_symbols = {
      theme = "cursor",
    },
    lsp_references        = {
      theme = "cursor",
    },
  },
  extensions = {
    ["zf-native"] = {
      -- options for sorting file-like items
      file = {
        -- override default telescope file sorter
        enable = true,
        -- highlight matching text in results
        highlight_results = true,
        -- enable zf filename match priority
        match_filename = true,
      },
      -- options for sorting all other items
      generic = {
        -- override default telescope generic item sorter
        enable = true,
        -- highlight matching text in results
        highlight_results = true,
        -- disable zf filename match priority
        match_filename = true,
      },
    },
    file_browser = {
      theme = "dropdown",
      respect_gitignore = true
    }
  }
}

require("telescope").load_extension("zf-native")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("live_grep_args")
