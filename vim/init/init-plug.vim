"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'easymotion/vim-easymotion'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
" vim-clap, leaderF alternative
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'RRethy/vim-hexokinase'
Plug 'jceb/vim-orgmode'
call plug#end()

" 插件简要使用
" :PlugInstall     - 安装插件
" :PlugClean       - 移除插件
" :plugStatus      - 插件状态


" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.o$', '^\.git$', 'o-o', '_exe', '.vscode', '\.ogmc', '\.exe']
nnoremap <leader>ft  :NERDTree<cr>
nnoremap <leader>odc :NERDTree ~/haoran/algo<cr>
nnoremap <leader>odh :NERDTree ~/haoran<cr>


" nerdcommenter
let g:NERDSpaceDelims = 1
nmap ,/ <plug>NERDCommenterToggle
vmap ,/ <plug>NERDCommenterToggle


" vim-autoformat
nnoremap <leader>of :Autoformat<cr>


" vim-easymotion
" s = f + F
" use s h j k l
let g:EasyMotion_smartcase = 1
map <leader>fs <Plug>(easymotion-s)
map <leader>fs <Plug>(easymotion-s2)
map <leader>fh <Plug>(easymotion-linebackward)
map <leader>fj <Plug>(easymotion-j)
map <leader>fk <Plug>(easymotion-k)
map <leader>fl <Plug>(easymotion-lineforward)
map <leader>f. <Plug>(easymotion-repeat)
" useless: w b e ge, W B E gE


" vim-auto-popmenu
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'go':1, 'python':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b
" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect
" 禁止在下方显示一些啰嗦的提示
set shortmess+=c
" 常用命令：ApcEnable, ApcDisable，是否开启补全


" fzf
" let g:fzf_command_prefix = 'Fzf'
nmap <leader>pl  :Files<cr>
nmap <leader>pf  :GFiles<cr>
nmap <leader>psr :Lines<cr>
nmap <leader>bb  :Buffers<cr>
