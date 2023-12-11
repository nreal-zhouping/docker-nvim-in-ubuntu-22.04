-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Install plugins
local plugins = {  -- Add you plugins here:
  -- 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  'kyazdani42/nvim-tree.lua',

  -- Indent line
  -- 'lukas-reineke/indent-blankline.nvim',
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require('ibl').setup()
    end

  },

  -- Autopair
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  -- Icons
  'nvim-tree/nvim-web-devicons',

  -- Tag viewer
  'preservim/tagbar',

  -- Treesitter interface
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  -- Color schemes
  'navarasu/onedark.nvim',
  'tanvirtin/monokai.nvim',
  { 'rose-pine/neovim', as = 'rose-pine' },

  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  -- Statusline
  {
    'famiu/feline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- git labels
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  },

  'f-person/git-blame.nvim',

  -- Dashboard (start screen)
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},


  {"nvim-telescope/telescope-ui-select.nvim"},

  {"nvim-telescope/telescope-live-grep-args.nvim"},

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim', 'kdheepak/lazygit.nvim'},
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("lazygit")
    end
  },
  -- Lua
  {
    "ahmedkhalf/project.nvim"
  },
  {"LinArcX/telescope-env.nvim"},

  -- Lua
  {
    "folke/which-key.nvim"
  },
  {
  'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
  'williamboman/nvim-lsp-installer',
  },
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- use {
  --   'anuvyklack/pretty-fold.nvim',
  --   dependencies = 'anuvyklack/nvim-keymap-amend', -- only for preview
  -- }

  -- use {
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- }

  {
    "jose-elias-alvarez/null-ls.nvim"
  },

  {'ojroques/nvim-osc52'},

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  },

  { 'mrjones2014/legendary.nvim' },


  {'windwp/nvim-spectre'},

  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  -- {
  --   'TimUntersberger/neogit',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'sindrets/diffview.nvim'
  --   },
  -- },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },

  -- use {
    -- 'github/copilot.vim'
  -- }
  -- use {
    -- "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    -- event = "InsertEnter",
    -- config = function()
      -- require("copilot").setup({})
    -- end,
  -- }
-- Packer
  -- {
  --   "jackMort/ChatGPT.nvim",
  --     config = function()
  --       require("chatgpt").setup({
  --       -- optional configuration
  --       })
  --     end,
  --     dependencies = {
  --       "MunifTanjim/nui.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "nvim-telescope/telescope.nvim"
  --     }
  -- },

  {'tpope/vim-fugitive'},
  {'junegunn/gv.vim'},
  {'kdheepak/lazygit.nvim'},

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  }

  --{
  --  "jcdickinson/codeium.nvim",
  --  dependencies = {
  --      "nvim-lua/plenary.nvim",
  --      "hrsh7th/nvim-cmp",
  --  },
  --  config = function()
  --      require("codeium").setup({
  --      })
  --  end
  --},
}

local opts = {}

require("lazy").setup(plugins, opts)
