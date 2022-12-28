"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/plug.vim
call plug#begin('~/.nvim/plugged')
" Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'RRethy/vim-hexokinase'
call plug#end()


" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.o$', '^\.git$', 'o-o', '_exe', '.vscode', '\.ogmc', '\.exe']


" nerdcommenter
let g:NERDSpaceDelims = 1
nmap ,/ <plug>NERDCommenterToggle
vmap ,/ <plug>NERDCommenterToggle
