source ~/dotfiles/vim/autoload/plug.vim
call plug#begin('~/.vim/plugins')
Plug 'preservim/nerdtree'      " vim-dirvish
Plug 'preservim/nerdcommenter' " tpope/vim-commentary
Plug 'ianva/vim-youdao-translater'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
" Plug 'Raimondi/delimitMate'  " 配对括号和引号自动补全
Plug 'terryma/vim-multiple-cursors'
" --- search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wsdjeg/FlyGrep.vim' " 使用 :FlyGrep 命令进行实时 grep
Plug 'dyng/ctrlsf.vim'    " 使用 :CtrlSF 命令进行模仿 sublime 的 grep
Plug 'lfv89/vim-interestingwords' " <leader>k
" Plug 'itchyny/vim-cursorword' " 单词下划线
" --- markdown
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'vimwiki/vimwiki'
" --- coc
Plug 'asins/vim-dict'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'honza/vim-snippets'
" Plug 'tibabit/vim-templates'
call plug#end()

" :PlugInstall     - 安装插件
" :PlugClean       - 移除插件
" :plugStatus      - 插件状态

" NERDTree
let NERDTreeIgnore=['\.o$', '^\.git$', '_exe', '.vscode', '\.exe', '.DS_Store', '_exe', '\.orig', 'input.txt', 'output.txt' ]
let g:NERDTreeMinimalMenu=1
let g:NERDTreeShowHidden=1
let g:NERDTreeBookmarksFile='/Users/haoran/dotfiles/vim/plugins/NERDTreeBookmarks'
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
let g:fzf_command_prefix = 'Fzf'
" flygrep
let g:FlyGrep_input_delay = 50

" vim-expand-region
map <m-=> <Plug>(expand_region_expand)
map <m--> <Plug>(expand_region_shrink)

" template
" let g:tmpl_search_paths=['~/dotfiles/vim/templates']

" source ~/dotfiles/vim/plugins/vimwiki.vim
" source ~/dotfiles/vim/plugins/coc/coc.vim
" source ~/dotfiles/vim/plugins/vim-go/vim-go.vim


nmap <leader>af :Ydc<cr>

" NERDTree
nmap <leader>ft  :NERDTreeToggle<cr>
nmap <leader>fo  :NERDTreeFind<cr>
nmap <leader>fm  :NERDTreeFromBookmark 

" easymotion
" bidirectional word
" pay attention! no chars at the end of map
nmap <leader>fw <Plug>(easymotion-bd-w)
nmap <leader>fj <Plug>(easymotion-j)
nmap <leader>fk <Plug>(easymotion-k)
nmap <leader>f. <Plug>(easymotion-repeat)
nmap <leader>fa <Plug>(easymotion-overwin-w)
" useless: w b e ge, W B E gE

" fzf
nmap <leader>ff  :FzfGFiles<cr>
nmap <leader>fg  :FlyGrep<cr>
nmap <leader>fs  :CtrlSFToggle<cr>
nmap <leader>fl  :FzfLines<cr>
nmap <leader>fb  :FzfBuffers<cr>
nmap <leader>fr  :FzfHistory<cr>

" markdown, 写命令吧
" nmap <leader>mp :MarkdownPreview<cr>
" nmap <leader>mt :TableModeToggle<cr>

" vimwiki
" let g:vimwiki_map_prefix = '<Leader>e'
" nmap <leader>ew  <Plug>VimwikiUISelect

" vim-expand-region
vmap K <Plug>(expand_region_expand)
vmap J <Plug>(expand_region_shrink)

" vim-multiple-cursor
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
