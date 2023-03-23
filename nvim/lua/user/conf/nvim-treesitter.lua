local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("treesitter not found!")
  return
end

configs.setup {
  ensure_installed = {
    "python",
    "go",
    "lua",
    "help",
    -- "cpp",
    -- "c",
    -- "markdown",
    -- "markdown_inline",
    -- "rust",
  },
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
    disable = { "yaml" }
  },
  -- autopairs plugin
  autopairs = {
    enable = false,
  },
}
