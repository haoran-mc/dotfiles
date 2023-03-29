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
" --- markdown
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'vimwiki/vimwiki'
" --- coc
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'
call plug#end()

" :PlugInstall     - 安装插件
" :PlugClean       - 移除插件
" :plugStatus      - 插件状态

nmap <leader>af :Ydc<cr>

" NERDTree
nmap <leader>ft  :NERDTreeToggle<cr>
nmap <leader>fo  :NERDTreeFind<cr>
nmap <leader>fm  :NERDTreeFromBookmark 
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
" bidirectional word
" pay attention! no chars at the end of map
nmap <leader>fw <Plug>(easymotion-bd-w)
nmap <leader>fj <Plug>(easymotion-j)
nmap <leader>fk <Plug>(easymotion-k)
nmap <leader>f. <Plug>(easymotion-repeat)
nmap <leader>fa <Plug>(easymotion-overwin-w)
" useless: w b e ge, W B E gE


" fzf
let g:fzf_command_prefix='Fzf'
nmap <leader>ff  :FzfFiles<cr>
nmap <leader>fg  :FzfGFiles<cr>
nmap <leader>fl  :FzfLines<cr>
nmap <leader>fb  :FzfBuffers<cr>
nmap <leader>fr  :FzfHistory<cr>

" markdown
nmap <leader>mp :MarkdownPreview<cr>
nmap <leader>mt :TableModeToggle<cr>


" template
nmap <leader>ti :TemplateInit<cr>
nmap <leader>tr :r ~/haoran/co/algo/misc/08-prog/17-leetcode-template.go<cr>
let g:tmpl_search_paths=['~/dotfiles/vim/templates']






source ~/dotfiles/vim/plugins/tagbar/tagbar.vim
source ~/dotfiles/vim/plugins/coc/coc.vim
source ~/dotfiles/vim/plugins/vimwiki/vimwiki.vim



