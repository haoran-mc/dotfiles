-- require "user.themes.github-nvim-theme"

-- vim.o.background = "dark"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true

local colorscheme = "tokyonight-moon"
-- slate
-- dracula
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
-- github_dark
-- solarized

require("tokyonight").setup({
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
})


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " no found!")
  return
end
