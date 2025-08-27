return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require 'fzf-lua'.setup {
      'ivy',
      'max-perf'

    }
  end
}
