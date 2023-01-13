local gps = require("nvim-gps")
gps.setup({ disable_icons = true, separator = "." })
-- lualine setup
require("lualine").setup {
  sections = {
    lualine_a = { { 'mode', upper = true } },
    lualine_b = { { 'branch', icon = '' }, 'diff' },
    lualine_c = { { gps.get_location, cond = gps.is_available } },
    lualine_x = { 'filename' },
    lualine_y = { 'diagnostics' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}
