vim.lsp.enable({
    "clangd",
    "lua_ls",
    "cmake-language-server",
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
--     callback = function(event)
--         local client = vim.lsp.get_client_by_id(event.data.client_id)
--             local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
--             vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--                 buffer = event.buf,
--                 group = highlight_augroup,
--                 callback = vim.lsp.buf.document_highlight,
--             })
--
--             vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--                 buffer = event.buf,
--                 group = highlight_augroup,
--                 callback = vim.lsp.buf.clear_references,
--             })
--
--             vim.api.nvim_create_autocmd('LspDetach', {
--                 group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
--                 callback = function(event2)
--                     vim.lsp.buf.clear_references()
--                     vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
--                 end,
--             })
--     end
-- })
