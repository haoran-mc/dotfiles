-- <leader>k
return {
  "ray-x/starry.nvim",
  enabled = false,
  init = function()
    vim.cmd('colorscheme moonlight')
  end,
}
