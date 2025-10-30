local map     = vim.keymap.set
local opts    = { silent = true }
local augroup = vim.api.nvim_create_augroup("invoker.cfg", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })


-- better movement with line wrapping
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Move Lines (normal, insert, visual)
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "move down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move up" })


map('n', '<leader>e', ":Oil<CR>", { desc = 'files' })


map("n", "<leader>l", vim.diagnostic.open_float, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

autocmd("LspAttach", {

  group = augroup,

  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/implementation") then
      local bufopts = { noremap = true, silent = true, buffer = args.buf }
      map("n", "<leader>d", vim.lsp.buf.definition, bufopts)
      map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
      map("n", "<leader>r", vim.lsp.buf.references, bufopts)
      map("n", "<leader>i", vim.lsp.buf.implementation, bufopts)
      map("n", "<leader>h", ":LspClangdSwitchSourceHeader<CR>", bufopts)
      map("i", "<C-k>", vim.lsp.completion.get, bufopts) -- open completion menu manually
    end

    -- if client:supports_method("textDocument/completion") then
    --   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- end
  end,
})

map('n', 'Q', '<nop>', opts)
map('n', '<leader>e', ':Oil<CR>', opts)
map('n', '<leader>f', vim.lsp.buf.format, opts)

local fzf = require("fzf-lua")
local fzf_files = function()
  fzf.files({ winopts = { preview = { hidden = "hidden" } } })
end

local fzf_symbols = function()
  fzf.lsp_document_symbols({ winopts = { preview = { hidden = "hidden" } } })
end

map("n", "<leader><leader>", fzf_files, { desc = "files", noremap = true, silent = true })
map("n", "<leader>ss", fzf_symbols, { desc = "symbols", noremap = true, silent = true })
map("n", "<leader>sb", fzf.buffers, { desc = "buffers", noremap = true, silent = true })
map("n", "<leader>sg", fzf.live_grep, { desc = "grep", noremap = true, silent = true })
map("n", "<leader>/", fzf.lgrep_curbuf, { desc = "current buffer" })
map("n", "<leader>sh", fzf.help_tags, { desc = "help tags" })
map("n", "<leader>sm", function()
  fzf.man_pages({ sections = { "3" }, prompt_title = "Man Section 3" })
end, { desc = "man section 3" })
map("n", "<leader>so", fzf.oldfiles, { desc = "old files" })
map("n", "<leader>st", "<cmd>InspectTree<cr>", { desc = "treesitter inspect" })

-- GIT

map('n', '<leader>gf', fzf.git_files, { desc = "git files", noremap = true, silent = true })
map('n', '<leader>gs', fzf.git_status, { desc = "git files", noremap = true, silent = true })
map('n', '<leader>gd', fzf.git_diff, { desc = "git files", noremap = true, silent = true })
map('n', '<leader>gh', fzf.git_hunks, { desc = "git files", noremap = true, silent = true })
map('n', '<leader>gc', fzf.git_commits, { desc = "git files", noremap = true, silent = true })


-- -- LSP pickers
-- map("n", "<leader>sld", fzf.lsp_definitions, { desc = "definitions" })
-- map("n", "<leader>sli", fzf.lsp_implementations, { desc = "implementations" })
-- map("n", "<leader>slr", fzf.lsp_references, { desc = "references" })
-- map("n", "<leader>slsd", fzf.lsp_document_symbols, { desc = "document symbols" })
-- map("n", "<leader>slsw", fzf.lsp_live_workspace_symbols, { desc = "workspace symbols" })
-- map("n", "<leader>slD", fzf.lsp_declarations, { desc = "declarations" })
-- map("n", "<leader>slt", fzf.lsp_typedefs, { desc = "type definitions" })
-- map("n", "<leader>slci", fzf.lsp_incoming_calls, { desc = "incoming calls" })
-- map("n", "<leader>slco", fzf.lsp_outgoing_calls, { desc = "outgoing calls" })
-- map("n", "<leader>sla", fzf.lsp_code_actions, { desc = "code actions" })
-- map("n", "<leader>slid", fzf.diagnostics_document, { desc = "document diagnostics" })
-- map("n", "<leader>sliw", fzf.diagnostics_workspace, { desc = "workspace diagnostics" })
--
-- -- LSP actions
-- map('n', '<leader>lr', vim.lsp.buf.rename, { desc = "rename symbol" })
-- map('n', '<leader>la', vim.lsp.buf.code_action, { desc = "code action" })
-- map('n', '<leader>ld', vim.diagnostic.open_float, { desc = "show diagnostics" })
-- map('n', '<leader>lD', vim.lsp.buf.declaration, { desc = "declaration" })
-- map('n', '<leader>lg', vim.lsp.buf.definition, { desc = "definition" })
-- map('n', '<leader>li', vim.lsp.buf.implementation, { desc = "implementation" })
-- map('n', '<leader>lt', vim.lsp.buf.type_definition, { desc = "type definition" })
-- map('n', '<leader>lh', vim.lsp.buf.hover, { desc = "hover info" })
-- map('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = "signature help" })
--
-- Diagnostics navigation
-- map('n', '[d', vim.diagnostic.goto_prev, { desc = "LSP: Previous diagnostic" })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = "LSP: Next diagnostic" })

--
-- COMPILE C files

vim.keymap.set("n", "<leader>c", function()
  vim.cmd("w")
  vim.cmd("botright split")
  vim.cmd("resize 12")
  vim.cmd("terminal " .. "make")
end)
