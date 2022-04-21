local actions = require('telescope.actions')
local themes = require('telescope.themes')
require("telescope").setup {
  defaults = {
    theme = "dropdown",
    path_display = {"smart"},
    layout_config = { 
      bottom_pane = { width = 0.5 },
      vertical = { width = 0.5 },
      center = { width = 0.9 },
      horizontal = { width = 0.5 }
    },
    file_ignore_patterns = {"venv/"},
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
    find_files = {
      theme = "dropdown",
    },
    old_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    lsp_workspace_symbols = {
      theme = "cursor",
    },
    lsp_references  = {
      theme = "cursor",
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      respect_gitignore = true
    }
  }
}

require("telescope").load_extension "file_browser"
