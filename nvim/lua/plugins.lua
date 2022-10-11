-- 自动安装 Packer.nvim
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("Installing Pakcer.nvim...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim installed")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer.nvim no installed")
  return
end

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    -------------------------- plugins -------------------------------------------
    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
    })
    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    })
    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- telescope extensions
    -- sudo add-apt-repository ppa:x4121/ripgrep && sudo apt-get update && sudo apt install ripgrep
    -- install fd from  
    -- use("linarcx/telescope-env.nvim")
    -- use("nvim-telescope/telescope-ui-select.nvim")
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    use("p00f/nvim-ts-rainbow")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    use("glepnir/template.nvim")
    --------------------- colorschemes --------------------
    use("folke/tokyonight.nvim")
    use("mhartington/oceanic-next")
    use({
      "ellisonleao/gruvbox.nvim",
      requires = { "rktjmp/lush.nvim" },
    })
    use("shaunsingh/nord.nvim")
    use("ful1e5/onedark.nvim")
    use("edeneast/nightfox.nvim")
    use 'Mofiqul/dracula.nvim'
    --------------------- tools --------------------
    use("ur4ltz/surround.nvim")
    use("numtostr/comment.nvim")
    use("windwp/nvim-autopairs")

    if paccker_bootstrap then
      packer.sync()
    end
  end,
})
