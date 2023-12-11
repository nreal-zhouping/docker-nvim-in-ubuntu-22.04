vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- -- 左侧让出 nvim-tree 的位置
        -- offsets = {{
        --     filetype = "NvimTree",
        --     text = "File Explorer",
        --     highlight = "Directory",
        --     text_align = "left"
        -- }},
        offsets = {},
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        separator_style = "slant",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        mode = "buffers"
    }
}
