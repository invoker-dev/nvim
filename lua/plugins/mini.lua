return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.icons').setup()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.align').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('mini.notify').setup()
    require('mini.extra').setup()
    require('mini.operators').setup()
    require('mini.statusline').setup()

    local miniclue = require('mini.clue')
    miniclue.setup({
      window = { width = "auto", delay = 0 },
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = 'n', keys = '<Leader>s',   desc = 'search' },
        { mode = 'n', keys = '<Leader>sls', desc = 'symbols' },
        { mode = 'n', keys = '<Leader>slc', desc = 'calls' },
        { mode = 'n', keys = '<Leader>sl',  desc = 'LSP' },
        { mode = 'n', keys = '<Leader>si',  desc = 'git' },
      },
    })
    require('mini.files').setup {

      windows = {
        max_number = 1,
        preview = false,
        width_focus = 40,
        width_nofocus = 10,
      },
      content = {
        filter = nil,
        sort = nil,
        view = nil,
      },
      mappings = {
        --
      },
    }
  end,

}
