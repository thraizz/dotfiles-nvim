local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions
require("telescope").setup {
  defaults = {
    theme = { "ivy" },
    path_display = { shorten = { len = 3, exclude = { 1, -1 } } },
    layout_config = {
      bottom_pane = { width = 0.9 },
      vertical = { width = 0.9 },
      center = { width = 0.9 },
      horizontal = { width = 0.9 }
    },
    file_ignore_patterns = { "venv/", "node_modules", "package-lock.json", ".*.snap", ".git/" },
    color_devicons = true,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-y>"] = actions.send_to_loclist,
        ["<C-t>"] = actions.select_tab,
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
    buffers               = {
      show_all_buffers = true,
      sort_lastused = true,
      ignore_current_buffer = true,
      theme = "ivy",
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    },
    oldfiles              = {
      cwd_only = true,
      include_current_session = true,
    }
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
      respect_gitignore = true,
      mappings = {
        i = {
          ["<Leader>n"] = fb_actions.create,
          ["<Leader>d"] = fb_actions.remove,
          ["<Leader>r"] = fb_actions.rename,
          ["<Leader>m"] = fb_actions.move,
        }
      }
    }
  }
}

require("telescope").load_extension("zf-native")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("live_grep_args")
