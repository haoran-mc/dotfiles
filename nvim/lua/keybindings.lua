-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
map("n", "<C-J>", "10j", opt)
map("n", "<C-K>", "10k", opt)
map("v", "<C-J>", "10j", opt)
map("v", "<C-K>", "10k", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)
-- insert 模式下，跳到行首行尾
map("i", "<C-a>", "<ESC>I", opt)
map("i", "<C-e>", "<ESC>A", opt)

------------------------------------------------------------------
-- windows operation
------------------------------------------------------------------
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- c-w = 相同比例
map("n", "<C-Left>", ":vertical resize -2<cr>", opt)
map("n", "<C-Right>", ":vertical resize +2<cr>", opt)
map("n", "<C-Down>", ":resize +2<cr>", opt)
map("n", "<C-Up>", ":resize -2<cr>", opt)
map("n", "<leader>wV", ":vsp<cr>", opt)
map("n", "<leader>wv", ":vsp<cr>", opt)
map("n", "<leader>wS", ":sp<cr>", opt)
map("n", "<leader>ws", ":sp<cr>", opt)
map("n", "<leader>wc", ":q<cr>", opt)
map("n", "<leader>wo", ":only<cr>", opt)
-- map("n", "<leader><tab>", ":bp<cr>", opt)

-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)

------------------------------------------------------------------
-- commen files
------------------------------------------------------------------
map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<cr>", opt)

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
map("n", "<leader>ft", ":NvimTreeToggle<CR>", opt)
map("n", "<A-0>", ":NvimTreeFocus<CR>", opt)
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
  -- open
  { key = { "o", "<2-LeftMouse>", "<TAB>" }, action = "edit" },
  { key = "<CR>", action = "edit_no_picker" },
  { key = "s", action = "split" },
  { key = "v", action = "vsplit" },
  -- Ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  -- file operation
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "n", action = "tabnew" },
  -- 进入下一级
  { key = { "]" }, action = "cd" },
  -- 进入上一级
  { key = { "[" }, action = "dir_up" },
}

-- bufferline
map("n", "gT", ":BufferLineCyclePrev<CR>", opt)
map("n", "gt", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader>bc", ":Bdelete!<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- 历史记录
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- 关闭窗口
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- coderunner
local runner = "require('coderunner')"
map("n", ",r", "<cmd>lua " .. runner ..".exec()<cr>", opt)
map("n", ",d", "<cmd>lua " .. runner ..".debug()<cr>", opt)
map("n", "<leader>d", ":vsplit<CR>:e data.in<CR>ggdG", opt)

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })

return pluginKeys
