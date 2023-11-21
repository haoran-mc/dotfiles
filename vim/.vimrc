"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title titlestring=vim    " 设置窗口title"
let mapleader = " "      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
set noeb                 " 关闭错误的提示（响铃）
set visualbell t_vb=     " 关闭错误的提示（闪烁）
set nowrap               " 禁止折行
set scrolloff=5          " 光标距底行最小距离
set wildmenu             " vim自身命名行模式智能补全
set mouse-=a             " 禁止使用鼠标
set clipboard=unnamed    " vim 剪切板
set shell=bash           " 使用 bash 作为默认 shell 环境
set history=1000         " 保存历史命令行数
set ttyfast              " 快速滚动
set winaltkeys=no        " windows 禁用 ALT 操作菜单（使得 ALT 可以用到 vim 里）

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab            " 将制表符扩展为空格
set shiftround           " 表示缩进列数对齐到 shiftwidth 值的整数倍
set autoindent           " 设置自动缩进
set cindent              " 打开 C/C++ 语言缩进优化
set smartindent          " 智能的选择对其方式
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set backspace=2          " 使用回车键正常处理indent,eol,start等
set fo=ro                " 新行自动添加注释

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
set smartcase           " 智能大小写
exec "nohlsearch"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set nowritebackup       " 设置不备份
set noswapfile          " 禁止生成临时文件
set undofile            " 重新打开一个文件，可以撤销上一次编辑的操作
set autowrite           " 自动保存
set autoread            " 文件在vim之外修改过，自动重新读入
set splitright          " 在右侧分屏
set splitbelow          " 在下面分屏
set backupdir=~/.vim/.backup//  " 结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。  
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo// 
set hidden              " 切换 buffer 时，前一个编辑的文件保留在后台
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300
set timeoutlen=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8       " 内部工作编码
set fileencoding=utf-8   " 文件默认编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1 " 打开文件时自动尝试下面顺序的编码
set termencoding=utf-8       " 设置终端使用的编码方式
set fileformats=unix,dos,mac " 文本格式优先选择 unix
set langmenu=en_US.UTF-8  " zh_CN.UTF-8
" language en_US

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldlevel=99
set foldmethod=indent
set foldenable
set formatoptions-=tc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim的文件管理器
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autochdir                         " 自动确定文件夹
let g:netrw_hide = 1                  " 隐藏 dotfile
let g:netrw_liststyle = 1             " 增加时间戳等详细信息
let g:netrw_banner = 0                " 不显示默认的“横幅”显示
let g:netrw_liststyle=3               " 使用树状模式
" 控制打开文件的窗口位置
" 0 - 覆盖目录
" 1 - 水平分裂
" 2 - 垂直分裂
" 3 - 新 tab 中打开
" 4 - 新开窗口覆盖原先窗口
let g:netrw_browse_split = 4
let g:netrw_winsize = 31              " netrw 的宽度
let g:netrw_altv = 1                  " 默认右侧分裂窗口显示
let g:netrw_chgwin = 2
let g:netrw_list_hide = '.*\.swp$'    " 隐藏文件
let g:netrw_localrmdir = 'rm -rf'     " 使用 rm -rf 执行 vim 中 D 的删除

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                " 自动语法高亮
" 文本格式化选项
" t：根据 textwidth 自动折行
" c：在（程序源代码中的）注释中自动折行，插入合适的注释起始字符
" r：插入模式下在注释中键入回车时，插入合适的注释起始字符
" q：允许使用“gq”命令对注释进行格式化
" o: 如果当前有注释，用O，o时自动插入注释
" w: 尾部白色空格代表下一行继续，非白色表示一个段落的结尾
set formatoptions+=tcrqw
set formatoptions-=o
filetype on          " 开启文件识别
filetype indent on   " 自适应不同语言的智能缩进
filetype plugin on   " 设置加载对应文件类型的插件

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题、界面、GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI        " 关闭欢迎页面
set laststatus=2         " 仅当窗口多于一个时显示状态栏
set cmdheight=1          " 命令行的高度
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set listchars=trail:■
" set listchars=tab:»■,trail:■  " 显示行尾空格
" set list                 " 显示非可见字符 ^I
" set signcolumn=yes

if has("gui_running")
    set background=dark
    color jellybeans
    " set guifont='Operator\ Mono':h9.6
    " winpos 1080 150
    " set lines=40 columns=110
else
    " color elflord
	color snazzy
	" let g:SnazzyTransparent = 1
endif

set background=dark             " 设置背景颜色黑色
set t_Co=256                    " 终端 256 色

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set background=dark

set statusline=
set statusline+=\ %n
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
set statusline+=%=
set statusline+=\ ‹‹
set statusline+=\ %l:%c
set statusline+=\ ::
set statusline+=\ %{strftime('%R',\ getftime(expand('%')))}
set statusline+=\ ››\ %*
 
if has("gui_running")
    set transparency=20
endif

set guicursor=n:block-blinkoff0,i:block-iCursor-blinkoff0,v:block-blinkoff0
" highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=red

hi TabLineSel term=inverse
hi TabLineSel ctermfg=red ctermbg=Black
hi TabLineSel gui=none guifg=red guibg=Black

set tabline=%!TabLine()
function TabLine()
    let TabStyle = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let TabStyle .= '%#TabLineSel#'
        else
            let TabStyle .= '%#TabLine#'
        endif
        let TabStyle .= ' %{ShortTabLabel(' . (i + 1) . ')} '
    endfor
    let TabStyle .= '%##'
    return TabStyle
endfunction

function ShortTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let label = bufname (buflist[tabpagewinnr (a:n) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:ab NNN NEXTLINE
:ab dfs DFS
:ab bfs BFS
:ab inf INF
:ab llinf LLINF
:ab pi PI
:ab pii PII
:ab piii PIII
:ab mod MOD

nmap <F9> <leader>cf:call RunInTerm()<CR>

func! RunInTerm()
	if &filetype == 'c'
		exec "!gcc % -o _exe"
		exec "term ./_exe"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'cpp'
		exec "!g++ % -o _exe"
		exec "term ./_exe"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'python'
		echo " compiling..."
		exec "term python3 %"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	elseif &filetype == 'go'
		echo " compiling..."
		exec "term go run %"
		redraw!
		echohl WarningMsg | echo " Running finish! ^_^"
	else
		redraw!
		echo "language not support! -_-"
	endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动记住上次位置
autocmd BufReadPost *
    \ if line("'\"")>0&&line("'\"")<=line("$") |
    \   exe "normal g'\"" |
    \ endif

" markdown
autocmd Filetype markdown set wrap
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk

" golang
" autocmd FileType go nmap <leader>cf :silent ! ~/go/bin/goimports -w %<cr>
autocmd FileType go :set tabstop=4 noexpandtab " Do not use spaces instead of tabs
" go build -o _exe -gcflags "-N -l" main.go
" gdb -tui _exe
" autocmd BufNewFile go :TemplateInit()

" c/cpp
" autocmd FileType c,cpp nmap <leader>cf :silent ! astyle --style=attach --pad-oper --lineend=linux %<cr>
autocmd FileType c,cpp :set shiftwidth=4 expandtab

autocmd FileType lua :set shiftwidth=4
autocmd FileType sh :set shiftwidth=2 expandtab
autocmd FileType python :set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml :set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/autoload/plug.vim
call plug#begin('~/.vim/plugins')
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter' " tpope/vim-commentary
Plug 'ianva/vim-youdao-translater'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'
" --- search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lfv89/vim-interestingwords' " <leader>k
Plug 'itchyny/vim-cursorword' " 单词下划线
" --- markdown
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'vimwiki/vimwiki'
" --- coc
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
let g:fzf_command_prefix='Fzf'

" template
" let g:tmpl_search_paths=['~/dotfiles/vim/templates']

" source ~/dotfiles/vim/plugins/tagbar.vim
" source ~/dotfiles/vim/plugins/vimwiki.vim
" source ~/dotfiles/vim/plugins/coc/coc.vim
" source ~/dotfiles/vim/plugins/vim-go/vim-go.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap {<cr> {<cr>}<esc>O
nmap <leader>0 i<Space><C-c>la<Space><C-c>h
" nmap <leader>rc :e ~/dotfiles/vim/init.vim<cr>
nmap <leader>rc :e ~/dotfiles/vim/.vimrc<cr>
nmap <leader>ut :e ~/haoran/tr/vim/test.go<cr>
tmap <leader>us :so ~/.vimrc<cr>
nmap <leader>1 :nohlsearch<cr>
nmap <leader><tab> :e#<cr>
" nmap <leader><leader> <esc>/<++><cr>:nohlsearch<cr>c4l
" nmap <leader>ft :Vex<cr>

nmap <leader>wc :q<cr>
nmap <leader>wv :vsp<cr>
nmap <leader>ws :sp<cr>
nmap <leader>wh <c-w><c-h>
nmap <leader>wj <c-w><c-j>
nmap <leader>wk <c-w><c-k>
nmap <leader>wl <c-w><c-l>
nmap <leader>wx <c-w><c-x>
nmap <leader>w= <c-w>=
nmap <leader>wH <c-w>H
nmap <leader>wK <c-w>K

nmap <leader>tn :tabnew<cr>

nmap <c-h> :vertical resize -2<cr>
nmap <c-l> :vertical resize +2<cr>
nmap <c-j> :resize +2<cr>
nmap <c-k> :resize -2<cr>

nmap <leader>ot :term<cr>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

" 修复 ctags ctrl+] 无效问题
nmap <c-]> g<c-]>

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
nmap <leader>ff  :FzfFiles<cr>
nmap <leader>fg  :FzfGFiles<cr>
nmap <leader>fl  :FzfLines<cr>
nmap <leader>fb  :FzfBuffers<cr>
nmap <leader>fr  :FzfHistory<cr>

" markdown, 写命令吧
" nmap <leader>mp :MarkdownPreview<cr>
" nmap <leader>mt :TableModeToggle<cr>

" tagbar
nmap <leader>tb :TagbarToggle<cr>

" vimwiki
let g:vimwiki_map_prefix = '<Leader>e'
nmap <leader>ew  <Plug>VimwikiUISelect

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/init-extend.vim
