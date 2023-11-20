vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basic
vim.o.scrolloff = 4                           -- keep 4 height offset from above and bottom
vim.o.sidescrolloff = 8                       -- keep 8 width offset from left and right
vim.o.wrap = false                            -- display lines as one long line
vim.o.mouse = ""                              -- disallow the mouse to be used in neovim
vim.o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.o.undofile = true                         -- enable persistent undo
vim.o.spell = false                           -- add spell support
vim.o.spelllang = 'en_us'                     -- support which languages?
vim.o.autochdir = false                       -- for Telescope
vim.o.compatible = false                      -- no compatible for vi

-- enhance
vim.o.wildmenu = true                         -- enhance command line completion
vim.o.hidden = true                           -- hidden unsaved buffer

-- indent
vim.o.tabstop = 4                             -- insert 2 spaces for a tab
vim.o.expandtab = true                        -- convert tabs to spaces
vim.o.shiftwidth = 4                          -- the number of spaces inserted for each indentation, such as >> <<
vim.o.softtabstop = 4
vim.o.smartindent = true                      -- make indenting smarter again
vim.o.foldmethod = "expr"                     -- fold with nvim_treesitter
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false                      -- no fold to be applied when open a file
vim.o.foldlevel = 99                          -- if not set this, fold will be everywhere
vim.o.cindent = true                          -- for c indent
vim.o.autoindent = true                       -- auto indent

-- search
vim.o.hlsearch = true                         -- highlight all matches on previous search pattern
vim.o.incsearch = true                        -- real time search
vim.o.ignorecase = true                       -- ignore case in search patterns
vim.o.smartcase = true                        -- smart case

-- backup
vim.o.backup = false                          -- creates a backup file
vim.o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.swapfile = false                        -- creates a swapfile
vim.o.updatetime = 1000                        -- faster completion for gitsigns (4000ms default)
vim.o.timeout = true
vim.o.timeoutlen = 500                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.autoread = true                         -- load automatically when the file is modified by an external program
vim.o.autowrite = true                        -- auto write

-- encode
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8,gb18030,gbk,gb2312,utf-16,cp936,usc-bom,euc-jp"

-- code
vim.o.completeopt = "menuone,noselect"             -- mostly just for cmp
vim.o.conceallevel = 0                             -- so that `` is visible in markdown files
vim.o.signcolumn = "yes"                           -- always show the sign column, otherwise it would shift the text each time
vim.o.diffopt="vertical,filler,internal,context:4"                      -- vertical diff split view

-- filetype
vim.o.syntax = "enable"                       -- enable file syntax
vim.o.filetype = "plugin"                     -- filetype according to plugin

-- UI
vim.o.number = false                          -- set numbered lines
vim.o.relativenumber = false                  -- set relative numbered lines
vim.o.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.o.cursorline = true                       -- highlight the current line
vim.o.cursorcolumn = false                    -- cursor column.
vim.o.laststatus = 2                          -- show statusline always
vim.o.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.o.cmdheight = 1                           -- keep status bar position close to bottom
vim.o.showtabline = 0                         -- never show tabs
vim.o.list = false                            -- display invisible character
vim.o.listchars = "tab:»■,trail:■"            -- displays end-of-line spaces
vim.o.pumheight = 10                          -- pop up menu height
vim.o.splitbelow = true                       -- force all horizontal splits to go below current window
vim.o.splitright = true                       -- force all vertical splits to go to the right of current window
vim.o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.o.ruler = false
vim.o.showcmd = false
vim.o.cole = 1                                -- see :h cole

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


-- WSL yank support
vim.cmd [[
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
]]


-- if vim.fn.has("win32")  and vim.fn.executable("bash.exe") then
-- 	vim.o.shell = "bash.exe"
-- 	vim.o.shellcmdflag = "-c"
-- 	vim.o.shellredir = ">%s 2>&1"
-- 	vim.o.shellpipe = "2>&1 | tee"
-- 	vim.o.shellquote = ""
-- 	vim.o.shellxescape = ""
-- 	vim.o.shellxquote = ""
-- end

