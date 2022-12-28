"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title titlestring=Algorithm    " 设置窗口title"
let mapleader = " "      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示(响铃)
set visualbell t_vb=     " 关闭错误的提示(闪烁)
set nowrap               " 禁止折行
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set laststatus=1         " 仅当窗口多于一个时显示状态栏
set number               " 开启行号显示
set nocursorline         " 高亮显示当前行
set scrolloff=5          " 光标距底行最小距离
set wildmenu             " vim自身命名行模式智能补全
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab            " 将制表符扩展为空格
set shiftround           " 表示缩进列数对齐到 shiftwidth 值的整数倍
set autoindent           " 设置自动缩进
set smartindent          " 智能的选择对其方式
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set backspace=2          " 使用回车键正常处理indent,eol,start等
set fo=ro                " 新行自动添加注释

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autochdir           " 自动确定文件夹
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
set autoread            " 文件在vim之外修改过，自动重新读入
set splitright          " 在右侧分屏
set splitbelow          " 在下面分屏

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8            " 设置Vim内部使用的字符编码
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030  " 设置一个字符编码的列表，表示 Vim 自动检测文件编码时的备选字符编码列表
set termencoding=utf-8       " 设置终端使用的编码方式
set fileformats=unix,dos,mac " 设置参与自动检测换行符格式类型的备选列表
set langmenu=zh_CN.UTF-8
set helplang=cn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldlevel=99
set foldmethod=indent
set foldenable
set formatoptions-=tc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    " color murphy
    color paramount
    " color iceberg
    " color jellybeans
    set guifont=Consolas:h9.6
    winpos 1080 150
    set lines=23 columns=75
else
    color slate
    " color def8ult
    " let g:FrostTransparent = 0
    " let g:SnazzyTransparent = 1
    " hi Normal ctermfg=252 ctermbg=none
endif


