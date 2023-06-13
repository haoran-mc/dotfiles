"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/autoload/plug.vim
call plug#begin('~/.vim/plugins')
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter' " tpope/vim-commentary
Plug 'ianva/vim-youdao-translater'
Plug 'easymotion/vim-easymotion'
Plug 'tibabit/vim-templates'
Plug 'preservim/tagbar'
" --- search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'
" --- markdown
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'vimwiki/vimwiki'
" --- coc
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'
call plug#end()

" :PlugInstall     - 安装插件
" :PlugClean       - 移除插件
" :plugStatus      - 插件状态

" NERDTree
let NERDTreeIgnore=['\.o$', '^\.git$', '_exe', '.vscode', '\.exe', '.DS_Store', '_exe', '\.orig', 'input.txt', 'output.txt' ]
let g:NERDTreeMinimalMenu=1
let g:NERDTreeShowHidden=1
let g:NERDTreeBookmarksFile='/Users/haoran/dotfiles/vim/plugins/nerdtree/.NERDTreeBookmarks'
let NERDTreeMapUpdirKeepOpen='-'  " dir up
let NERDTreeMapCWD='C'            " change dir
let NERDTreeMapOpenVSplit='v'     " vsplit
let NERDTreeMapPreviewVSplit='gv' " vsplit
let NERDTreeMapOpenSplit='s'      " split
let NERDTreeMapPreviewSplit='s'   " split


" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
nmap ,/ <plug>NERDCommenterToggle
vmap ,/ <plug>NERDCommenterToggle


" vim-easymotion
let g:EasyMotion_smartcase = 1


" fzf
let g:fzf_command_prefix='Fzf'


" template
let g:tmpl_search_paths=['~/dotfiles/vim/templates']



source ~/dotfiles/vim/plugins/tagbar/tagbar.vim
source ~/dotfiles/vim/plugins/coc/coc.vim
source ~/dotfiles/vim/plugins/vimwiki/vimwiki.vim
source ~/dotfiles/vim/plugins/vim-go/vim-go.vim



