"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title titlestring=macvim    " 设置窗口title"
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
set autochdir                         " 自动确定文件夹

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
set nowritebackup       " 保存时备份
set noswapfile          " 禁用交换文件
set noundofile          " 重新打开一个文件，可以撤销上一次编辑的操作
set autowrite           " 自动保存
set autoread            " 文件在vim之外修改过，自动重新读入
set splitright          " 在右侧分屏
set splitbelow          " 在下面分屏
set backupext=.bak      " 备份文件扩展名
set backupdir=~/.vim/.backup//  " 结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo// 
set hidden              " 切换 buffer 时，前一个编辑的文件保留在后台
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=30
set timeoutlen=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8       " 内部工作编码
set fileencoding=utf-8   " 文件默认编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1 " 打开文件时自动尝试下面顺序的编码
set termencoding=utf-8       " 设置终端使用的编码方式
set fileformats=unix,dos,mac " 文件换行符优先选择 unix
set langmenu=en_US.UTF-8  " zh_CN.UTF-8
" language en_US

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldlevel=99
set foldmethod=indent
set foldenable

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
" 文件搜索和补全时忽略下面扩展名
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

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
    winpos 1080 130
    set lines=65 columns=180
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
Plug 'preservim/nerdtree'      " vim-dirvish
Plug 'preservim/nerdcommenter' " tpope/vim-commentary
Plug 'ianva/vim-youdao-translater'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
" Plug 'Raimondi/delimitMate'  " 配对括号和引号自动补全
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<cr> {<cr>}<esc>O
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>

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
nmap <leader>wm :only<cr>
nmap <leader>wh <c-w><c-h>
nmap <leader>wj <c-w><c-j>
nmap <leader>wk <c-w><c-k>
nmap <leader>wl <c-w><c-l>
nmap <leader>wx <c-w><c-x>
nmap <leader>w= <c-w>=
nmap <leader>wH <c-w>H
nmap <leader>wK <c-w>K

nmap <c-h> :vertical resize -2<cr>
nmap <c-l> :vertical resize +2<cr>
nmap <c-j> :resize +2<cr>
nmap <c-k> :resize -2<cr>

nmap <leader>ot :term<cr>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

" tab
noremap <silent> <leader>tn :tabnew<cr>
noremap <silent> <leader>tc :tabclose<cr>
noremap <silent> <leader>to :tabonly<cr>
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>

" MacVim 允许 CMD+数字键快速切换标签
if has("gui_macvim")
	set macmeta
	noremap <silent><d-1> :tabn 1<cr>
	noremap <silent><d-2> :tabn 2<cr>
	noremap <silent><d-3> :tabn 3<cr>
	noremap <silent><d-4> :tabn 4<cr>
	noremap <silent><d-5> :tabn 5<cr>
	noremap <silent><d-6> :tabn 6<cr>
	noremap <silent><d-7> :tabn 7<cr>
	noremap <silent><d-8> :tabn 8<cr>
	noremap <silent><d-9> :tabn 9<cr>
	noremap <silent><d-0> :tabn 10<cr>
	inoremap <silent><d-1> <ESC>:tabn 1<cr>
	inoremap <silent><d-2> <ESC>:tabn 2<cr>
	inoremap <silent><d-3> <ESC>:tabn 3<cr>
	inoremap <silent><d-4> <ESC>:tabn 4<cr>
	inoremap <silent><d-5> <ESC>:tabn 5<cr>
	inoremap <silent><d-6> <ESC>:tabn 6<cr>
	inoremap <silent><d-7> <ESC>:tabn 7<cr>
	inoremap <silent><d-8> <ESC>:tabn 8<cr>
	inoremap <silent><d-9> <ESC>:tabn 9<cr>
	inoremap <silent><d-0> <ESC>:tabn 10<cr>
endif
noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>

" 左移 tab
function! Tab_MoveLeft()
	let l:tabnr = tabpagenr() - 2
	if l:tabnr >= 0
		exec 'tabmove '.l:tabnr
	endif
endfunc

" 右移 tab
function! Tab_MoveRight()
	let l:tabnr = tabpagenr() + 1
	if l:tabnr <= tabpagenr('$')
		exec 'tabmove '.l:tabnr
	endif
endfunc

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
nmap <leader>fg  :FlyGrep<cr>
nmap <leader>fs  :CtrlSF<cr>
nmap <leader>fl  :FzfLines<cr>
nmap <leader>fb  :FzfBuffers<cr>
nmap <leader>fr  :FzfHistory<cr>

" markdown, 写命令吧
" nmap <leader>mp :MarkdownPreview<cr>
" nmap <leader>mt :TableModeToggle<cr>

" vimwiki
let g:vimwiki_map_prefix = '<Leader>e'
nmap <leader>ew  <Plug>VimwikiUISelect

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/init-extend.vim
