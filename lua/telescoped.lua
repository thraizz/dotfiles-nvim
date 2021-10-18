local actions = require('telescope.actions')
require("telescope").setup {
    defaults = {
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
  }
}
