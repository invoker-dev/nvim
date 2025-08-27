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

return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    -- Default options:
    require('gruvbox').setup {
      terminal_colors = true,   -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true,   -- invert background for search, diffs, statuslines and errors
      contrast = '',    -- can be "hard", "soft" or empty string
      palette_overrides = {
        -- dark0 = '#1b1b1b',
        -- dark1 = '#202021',
      },
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    }
    vim.cmd 'colorscheme gruvbox'
  end,
  opts = ...,
}

