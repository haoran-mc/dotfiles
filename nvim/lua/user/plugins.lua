local fn = vim.fn

-- Automatically install packer
-- ~/.local/share/nvim/site/pack/packer/start/ .. packer.nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer.nvim no installed")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Packer 可以升级自己
  -------------------------- plugins --------------------------
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "ianva/vim-youdao-translater"
  use { 'francoiscabrol/ranger.vim', requires = 'rbgrouleff/bclose.vim' }

  --------------------- Telescope --------------------
  use "nvim-lua/plenary.nvim"
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  --------------------- Toggleterm --------------------
  use "akinsho/toggleterm.nvim" -- toggle terminal
  use "rcarriga/nvim-notify"
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use 'lewis6991/gitsigns.nvim'
  -- 'sindrets/diffview.nvim'

  --------------------- Editor enhance --------------------
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numtostr/comment.nvim"
  use "tpope/vim-repeat" --  . command enhance, e.g. vim-surround
  use "tpope/vim-surround" -- vim surround
  use "nathom/filetype.nvim" -- speedup by replacing filetype.vim
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' } -- j m w
    end
  }
  use "itchyny/vim-cursorword" -- 下划线当前变量，RRethy/vim-illuminate
  use "lfv89/vim-interestingwords" -- 高亮当前变量，可高亮多个
  -- use "mg979/vim-visual-multi"

  --------------------- coc --------------------
  use {'neoclide/coc.nvim', branch = 'release'}

  --------------------- lang --------------------
  use "fatih/vim-go"
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
  })

  --------------------- colorschemes --------------------
  use "projekt0n/github-nvim-theme"
  use "folke/tokyonight.nvim"
  use "ful1e5/onedark.nvim"
  use "Mofiqul/dracula.nvim"
  use "ishan9299/nvim-solarized-lua"
  use "edeneast/nightfox.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
