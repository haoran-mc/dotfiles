-- @diagnostic disable: undefined-global
-- install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- add lazypath in runtime path(rtp)
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("settings")
require("keymaps")
require("autocmd")
require("variant")

require("lazy").setup({
  root = vim.fn.stdpath("data") .. "/lazy", -- ~/.local/share/nvim/lazy
  defaults = {
    lazy = false,                           -- should plugins be lazy-loaded?
    version = nil,
  },
  spec = {
    { import = "plugins" },
    { import = "plugins.lang" },
    { import = "plugins.lang.lsp" },
    -- { import = "plugins.lang.dap" },
    { import = "plugins.themes" },
    { import = "plugins.tools" },
  },
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "--since=3 days ago" }, -- show commits from the last 3 days
    timeout = 120,                  -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "onedark" }, -- "onedark", "habamax"
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "single",
    -- you can define custom key maps here.
    -- To disable one of the defaults, set it to false
    custom_keys = {},
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = 10, ---@type number? set to 1 to check for updates very slowly
    notify = true,    -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      -- The default is to disable on:
      --  * VimEnter: not useful to cache anything else beyond startup
      --  * BufReadPre: this will be triggered early when opening a file from the command line directly
      disable_events = { "UIEnter", "BufReadPre" },
      ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
    },
  },
})
