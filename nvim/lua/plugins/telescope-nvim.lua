-----------------------------------------------------------
-- Telescope configuration file
----------------------------------------------------------

-- Plugin: nvim-telescope
-- url: https://https://github.com/nvim-telescope/telescope.nvim


local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

local lga_actions = require("telescope-live-grep-args.actions")

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- 窗口内快捷键
    mappings = require("core.keymaps").telescopeList,
    path_display={"smart"},
    dynamic_preview_title = true
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
      theme = "ivy",
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor({
        -- even more opts
      }),
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      layout_config = { mirror=true }, -- mirror preview pane
    }
  },
})

-- telescope.setup {
--   extensions = {
--     live_grep_args = {
--       auto_quoting = true, -- enable/disable auto-quoting
--       -- define mappings, e.g.
--       mappings = { -- extend mappings
--         i = {
--           ["<C-k>"] = lga_actions.quote_prompt(),
--           ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
--         },
--       },
--       -- ... also accepts theme settings, for example:
--       -- theme = "dropdown", -- use dropdown theme
--       -- theme = { }, -- use own theme spec
--       -- layout_config = { mirror=true }, -- mirror preview pane
--     }
--   }
-- }

pcall(telescope.load_extension, "project")

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")


pcall(telescope.load_extension, "live_grep_args")
