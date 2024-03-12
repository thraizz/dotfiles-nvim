--treesitter setup
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",      -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,               -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
  fold = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  autotag = {
    enable = true,
  },
  --textobjects = {
  --  select = {
  --    enable = true,

  --    -- Automatically jump forward to textobj, similar to targets.vim
  --    lookahead = true,

  --    -- keymaps = {
  --    --   -- You can use the capture groups defined in textobjects.scm
  --    --   ["af"] = "@function.outer",
  --    --   ["if"] = "@function.inner",
  --    --   -- You can optionally set descriptions to the mappings (used in the desc parameter of
  --    --   -- nvim_buf_set_keymap) which plugins like which-key display
  --    --   ["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },
  --    --   ["ac"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },
  --    -- },
  --    -- You can choose the select mode (default is charwise 'v')
  --    --
  --    -- Can also be a function which gets passed a table with the keys
  --    -- * query_string: eg '@function.inner'
  --    -- * method: eg 'v' or 'o'
  --    -- and should return the mode ('v', 'V', or '<c-v>') or a table
  --    -- mapping query_strings to modes.
  --    selection_modes = {
  --      ['@parameter.outer'] = 'v', -- charwise
  --      ['@function.outer'] = 'V',  -- linewise
  --      ['@lass.outer'] = '<c-v>',  -- blockwise
  --    },
  --    -- If you set this to `true` (default is `false`) then any textobject is
  --    -- extended to include preceding or succeeding whitespace. Succeeding
  --    -- whitespace has priority in order to act similarly to eg the built-in
  --    -- `ap`.
  --    --
  --    -- Can also be a function which gets passed a table with the keys
  --    -- * query_string: eg '@function.inner'
  --    -- * selection_mode: eg 'v'
  --    -- and should return true of false
  --    include_surrounding_whitespace = true,
  --  },
  --},
}
