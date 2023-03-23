local status_ok, comment = pcall(require, "comment")
if not status_ok then
  vim.notify("comment not found!")
  return
end


local api = require('Comment.api')
vim.keymap.set('n', '<C-/>', api.toggle.linewise.current)

comment.setup({
  padding = true,
  sticky = true,
  ignore = '^$',
  toggler = {
    line = 'gcc',
    block = 'gbc'
  },
  opleader = {
    line = 'gc',
    block = 'gb'
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA'
  },
  mappings = {
    basic = true,
    extra = false
  },
  pre_hook = nil,
  post_hook = nil,
})
