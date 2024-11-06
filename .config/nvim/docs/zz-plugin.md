```lua
---------------[[
-- zz plugin like beacon
--]]
local prev_buf = 0
local prev_line = 0
local win_height = 80

vim.api.nvim_create_autocmd("WinResized", {
  callback = function()
    win_height = vim.fn.winheight(0)
  end
})

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    for _, ft in pairs({"neo-tree"}) do
      if vim.bo.filetype == ft then
        return
      end
    end
    local cur_buf = vim.fn.bufnr('%')
    local cur_line = vim.fn.line(".")
    local diff_line = math.abs(cur_line - prev_line)
    if cur_buf ~= prev_buf or diff_line >= win_height then
      vim.cmd("normal! zz")
    end
    prev_buf = cur_buf
    prev_line = cur_line
  end,
})
```
