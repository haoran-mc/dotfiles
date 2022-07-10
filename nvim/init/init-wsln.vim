"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title titlestring=ACM " 设置窗口title"
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
" 方便编程
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
inoremap {<CR> {<CR>}<ESC>O
nnoremap <leader>0 i<Space><C-c>la<Space><C-c>h
nnoremap <leader>rz :r!cat /home/haoran/haoran/Code/NEXTLINE/wiki/01-语言基础/01-封装/00-头文件.cpp<CR>gg:w<CR>
nnoremap <leader>rZ :e /home/haoran/haoran/Code/NEXTLINE/wiki/01-语言基础/01-封装/00-头文件.cpp<CR>
nnoremap <leader>rl :r!cat /home/haoran/haoran/Code/NEXTLINE/misc/08-prog/14-LeetCode.cpp<CR>ggdd:w<CR>

nnoremap <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color distinguished
" source ~/.config/nvim/colors/frost.vim
" color frost
color hybrid
" color distinguished
" let g:FrostTransparent = 1
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
set statusline+=\ %{strftime('%R',\ getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %p
set statusline+=\ ››\ %*

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
" 文件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on          " 开启文件识别
filetype indent on   " 自适应不同语言的智能缩进
filetype plugin on   " 设置加载对应文件类型的插件
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd Filetype markdown set wrap
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk
autocmd FileType html   set tabstop=2
autocmd Filetype python set textwidth=79

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype cpp nmap <leader><tab>h :call CppSetTitle()<CR>
func CppSetTitle()
    call setline(1,          "/*----------------------------------------------------------------")
    call append(line("."),   " *   ")
    call append(line(".")+1, " *   文件名称：".expand("%:t"))
    call append(line(".")+2, " *   创建日期：".strftime("%Y年%m月%d日 %A %H时%M分%S秒"))
    call append(line(".")+3, " *   题    目：<++>")
    call append(line(".")+4, " *   算    法：<++>")
    call append(line(".")+5, " *   描    述：<++>")
    call append(line(".")+6, " *")
    call append(line(".")+7, " ----------------------------------------------------------------*/")
    call append(line(".")+8, "")
endfunc

autocmd filetype cpp map <leader><tab>j :call CppSetEnding()<CR>
func CppSetEnding()
    call append(line(".")+3,   " *   结束日期：".strftime("%Y年%m月%d日 %A %H时%M分%S秒"))
endfunc

autocmd filetype cpp nmap <leader><tab>k :call CppFirstBlood()<CR>
func CppFirstBlood()
    call append(line(".")+1, " * •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••")
    call append(line(".")+2, " *")
endfunc

autocmd filetype python nmap <leader><tab>b :call PySetTitle()<CR>
func PySetTitle()
    call setline(1,          "#----------------------------------------------------------------")
    call append(line("."),   "#   ")
    call append(line(".")+1, "#   文件名称：".expand("%:t"))
    call append(line(".")+2, "#   创建日期：".strftime("%Y年%m月%d日 %A %H时%M分%S秒"))
    call append(line(".")+3, "#   题    目：<++>")
    call append(line(".")+4, "#   算    法：<++>")
    call append(line(".")+5, "#   描    述：<++>")
    call append(line(".")+6, "#")
    call append(line(".")+7, "#---------------------------------------------------------------*/")
    call append(line(".")+8, "")
endfunc

autocmd filetype python map <leader><tab>n :call PySetEnding()<CR>
func PySetEnding()
    call append(line(".")+3,   "#   结束日期：".strftime("%Y年%m月%d日 %A %H时%M分%S秒"))
endfunc

autocmd filetype python nmap <leader><tab>m :call PyFirstBlood()<CR>
func PyFirstBlood()
    call append(line(".")+1, "# •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••")
    call append(line(".")+2, "#")
endfunc

nmap <F9> :call Run()<CR>
func! Run()
    if &filetype == 'c'
        echo " compiling..."
        exec '!gcc % -o o-o'
        exec '! ./o-o'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'cpp'
        echo " compiling..."
        exec '!g++ % -o .ogmc'
        exec '! ./.ogmc'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'python'
        exec '!python3 %'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'scheme'
        " exec '!scheme --load %'
        exec '!scheme %'
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    elseif &filetype == 'go'
        exec "!go run %"
        redraw!
        echohl WarningMsg | echo " Running finish! ^_^"
    else
        redraw!
        echo "Language not support! -_-"
    endif
endfunc

nnoremap ta :call DeleteHiddenBuffers()<CR>
function DeleteHiddenBuffers()
    NERDTreeClose
    NERDTreeToggle
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
    NERDTreeToggle
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/autoload/plug.vim
call plug#begin('~/.nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'Chiel92/vim-autoformat'


Plug 'tpope/vim-surround'  " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'ianva/vim-youdao-translater'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'    " with the help of third party FZF
Plug 'yegappan/mru'        " recent files，can be used in conjunction with FZF
Plug 'mtth/scratch.vim'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'RRethy/vim-hexokinase'      " display color
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'   " auto rename tag name
Plug 'folke/which-key.nvim'
Plug 'kshenoy/vim-signature'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----------------------------------------------------------------
" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.o$', '^\.git$', 'o-o', '_exe', '.vscode', '\.ogmc']

"----------------------------------------------------------------
" nerdcommenter
let g:NERDSpaceDelims = 1
nmap ,/ <plug>NERDCommenterToggle
vmap ,/ <plug>NERDCommenterToggle

"----------------------------------------------------------------
" vim-autoformat
func! RunFormatAttach()
    " exec "w" " 这2条命令是利用vim外部调用功能, 二选一
    " exec "!astyle --mode=c --style=attach -k3 -n -p -S -U -W3 -xg -xW -y -Y %"
    " -k3 指针标识 * & ^ 的位置
    " -n 不要保留原始文件的备份。原始文件在格式化后会被清除。
    " -p 操作符前后加空格
    " -S switch 里的 case 都将缩进
    " -U 删除括号里多余的空格 ( a + b ) -> (a + b)
    " -W3 char& foo3 -> char &foo3
    " -xg 逗号后加空格
    " -xW 宏定义的缩进
    " -y else 单行
    " -Y 注释缩进
    let g:formatdef_my_fmt = '"astyle --mode=c --style=attach -k3 -n -p -S -U -W3 -xg -xW -y -Y "'
    silent exec "Autoformat"
endfunc

let g:formatters_c = ['my_fmt']
let g:formatters_cpp = ['my_fmt']
autocmd FileType c,cpp autocmd BufWritePre * :call RunFormatAttach()
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>rc :e ~/.config/nvim/init/init-wsln.vim<CR>
nnoremap <leader><CR> :nohlsearch<CR>
nnoremap <leader>mt :TableModeToggle<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <C-\> :Autoformat<CR>
nnoremap <leader>nw :NERDTree ~/haoran/Code/NEXTLINE<CR>
nnoremap <leader>ng :NERDTree ~/haoran/Code/Language/15-Go<CR>
nnoremap <leader>nm :NERDTree ~/haoran/editing/Markdown<CR>
nnoremap <leader>op :!typora % &<CR>
call utils#source_file($VIM_PATH,'init/init-plug.vim')
call utils#source_file($VIM_PATH,'plug/whichkey.lua')
