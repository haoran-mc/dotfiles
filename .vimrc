" remote vim configuration

" 通用设置
let mapleader = " "      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
set noeb                 " 关闭错误的提示（响铃）
set visualbell t_vb=     " 关闭错误的提示（闪烁）
set nowrap               " 禁止折行
set scrolloff=5          " 光标距底行最小距离
set wildmenu             " vim自身命名行模式智能补全
set clipboard=unnamed    " vim 剪切板
set shell=bash           " 使用 bash 作为默认 shell 环境
set history=1000         " 保存历史命令行数

" 代码缩进和排版
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

" 搜索设置
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
set smartcase           " 智能大小写
exec "nohlsearch"

" 缓存设置
set nobackup            " 设置不备份
set nowritebackup       " 保存时备份
set noswapfile          " 禁用交换文件
set noundofile          " 重新打开一个文件，可以撤销上一次编辑的操作
set autowrite           " 自动保存
set autoread            " 文件在vim之外修改过，自动重新读入
set splitright          " 在右侧分屏
set splitbelow          " 在下面分屏
set updatetime=300
set timeoutlen=500

" 编码设置
set encoding=utf-8       " 内部工作编码
set fileencoding=utf-8   " 文件默认编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1 " 打开文件时自动尝试下面顺序的编码
set termencoding=utf-8       " 设置终端使用的编码方式
set fileformats=unix,dos,mac " 文件换行符优先选择 unix
set langmenu=en_US.UTF-8  " zh_CN.UTF-8

" 折叠
set foldlevel=99
set foldmethod=indent
set foldenable

" vim的文件管理器
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

" 文件配置
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

" 主题、界面、GUI
set shortmess=atI        " 关闭欢迎页面
set laststatus=2         " 仅当窗口多于一个时显示状态栏
set cmdheight=1          " 命令行的高度
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set listchars=trail:■
color slate

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

" autocmd
" 自动记住上次位置
autocmd BufReadPost *
    \ if line("'\"")>0&&line("'\"")<=line("$") |
    \   exe "normal g'\"" |
    \ endif

" markdown
autocmd Filetype markdown set wrap
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk

" keys
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
nmap <leader>rc :e ~/.vimrc<cr>
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

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv
