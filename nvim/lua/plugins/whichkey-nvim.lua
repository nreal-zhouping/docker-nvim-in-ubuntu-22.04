-----------------------------------------------------------
-- WhichKey configuration file
----------------------------------------------------------

-- Plugin: which-key
-- url: https://https://github.com/folke/which-key.nvim


local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
  return
end

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    i = { "f", "d" },
    v = { "j", "k" },
  },
}


wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files theme=ivy<cr>", "Find File" }, -- create a binding with label
    b = { "<cmd>Telescope buffers theme=ivy<cr>", "Find Buffers" }, -- create a binding with label
    ['/'] = { "<cmd>Telescope live_grep_args theme=ivy<cr>", "Live Grep Args" }, -- create a binding with label
  },
}, { prefix = "<leader>" })


wk.register({
  ["#/"] = { [[<cmd> call luaeval("require('telescope.builtin').grep_string({search=_A})", expand('<cword>')) <CR>]], "Search current word in root project."},
  ["<leader>bb"] = { "<cmd>Telescope buffers theme=ivy<cr>", "Find Buffers"},
  ["<leader>gs"] = { "<cmd>Telescope buffers theme=ivy<cr>", "Find Buffers"},
  ['<leader>/'] = { "<cmd>Telescope live_grep_args theme=ivy<cr>", "Live Grep Args" }, -- create a binding with label
})


-- nvim-spectre
-- https://github.com/nvim-pack/nvim-spectre
wk.register({
  ["<leader>S"] = { "<cmd>lua require('spectre').open()<cr>", "Search and replace"},
  ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "search current word"},
  ["<leader>s"] = { "<cmd>lua require('spectre').open_visual()<cr>", "search current"},
  ["<leader>sp"] = { "<cmd>viw:lua require('spectre').open_file_search()<cr>", "search current"},
})

-- diffview
wk.register({
  d = {
    name = "diffview", -- optional group name
    o = { "<cmd>DiffviewOpen<cr>", "DiffviewOpen" },
    f = { "<cmd>DiffviewFocusFiles<cr>", "DiffviewFocusFiles" },
    c = { "<cmd>DiffviewClose<cr>", "DiffviewClose" },
    r = { "<cmd>DiffviewRefresh<cr>", "DiffviewRefresh" },
  },
}, { prefix = "<leader>" })


-- ta
wk.register({
  t = {
    name = "tab",
    h = { "<cmd>tabnext<cr>", "tabnext "},
    l = { "<cmd>tabprevious<cr>", "tabprevious"}
  }
}, { prefix = "<leader>" })


