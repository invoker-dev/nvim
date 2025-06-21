
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
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })


-- better movement with line wrapping
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })


-- Move Lines (normal, insert, visual)
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })



-- picker 

local fzf = require("fzf-lua")
local map = vim.keymap.set

-- Standard pickers
map("n", "<leader>sf", fzf.files,         { desc = "Files" })
map("n", "<leader>sg", fzf.live_grep,     { desc = "Live Grep" })
map("n", "<leader>sb", fzf.buffers,       { desc = "Buffers" })
map("n", "<leader>sh", fzf.help_tags,     { desc = "Help Tags" })
map("n", "<leader>sm", fzf.man_pages,     { desc = "Man Pages" })
map("n", "<leader>sc", fzf.commands,      { desc = "Commands" })
map("n", "<leader>st", "<cmd>InspectTree<cr>", { desc = "Treesitter Inspect" }) -- this remains as is

-- Git pickers
map("n", "<leader>sib", fzf.git_branches, { desc = "Git Branches" })
map("n", "<leader>sic", fzf.git_commits,  { desc = "Git Commits" })
map("n", "<leader>sif", fzf.git_files,    { desc = "Git Files" })
map("n", "<leader>sih", fzf.git_status,   { desc = "Git Hunks/Status" }) -- fzf-lua doesn't have a direct 'hunks', but status shows changes

-- LSP pickers
map("n", "<leader>sld", fzf.lsp_definitions,        { desc = "Definitions"})
map("n", "<leader>sli", fzf.lsp_implementations,    { desc = "Implementations"})
map("n", "<leader>slr", fzf.lsp_references,         { desc = "References"})
map("n", "<leader>slsd", fzf.lsp_document_symbols,  { desc = "Document Symbols"})
map("n", "<leader>slsw", fzf.lsp_live_workspace_symbols, { desc = "Workspace Symbols"})
map("n", "<leader>slD", fzf.lsp_declarations,       { desc = "Declarations"})
map("n", "<leader>slt", fzf.lsp_typedefs,           { desc = "Type Definitions"})
map("n", "<leader>slci", fzf.lsp_incoming_calls,       { desc = "Incoming Calls"})
map("n", "<leader>slco", fzf.lsp_outgoing_calls,       { desc = "Outgoing Calls"})
map("n", "<leader>sla", fzf.lsp_code_actions,      { desc = "Code Actions"})
map("n", "<leader>slid", fzf.diagnostics_document,{ desc = "Document Diagnostics"})
map("n", "<leader>sliw", fzf.diagnostics_workspace,{ desc = "Workspace Diagnostics"})


