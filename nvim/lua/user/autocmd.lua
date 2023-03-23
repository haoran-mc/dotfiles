local autoGroup = vim.api.nvim_create_augroup("autoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- 用o换行不要延续注释
autocmd("BufEnter", {
  group = autoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})


-- 记住文件上次所在的位置
vim.cmd [[
  autocmd BufReadPost *
      \ if line("'\"")>0&&line("'\"")<=line("$") |
      \   exe "normal g'\"" |
      \ endif
]]

-- 保存 plugins.lua 文件后，自动刷新 neovim
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

