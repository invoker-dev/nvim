
-- set leader to <space> and @@
vim.g.mapleader      = " "
vim.g.localmapleader = "\\"

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- NEOVIM OPTIONS
local opt = vim.opt

opt.termguicolors = true
opt.undofile      = true
opt.undolevels    = 10000
opt.updatetime    = 200
opt.clipboard     = vim.env.SSH_TTY and "" or "unnamedplus"
opt.completeopt   = "menu,menuone,noselect,fuzzy"
opt.conceallevel  = 2
opt.confirm       = true
opt.cursorline    = true
opt.foldlevel     = 99
opt.ignorecase    = true
opt.inccommand    = "nosplit"
opt.jumpoptions   = "view"
opt.laststatus    = 3
opt.linebreak     = true
opt.pumblend      = 10
opt.pumheight     = 10
opt.list          = true
opt.showmode      = false
opt.sidescrolloff = 8
opt.smartcase     = true
opt.smartindent   = true
opt.spelllang     = {"en"}
opt.splitkeep     = "screen"
opt.splitbelow    = true
opt.splitright    = true
opt.signcolumn    = "yes"
opt.smoothscroll  = true
opt.ruler         = false
opt.mouse         = "a"
opt.wildmode      = "longest:full,full" -- Command-line completion mode
opt.virtualedit   = "block"
opt.wrap          = false
opt.shortmess:append({ W = true, I = true, c = true, C = true })

opt.relativenumber = true
opt.number         = true

opt.expandtab  = true
opt.shiftwidth = 2
opt.tabstop    = 2
opt.shiftround = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.lsp.enable({
    "clangd",
    "lua_ls",
})

vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
