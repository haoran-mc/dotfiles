local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!")
  return
end

nvim_tree.setup({
  open_on_tab = false,
  update_cwd = false,
  remove_keymaps = true, -- 移除默认键绑定
  view = {
    width = 31,
    hide_root_folder = false,
    side = "left",
    relativenumber = false,
    mappings = {
      custom_only = true,
      list = {
        { key = "<cr>", action = "edit" }, -- 打开文件
        { key = "o", action = "edit_no_picker" },
        { key = "s", action = "split" },
        { key = "v", action = "vsplit" },
        { key = "t", action = "tabnew" },
        { key = "a", action = "create" }, -- 文件操作
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "O", action = "system_open" },
        { key = "C", action = "cd" }, -- 光标移动
        { key = "P", action = "parent_node" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "y", action = "copy_name" }, -- 复制文件名
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "-", action = "dir_up" }, -- 文件树操作
        { key = "R", action = "refresh" },
        { key = "q", action = "close" },
        { key = "E", action = "expand_all" },
        { key = "W", action = "collapse_all" },
        { key = "S", action = "search_node" }, -- 查找
        { key = "f", action = "live_filter" },
        { key = "F", action = "clear_live_filter" },
        { key = "<C-k>", action = "toggle_file_info" }, -- toggle
        { key = "i", action = "toggle_ignored" },
        { key = ".", action = "toggle_dotfiles" },
        { key = "g?", action = "toggle_help" },
        { key = "m", action = "toggle_mark" },
        { key = "bmv", action = "bulk_move" },
      },
    },
  },
  renderer = {
    special_files = {
      "Cargo.toml", "Makefile", "README.md", "readme.md",
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
        folder = {
          arrow_closed = "+",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      "^\\.git$", ".DS_Store",
    },
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {},
      },
    },
  },
})

-- with relative path
require "nvim-tree.events".on_file_created(function(file) vim.cmd("edit " .. file.fname) end)
-- with absolute path
-- require"nvim-tree.events".on_file_created(function(file) vim.cmd("edit "..vim.fn.fnamemodify(file.fname, ":p")) end)

-- auto close feature
vim.cmd(
  [[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
)
