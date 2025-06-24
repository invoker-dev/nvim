
vim.api.nvim_create_autocmd("TextYankPost",{
  group = vim.api.nvim_create_augroup("YankHighlight", {
    clear = true}),
    pattern = "*",
    callback = function()
      vim.highlight.on_yank()
    end,
    desc = "Highlight yank",
  })


-- mini files
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("mini.files").open(nil, true)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      local win_id = args.data.win_id

      -- Customize window-local settings
      vim.wo[win_id].winblend = 0
      local config = vim.api.nvim_win_get_config(win_id)
      config.border, config.title_pos = 'none', 'right'
      vim.api.nvim_win_set_config(win_id, config)
    end,
  })

  -- vim.api.nvim_create_autocmd("WinEnter", {
  --   group = vim.api.nvim_create_augroup("MinifilesFocusSplit", {clear = true}),
  --   callback = function()
  --     local new_target = vim.api.nvim_get_current_win()
  --     MiniFiles.set_target_window(new_target)
  --   end,
  -- })
  --
  local map_split = function(buf_id, lhs, direction)
    local rhs = function()
      -- Make new window and set it as target
      local cur_target = MiniFiles.get_explorer_state().target_window
      local new_target = vim.api.nvim_win_call(cur_target, function()
        vim.cmd(direction .. ' split')
        return vim.api.nvim_get_current_win()
      end)

      MiniFiles.set_target_window(new_target)

      -- This intentionally doesn't act on file under cursor in favor of
      -- explicit "go in" action (`l` / `L`). To immediately open file,
      -- add appropriate `MiniFiles.go_in()` call instead of this comment.
    end

    -- Adding `desc` will result into `show_help` entries
    local desc = 'Split ' .. direction
    vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
  end

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id
      -- Tweak keys to your liking
      map_split(buf_id, '<C-s>', 'belowright horizontal')
      map_split(buf_id, '<C-v>', 'belowright vertical')
      map_split(buf_id, '<C-t>', 'tab')
    end,
  })

