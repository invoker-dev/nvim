return {

  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'metalelf0/black-metal-theme-neovim',
  lazy = false,
  priority = 1000,
  config = function()
    require('black-metal').setup {
      theme = 'emperor',
      alt_bg = false,

      code_style = {
        functions = 'bold',
      },

      highlights = {
        ['@property'] = { fmt = 'italic' },
        ['@lsp.type.property'] = { fmt = 'italic' },
      },
    }
    require('black-metal').load()
  end,
  -- Load the colorscheme here.
  -- Like many other themes, this one has different styles, and you could load
  -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
}

-- return {
--   "zenbones-theme/zenbones.nvim",
--   -- Optionally install Lush. Allows for more configuration or extending the colorscheme
--   -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
--   -- In Vim, compat mode is turned on as Lush only works in Neovim.
--   dependencies = "rktjmp/lush.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--       vim.g.zenbones_darken_comments = 45
--       vim.cmd.colorscheme('zenbones')
--   end
-- }
--
-- return {
--   'ellisonleao/gruvbox.nvim',
--   priority = 1000,
--   config = function()
--     -- Default options:
--     require('gruvbox').setup {
--       terminal_colors = true,   -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       inverse = true,   -- invert background for search, diffs, statuslines and errors
--       contrast = '',    -- can be "hard", "soft" or empty string
--       palette_overrides = {
--         -- dark0 = '#1b1b1b',
--         -- dark1 = '#202021',
--       },
--       overrides = {},
--       dim_inactive = false,
--       transparent_mode = false,
--     }
--     vim.cmd 'colorscheme gruvbox'
--   end,
--   opts = ...,
-- }
--
