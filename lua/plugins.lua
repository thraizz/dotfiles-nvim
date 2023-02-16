local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd 'packadd packer.nvim'
end
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  use {
    'uga-rosa/translate.nvim',
    config = function()
      require('translate').setup({
        default = {
          command = 'deepl_free',
          output = 'replace',
        },
      })
    end
  }
  use 'wbthomason/packer.nvim'
  -- Emmet foo in <p>foo</p> with <C-y>,
  use 'mattn/emmet-vim'
  use {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup {}
    end
  }
  use("tpope/vim-repeat")
  use {
    'tpope/vim-fugitive',
    requires = 'junegunn/gv.vim',
  }
  use 'tpope/vim-commentary'
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use("tpope/vim-sleuth")
  use("tpope/vim-eunuch")
  -- Cursor-dependent comment string for tsx files
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- Jump anywhere easy
  use 'justinmk/vim-sneak'
  -- Note taking with :Note something
  -- use 'xolox/vim-notes'
  -- use 'xolox/vim-misc'
  -- Markdown enhancers
  -- tabular plugin is used to format tables
  use 'godlygeek/tabular'
  -- JSON front matter highlight plugin
  -- use 'elzr/vim-json'
  use 'plasticboy/vim-markdown'
  -- -- Give hints on current indent
  -- use 'Yggdroot/indentLine'
  -- Ultra focus mode for current file with :Goyo
  use 'junegunn/goyo.vim'
  -- Ascii art generator with :FIGlet foo
  use 'fadein/vim-FIGlet'
  -- Better terminal
  use 'vimlab/split-term.vim'
  use {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require('nvim-autopairs.rule')
      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = { 'string' }, -- it will not add a pair on that treesitter node
          javascript = { 'template_string' },
          java = false, -- don't check treesitter on java
        }
      })
      local ts_conds = require('nvim-autopairs.ts-conds')
      npairs.add_rules({
        Rule("%", "%", "lua")
            :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
        Rule("$", "$", "lua")
            :with_pair(ts_conds.is_not_ts_node({ 'function' }))
      })
    end
  }
  use('windwp/nvim-ts-autotag') -- automatically close jsx tags
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'napmn/react-extract.nvim',
    config = function()
      require("react-extract").setup()
    end
  }
  use 'SmiteshP/nvim-gps'
  -- LSP Configuration
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind-nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  -- Completion via nvim-cmp (snippets included)
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'petertriho/cmp-git',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-copilot',
      'thraizz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    }
  }
  use 'hoob3rt/lualine.nvim'
  -- use {
  --   'akinsho/bufferline.nvim',
  --   config = function()
  --     require('bufferline').setup {
  --       options = {
  --         diagnostics = 'nvim_lsp',
  --         mode = 'tabs',
  --       }
  --     }
  --   end
  -- }
  -- Pretty git experience
  use 'thraizz/git-blame.nvim'
  -- Icons for statusline and telescope
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {}
    end
  }
  -- Searcher+Picker
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim',
        'natecraddock/telescope-zf-native.nvim'
      }
    }
  }
  use {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require"telescope".load_extension("frecency")
  end,
  requires = {"kkharji/sqlite.lua"}
}
  -- Debugger
  use 'mfussenegger/nvim-dap'
  -- Python Debugger
  -- requires debugpy!
  use {
    'mfussenegger/nvim-dap-python',
    config = function()
      require('dap-python').setup('/usr/bin/python')
    end
  }
  -- JS/TS specific LSP configuration
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/typescript.nvim'
  -- null-ls
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Vue specific configuration
  -- use 'posva/vim-vue'
  use 'mxw/vim-jsx'
  use 'pangloss/vim-javascript'
  use 'lepture/vim-jinja'
  use 'prettier/vim-prettier'
  use({
    "andythigpen/nvim-coverage",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("coverage").setup({
        commands = true, -- create commands
        summary = {
          -- customize the summary pop-up
          min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
        },
        lang = {
          -- customize language specific settings
        },
      })
    end,
  })
  -- Automatic window resizer
  use {
    'beauwilliams/focus.nvim',
    config = function()
      require('focus').setup({
        autoresize = false,
        hybridnumber = false,
        signcolumn = false,
        winhighlight = false,
        excluded_filetypes = { 'telescope', 'NvimTree' }
      })
    end
  }
  -- Colorschemes / themes
  use 'marko-cerovac/material.nvim'
  use 'https://gitlab.com/yorickpeterse/nvim-window.git'
  use 'sainnhe/sonokai'
  use 'tiagovla/tokyodark.nvim'
  use 'projekt0n/github-nvim-theme'
  -- use 'joshdick/onedark.vim'
  -- use { 'catppuccin/nvim', as='catppuccin' }
  -- use { 'sonph/onehalf', rtp='vim/' }
  -- use 'liuchengxu/space-vim-dark'
  -- use 'ahmedabdulrahman/aylin.vim'
  -- use 'rebelot/kanagawa.nvim'
  use 'NLKNguyen/papercolor-theme'
  use 'liuchengxu/space-vim-dark'
  use 'sainnhe/edge'
  use 'B4mbus/oxocarbon-lua.nvim'
  use 'Th3Whit3Wolf/one-nvim'
  -- use 'RRethy/nvim-base16'

  -- Tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup()
    end,
  }
  use {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup({
        picker = {
          cmd = "nnn -nAad -P p -T t",
          style = { border = "rounded" },
        },
        replace_netrw = "picker",
      })
    end
  }

  use {
    "MunifTanjim/nui.nvim"
  }

end)
