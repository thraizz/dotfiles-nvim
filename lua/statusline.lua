local gps = require("nvim-gps")
gps.setup()
-- lualine setup
require("lualine").setup{
    options = { theme  = 'material-nvim' },
    sections = {
        lualine_a = {{'mode', upper = true}},
        lualine_b = {{'branch', icon = ''}, 'diff'},
        lualine_c = {{'filename', file_status = true, full_path = true}, { gps.get_location, cond = gps.is_available } },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = { require'lsp-status'.status },
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
}
-- bufferline setup
require("bufferline").setup{}
