vim.g.mapleader = " "                         -- 定义<leader>键
-- vim.g.maplocalleader = " "

-- basic
vim.o.scrolloff = 4                           -- 光标距底行最小距离
vim.o.sidescrolloff = 8                       -- 光标距屏幕右边框最小距离
vim.o.wrap = false                            -- 禁止折行
vim.o.mouse = ""                              -- 禁止使用鼠标
vim.o.clipboard = "unnamedplus"               -- 使用系统剪切板
vim.o.showmode = false                        -- 取消模式显示 -- INSERT --
vim.o.undofile = true                         -- 重新打开一个文件, 可以撤销上一次编辑的操作
vim.o.autochdir = false                       -- 不要自动确认文件夹(with Telescope)
vim.o.compatible = false                      -- 不兼容原始 vi 模式
vim.o.hidden = true                           -- 允许未保存文件时切换 buffer

-- 缩进
vim.o.tabstop = 4                             -- 制表符占用空格数
-- vim.o.expandtab = true                     -- 使用空格作为制表符
-- vim.o.shiftwidth = 4                       -- 如果使用空格作为制表符, 空格的个数
-- vim.o.softtabstop = 4                      -- 设置 4 个空格为制表符
vim.o.smartindent = true                      -- 智能的对齐方式
vim.o.cindent = true                          -- 打开 C/C++ 语言缩进优化
vim.o.autoindent = true                       -- 设置自动缩进

-- 折叠
vim.o.foldmethod = "expr"                     -- fold with nvim_treesitter
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false                      -- no fold to be applied when open a file
vim.o.foldlevel = 99                          -- if not set this, fold will be everywhere

-- search
vim.o.hlsearch = true                         -- 高亮显示搜索结果
vim.o.incsearch = true                        -- 搜索实时高亮
vim.o.ignorecase = true                       -- 搜索时大小写不敏感
vim.o.smartcase = true                        -- 智能大小写

-- backup
vim.o.backup = false                          -- 不创建备份文件
vim.o.writebackup = false                     -- 保存时备份
vim.o.swapfile = false                        -- 禁用交换文件
vim.o.updatetime = 1000
vim.o.timeout = true
vim.o.timeoutlen = 500                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.autoread = true                         -- 在 nvim 外修改过, 自动载入
vim.o.autowrite = true                        -- 自动保存

-- encode
vim.o.encoding = "utf-8"                      -- 内部工作编码
vim.o.fileencoding = "utf-8"                  -- 文件默认编码
                                              -- 打开文件时自动尝试下面顺序的编码
vim.o.fileencodings = "utf-8,gb18030,gbk,gb2312,utf-16,cp936,usc-bom,euc-jp"
                                              -- 终端使用的编码方式
vim.o.termencodings = "utf-8,gb18030,gbk,gb2312,utf-16,cp936,usc-bom,euc-jp"

-- code
vim.o.completeopt = "menuone,noselect"        -- mostly just for cmp
vim.o.conceallevel = 0                        -- so that `` is visible in markdown files
vim.o.signcolumn = "yes"                      -- 使用 sign column 用于 gitsign
vim.o.diffopt="vertical,filler,internal,context:4"           -- vertical diff split view

-- filetype
vim.o.syntax = "enable"                       -- 允许自动高亮
vim.o.filetype = "plugin"                     -- 设置加载对应文件类型的插件

-- UI
vim.o.number = false                          -- 行号显示
vim.o.relativenumber = false                  -- 相对行号
vim.o.cursorline = true                       -- 高亮当前行
vim.o.cursorcolumn = false                    -- 高亮当前列
vim.o.laststatus = 2                          -- 总是显示状态栏
vim.o.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.o.cmdheight = 1                           -- 命令行高度
vim.o.showtabline = 0                         -- 默认不显示 tabline
vim.o.list = false                            -- 显示可见字符^I
vim.o.listchars = "tab:»■,trail:■"            -- 显示行尾空格
vim.o.pumheight = 10                          -- pop up menu height
vim.o.splitbelow = true                       -- 默认下面分屏
vim.o.splitright = true                       -- 默认右侧分屏
vim.o.ruler = false
vim.o.showcmd = false                         -- 显示operator
vim.o.cole = 1                                -- see :h cole

------------------------------------------------------------

-- netrw
vim.g.netrw_sort_by = "time"
vim.g.netrw_sort_direction = "reverse"
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 0
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0


vim.o.formatoptions = "jcroqlnt"
vim.o.grepprg = "rg --vimgrep"

vim.o.lazyredraw = true
vim.o.sessionoptions = "buffers,curdir,folds,winsize,winpos"
vim.o.shortmess = "filnxtToOFI"
vim.o.selectmode = "mouse,key"
vim.o.viewoptions = "cursor,folds,slash,unix"

-- 新版本功能
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append({ C = true })
end
