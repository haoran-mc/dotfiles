"----------------------------------------------------------------
" startify
let g:startify_custom_header = [
            \ '    _____                    _                 _       _                                ____                           _        _      ',
            \ '   |  ___|__  _ __ _ __ ___ (_)_ __   __ _    (_)_ __ | |_ ___      _ __ ___  _   _    |  _ \ _ __ ___  __ _ _ __ ___ | |_ __ _| | ___ ',
            \ '   | |_ / _ \| -__|  _   _ \| |  _ \ / _  |   | |  _ \| __/ _ \    |  _   _ \| | | |   | | | | -__/ _ \/ _  |  _   _ \| __/ _  | |/ _ \',
            \ '   |  _| (_) | |  | | | | | | | | | | (_| |   | | | | | || (_) |   | | | | | | |_| |   | |_| | | |  __/ (_| | | | | | | || (_| | |  __/',
            \ '   |_|  \___/|_|  |_| |_| |_|_|_| |_|\__. |   |_|_| |_|\__\___/    |_| |_| |_|\__. |   |____/|_|  \___|\__._|_| |_| |_|\__\__._|_|\___|',
            \ '                                     |___/                                    |___/                                                    ',
            \]
let g:startify_files_number = 15
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ ]
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_skiplist = ['.pdf', '.vimrc', '.markdown']


"----------------------------------------------------------------
" vim-airline
" let g:airline_theme='base16_dracula'
" let g:airline_theme='alduin'
" let g:airline_theme='base16'
let g:airline_theme='lucius'
" let g:airline_theme='soda'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_b = '%{strftime("%m/%d/%y - %H:%M")}'
let g:airline_section_c = '%{expand("%")}'


"----------------------------------------------------------------
" vim-airline
let g:spaceline_seperate_style = 'slant-cons'
let g:spaceline_colorscheme = 'space'


"----------------------------------------------------------------
" nerdcommenter
let g:NERDSpaceDelims = 1

" Unfortunately, <c-/> doesn't work.
nmap ,/ <plug>NERDCommenterToggle
vmap ,/ <plug>NERDCommenterToggle


"----------------------------------------------------------------
" Markdown-preview
let g:mkdp_page_title = '「${name}」'
nmap <M-p> <Plug>MarkdownPreview
nmap <M-q> <Plug>MarkdownPreviewStop


"----------------------------------------------------------------
" vim-table-mode
let g:table_mode_tableize_map = '<Leader>tOt'
" let g:table_mode_cell_text_object_i_map = 'k<Bar>'


"----------------------------------------------------------------
" undotree
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
    nmap <buffer> n <plug>UndotreeNextState
    nmap <buffer> p <plug>UndotreePreviousState
    nmap <buffer> N 5<plug>UndotreeNextState
    nmap <buffer> P 5<plug>UndotreePreviousState
endfunc


"----------------------------------------------------------------
" AutoFormat
nnoremap <c-a-\> :Autoformat<CR>
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']

" func! RunFormatAttach()
    " " exec "w" " 这2条命令是利用vim外部调用功能, 二选一
    " " exec "!astyle --mode=c --style=attach -k3 -n -p -S -U -W3 -xg -xW -y -Y %"
    " " -k3 指针标识 * & ^ 的位置
    " " -n 不要保留原始文件的备份。原始文件在格式化后会被清除。
    " " -p 操作符前后加空格
    " " -S switch 里的 case 都将缩进
    " " -U 删除括号里多余的空格 ( a + b ) -> (a + b)
    " " -W3 char& foo3 -> char &foo3
    " " -xg 逗号后加空格
    " " -xW 宏定义的缩进
    " " -y else 单行
    " " -Y 注释缩进
    " let g:formatdef_my_fmt = '"astyle --mode=c --style=attach -k3 -n -p -S -U -W3 -xg -xW -y -Y "'
    " silent exec "Autoformat"
" endfunc

" let g:formatters_c = ['my_fmt']
" let g:formatters_cpp = ['my_fmt']
" au filetype c :call RunFormatAttach()
" au filetype cpp :call RunFormatAttach()
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0


"----------------------------------------------------------------
" ctrlp
" let g:ctrlp_map = '<c-p>'
let g:ctrlp_map = '<leader>sp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


"----------------------------------------------------------------
" emmet-vim
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_expandabbr_key = '<c-k>'


"----------------------------------------------------------------
" vim-gitgutter
" <leader>hp preview hunks
" <leader>hs stage hunks
" <leader>hu undo hunks
let g:gitgutter_highlight_linenrs = 1


"----------------------------------------------------------------
" vim-floaterm
" let g:floaterm_keymap_new = '<Leader>tt'


"----------------------------------------------------------------
" vimwiki
nmap <Leader>wOw <Plug>VimwikiIndex
map \<CR>       <Plug>VimwikiFollowLink
map \<BS>       <Plug>VimwikiGoBackLink

let wiki_1 = {}
let wiki_1.path = '~/haoran/TheInterview/interview-go'
let wiki_1.index = 'README'
let wiki_1.syntax = 'markdown'
let wiki_1.ext =  '.md'

let wiki_2 = {}
let wiki_2.path = '~/haoran/Notes/Markdown'
let wiki_2.index = 'index'
let wiki_2.syntax = 'markdown'
let wiki_2.ext =  '.md'
let g:vimwiki_list = [wiki_1, wiki_2]


" | other plugs' settings |
call utils#source_file($VIM_PATH,'plug/nerdtree.vim')
" call utils#source_file($VIM_PATH,'plug/coc.vim')
call utils#source_file($VIM_PATH,'plug/whichkey.lua')
