
local map = vim.keymap.set
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "right window", remap = true })

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })


-- better movement with line wrapping
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })


-- Move Lines (normal, insert, visual)
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "move down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move up" })

-- mini  files
local minifiles_toggle = function(...)
  if not MiniFiles.close() then MiniFiles.open(...) end
end

map('n', '<leader>e', minifiles_toggle, { desc = 'files' })



-- picker 

local fzf = require("fzf-lua")

-- Standard pickers
map("n", "<leader>sf", fzf.files,               { desc = "files" })
map("n", "<leader>sg", fzf.live_grep,           { desc = "live grep" })
map("n", "<leader>b", fzf.builtin,              { desc = "builtin" })
map("n", "<leader><leader>", fzf.buffers,       { desc = "buffers" })
map("n", "<leader>/", fzf.lgrep_curbuf,         { desc = "current buffer" })
map("n", "<leader>sh", fzf.help_tags,           { desc = "help tags" })
map("n", "<leader>sm", function()
  fzf.man_pages({ sections = { "3" }, prompt_title = "Man Section 3" })
end, { desc = "man section 3" })
map("n", "<leader>sc", fzf.commands,            { desc = "commands" })
map("n", "<leader>so", fzf.oldfiles,            { desc = "old files" })
map("n", "<leader>st", "<cmd>InspectTree<cr>",  { desc = "treesitter inspect" })

-- Git pickers
map("n", "<leader>sib", fzf.git_branches, { desc = "git branches" })
map("n", "<leader>sic", fzf.git_commits,  { desc = "git commits" })
map("n", "<leader>sif", fzf.git_files,    { desc = "git files" })
map("n", "<leader>sih", fzf.git_status,   { desc = "git hunks/status" }) -- fzf-lua doesn't have a direct 'hunks', but status shows changes

-- LSP pickers
map("n", "<leader>sld", fzf.lsp_definitions,        { desc = "definitions"})
map("n", "<leader>sli", fzf.lsp_implementations,    { desc = "implementations"})
map("n", "<leader>slr", fzf.lsp_references,         { desc = "references"})
map("n", "<leader>slsd", fzf.lsp_document_symbols,  { desc = "document symbols"})
map("n", "<leader>slsw", fzf.lsp_live_workspace_symbols, { desc = "workspace symbols"})
map("n", "<leader>slD", fzf.lsp_declarations,       { desc = "declarations"})
map("n", "<leader>slt", fzf.lsp_typedefs,           { desc = "type definitions"})
map("n", "<leader>slci", fzf.lsp_incoming_calls,       { desc = "incoming calls"})
map("n", "<leader>slco", fzf.lsp_outgoing_calls,       { desc = "outgoing calls"})
map("n", "<leader>sla", fzf.lsp_code_actions,      { desc = "code actions"})
map("n", "<leader>slid", fzf.diagnostics_document,{ desc = "document diagnostics"})
map("n", "<leader>sliw", fzf.diagnostics_workspace,{ desc = "workspace diagnostics"})

-- LSP actions
map('n', '<leader>lr', vim.lsp.buf.rename,          { desc = "rename symbol" })
map('n', '<leader>la', vim.lsp.buf.code_action,     { desc = "code action" })
map('n', '<leader>ld', vim.diagnostic.open_float,   { desc = "show diagnostics" })
map('n', '<leader>lD', vim.lsp.buf.declaration,     { desc = "declaration" })
map('n', '<leader>lg', vim.lsp.buf.definition,      { desc = "definition" })
map('n', '<leader>li', vim.lsp.buf.implementation,  { desc = "implementation" })
map('n', '<leader>lt', vim.lsp.buf.type_definition, { desc = "type definition" })
map('n', '<leader>lh', vim.lsp.buf.hover,           { desc = "hover info" })
map('n', '<leader>ls', vim.lsp.buf.signature_help,  { desc = "signature help" })

-- Diagnostics navigation
-- map('n', '[d', vim.diagnostic.goto_prev, { desc = "LSP: Previous diagnostic" })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = "LSP: Next diagnostic" })

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format buffer" })

