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
local pick = require("mini.pick").builtin
local extra = require("mini.extra").pickers
map("n", "<leader>sf", pick.files,        { desc = "pick files" })
map("n", "<leader>sg", pick.grep_live,    { desc = "live grep" })
map("n", "<leader>sb", pick.buffers,      { desc = "buffers" })
map("n", "<leader>sh", pick.help,         { desc = "help tags" })
map("n", "<leader>sc", extra.commands,    { desc = "commands" })
map("n", "<leader>sd", extra.diagnostic,  { desc = "diagnostics" })
map("n", "<leader>st", extra.treesitter,  { desc = "treesitter" })
-- git pickers
map("n", "<leader>sib", extra.git_branches,  { desc = "branches" })
map("n", "<leader>sic", extra.git_commits,   { desc = "commits" })
map("n", "<leader>sif", extra.git_files,     { desc = "files" })
map("n", "<leader>sih", extra.git_hunks,     { desc = "hunks" })
-- LSP
local function map_lsp(lhs, scope, desc)
  map("n", lhs, function() extra.lsp({ scope = scope }) end, { desc = "LSP: " .. desc })
end
map_lsp("<leader>sld",  "definition",       "definition")
map_lsp("<leader>sli",  "implementation",   "implementation")
map_lsp("<leader>slr",  "references",       "references")
map_lsp("<leader>slsd", "document_symbol",  "document symbols")
map_lsp("<leader>slsw", "workspace_symbol", "workspace symbols")
map_lsp("<leader>slD",  "declaration",      "declaration")
map_lsp("<leader>slt", "type_definition", "type definition")
