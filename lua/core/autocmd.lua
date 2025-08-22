local aug = vim.api.nvim_create_augroup
local au  = vim.api.nvim_create_autocmd
local grp = aug("MyAutoCmds", { clear = true })

-- Restore last cursor position when reopening a file
au("BufReadPost", {
  group = grp,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight text after yanking (copying)
au("TextYankPost", {
  group = grp,
  callback = function()
    vim.highlight.on_yank()
  end,
})
