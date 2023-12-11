-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-- https://github.com/nshen/learn-neovim-lua/blob/main/lua/keybindings.lua
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'fd', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')
map('n', '<leader>s', ':w<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
-- map('n', '<C-h>', '<C-w>h')
-- map('n', '<C-j>', '<C-w>j')
-- map('n', '<C-k>', '<C-w>k')
-- map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so ~/.config/nvim/init.lua<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>fs', ':update<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>qs', ':q!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- BufferLine
map('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>')
map('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>')
map('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>')
map('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>')
map('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>')
map('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>')
map('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>')
map('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>')
map('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>')
-- map('n', '<leader>l', ':BufferLineCycleNext <CR>')
-- map('n', '<leader>h', ':BufferLineCyclePrev <CR>')
map('n', '<leader>k', ':BufferLineTogglePin <CR>')
map('n', '<C-l>', ':BufferLineCycleNext <CR>')
map('n', '<C-h>', ':BufferLineCyclePrev <CR>')

map('n', 'gb', ':BufferLinePick<CR>')


-- Telescope
-- map("n", "<leader>ff", ":Telescope find_files theme=ivy<CR>")
-- map("n", "<leader>bb", ":Telescope buffers theme=ivy<CR>")
-- map("n", "<leader>ss", ":Telescope grep_string theme=ivy<CR>")
-- map("n", "<leader>/", ":Telescope live_grep theme=ivy<CR>")
-- map("n", "<leader>ll", ":Telescope live_grep theme=ivy<CR>")
-- map("n", "#/", [[<cmd> call luaeval("require('telescope.builtin').grep_string({search=_A})", expand('<cword>')) <CR>]] )
map("n", "<leader><leader>", ":Legendary<CR>")

-- Plugins Keys
local pluginKeys = {}
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    ["<C-c>"] = "close",
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  }
}

map('v', "=", ":lua vim.lsp.buf.range_format()<CR>")
map('n', "==", ":lua vim.lsp.buf.format()<CR>")

return pluginKeys

