local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.prettier.with({
        -- filetypes = { "json", "yaml", "markdown", "cpp" },
        filetypes = { "c", "cpp", "cs", "java", "cuda" } ,
    }),
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.completion.spell,
}

local lsp_formatting = function(bufnr)
    vim.lsp.buf.formatting_sync({
        filter = function(client)

            vim.notify(client.name)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- null_ls.setup({
--     -- you can reuse a shared lspconfig on_attach callback here
--     sources=sources,
--     defaults = defaults,
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     -- vim.lsp.buf.formatting_sync()
--                     lsp_formatting()
--                 end,
--             })
--
--           vim.notify("LSP client support textDocument/formatting")
--         else
--           vim.notify("LSP client not support textDocument/formatting")
--         end
--     end,
--     -- sources = sources
-- })
--
-- require("lspconfig")["null-ls"].setup({
--     -- see the nvim-lspconfig documentation for available configuration options
--     on_attach = on_attach
-- })
