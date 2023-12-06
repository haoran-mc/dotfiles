return {
  "shaunsingh/moonlight.nvim",

  enabled = function ()
    if Variants.Theme == "moonlight" then
      return true
    end
    return false
  end,

  init = function()
    vim.cmd("colorscheme moonlight")
  end
}
