"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/autoload/plug.vim
call plug#begin('~/.nvim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fatih/vim-go', { 'tag': '*' }
" Plug 'RRethy/vim-hexokinase'
call plug#end()


" nerdcommenter
let g:NERDSpaceDelims = 1
nmap ,/ <plug>NERDCommenterToggle
vmap ,/ <plug>NERDCommenterToggle
