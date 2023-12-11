-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- Icons
  use 'nvim-tree/nvim-web-devicons'

  -- Tag viewer
  use 'preservim/tagbar'

  -- Treesitter interface
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Color schemes
  use 'navarasu/onedark.nvim'
  use 'tanvirtin/monokai.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Statusline
  use {
    'famiu/feline.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  use 'f-person/git-blame.nvim'

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}


  use("nvim-telescope/telescope-ui-select.nvim")

  use("nvim-telescope/telescope-live-grep-args.nvim")

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim'},
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  -- Lua
  use {
    "ahmedkhalf/project.nvim"
  }
  use("LinArcX/telescope-env.nvim")

  -- Lua
  use {
    "folke/which-key.nvim"
  }
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- use {
  --   'anuvyklack/pretty-fold.nvim',
  --   requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
  -- }

  -- use {
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- }

  use {
    "jose-elias-alvarez/null-ls.nvim"
  }

  use {'ojroques/nvim-osc52'}

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end,
    lazy=true
  }

  use({ 'mrjones2014/legendary.nvim' })


  use {'windwp/nvim-spectre'}

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
  }
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
  -- use({
  --   "jackMort/ChatGPT.nvim",
  --     config = function()
  --       require("chatgpt").setup({
  --       -- optional configuration
  --       })
  --     end,
  --     requires = {
  --       "MunifTanjim/nui.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "nvim-telescope/telescope.nvim"
  --     }
  -- })

  use( {'tpope/vim-fugitive'})
  use( {'junegunn/gv.vim'})

  if packer_bootstrap then
    require('packer').sync()
  end

end)
