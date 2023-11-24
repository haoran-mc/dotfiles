"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title titlestring=macvim    " 设置窗口title"
let mapleader = "\<space>"      " 定义<leader>键
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
set updatetime=300
set timeoutlen=500

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
color snazzy
let g:SnazzyTransparent = 1
set background=dark             " 设置背景颜色黑色
set t_Co=256                    " 终端 256 色

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 模块加载
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 将 vim 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim


source ~/dotfiles/vim/init-style.vim
source ~/dotfiles/vim/init-code.vim
source ~/dotfiles/vim/init-autocmd.vim
source ~/dotfiles/vim/init-plugins.vim

if has("gui_running")
    source ~/dotfiles/vim/init-gui.vim
endif

source ~/dotfiles/vim/init-style.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<cr> {<cr>}<esc>O
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-n> <down>
inoremap <c-p> <up>
inoremap <c-_> <c-k>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
inoremap <c-n> <down>
inoremap <c-p> <up>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/init-extend.vim
