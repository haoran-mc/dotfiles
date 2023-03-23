local options = {
  -- basic
  scrolloff = 4,                           -- keep 4 height offset from above and bottom
  sidescrolloff = 8,                       -- keep 8 width offset from left and right
  wrap = false,                            -- display lines as one long line
  mouse = "",                              -- disallow the mouse to be used in neovim
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  undofile = true,                         -- enable persistent undo
  spell = false,                           -- add spell support
  spelllang = { 'en_us' },                 -- support which languages?
  autochdir = false,                       -- for Telescope

  -- indent
  tabstop = 2,                             -- insert 2 spaces for a tab
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation, such as >> <<
  smartindent = true,                      -- make indenting smarter again
  foldmethod = "expr",                     -- fold with nvim_treesitter
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,                      -- no fold to be applied when open a file
  foldlevel = 99,                          -- if not set this, fold will be everywhere

  -- search
  hlsearch = true,                         -- highlight all matches on previous search pattern
  incsearch = true,                        -- real time search
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case

  -- backup
  backup = false,                          -- creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false,                        -- creates a swapfile
  updatetime = 300,                        -- faster completion (4000ms default)
  autoread = true,                         -- load automatically when the file is modified by an external program
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)

  -- encode
  fileencoding = "utf-8",                  -- the encoding written to a file

  -- code
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  diffopt="vertical,filler,internal,context:4",                      -- vertical diff split view

  -- UI
  number = false,                          -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  cursorline = true,                       -- highlight the current line
  cursorcolumn = false,                    -- cursor column.
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  cmdheight = 1,                           -- keep status bar position close to bottom
  showtabline = 0,                         -- never show tabs
  list = false,                            -- display invisible character
  listchars = "tab:»■,trail:■",            -- displays end-of-line spaces
  pumheight = 10,                          -- pop up menu height
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

-- Dont' pass messages to |ins-completin menu|
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work


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
