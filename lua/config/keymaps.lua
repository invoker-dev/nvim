
local map = vim.keymap.set
-- Mini.files <leader>e
map('n', '<leader>e', function()
  local buffer_name = vim.api.nvim_buf_get_name(0)
  if buffer_name == '' or string.match(buffer_name, 'Starter') then
    require('mini.files').open(vim.loop.cwd())
  else
    require('mini.files').open(vim.api.nvim_buf_get_name(0))
  end
end, { desc = 'files' })

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



-- picker 

local fzf = require("fzf-lua")
local map = vim.keymap.set

-- Standard pickers
map("n", "<leader>sf", fzf.files,               { desc = "files" })
map("n", "<leader>sg", fzf.live_grep,           { desc = "live grep" })
map("n", "<leader>b", fzf.builtin,              { desc = "builtin" })
map("n", "<leader><leader>", fzf.buffers,       { desc = "buffers" })
map("n", "<leader>/", fzf.lgrep_curbuf,         { desc = "current buffer" })
map("n", "<leader>sh", fzf.help_tags,           { desc = "help tags" })
map("n", "<leader>sm", fzf.man_pages,           { desc = "man pages" })
map("n", "<leader>sc", fzf.commands,            { desc = "commands" })
map("n", "<leader>so", fzf.oldfiles,            { desc = "old files" })
map("n", "<leader>st", "<cmd>InspectTree<cr>",  { desc = "treesitter inspect" }) -- this remains as is

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


