"===================== Start of Plugin Settings =====================

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
" let g:startify_custom_footer = [
            " \ ' ',
            " \ ' ',
            " \ ' ',
            " \ ' ',
            " \ ' ',
            " \ '                                                                                                                                                               ___  _ __ __ _ _ __   __ _  ___ ',
            " \ '                                                                                                                                                              / _ \| -__/ _  |  _ \ / _  |/ _ \',
            " \ '                                                                                                                                                             | (_) | | | (_| | | | | (_| |  __/',
            " \ '                                                                                                                                                              \___/|_|  \__._|_| |_|\__. |\___|',
            " \ '                                                                                                                                                                                    |___/      ',
            " \]
let g:startify_files_number = 10
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ ]
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_bookmarks = [
            \ '~/haoran/Draft/+one.txt',
            \ '~/haoran/editing/Programming/ACM-WORD.md',
            \ '~/haoran/editing/typora/Enlish/sameMeaning.md',
            \ '~/haoran/editing/typora/Enlish/sameMeaningPlus.md',
            \ '~/haoran/editing/typora/Enlish/sameShape.md',
            \ '~/haoran/work/editor/vim/__chuckle/key.pdf',
            \]
let g:startify_skiplist = [
            \ '.pdf',
            \ '.vimrc',
            \ '.markdown',
            \ ]

"----------------------------------------------------------------
" NERDTree
let NERDTreeShowBookmarks = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let g:NERDTreeShowHidden = 1
"autocmd vimenter * NERDTree
let NERDTreeIgnore=[ '\.exe$', '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store',
            \ '\--haoran', '_exe', '.vscode', 'class']
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✗",
            \ "Dirty"     : "✖",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

"----------------------------------------------------------------
" vim-airline
"let g:airline_theme='alduin'
" let g:airline_theme='peaksea'
let g:airline_theme='dracula'
" let g:airline_theme='owo'
"let g:airline_theme='soda'
" let g:airline_theme='monochrome'
" let g:airline_theme='fruit_punch'
" let g:airline_theme='molokai'
" let g:airline_theme='lucius'
" let g:airline_theme='bubblegum'
" let g:airline_theme='seoul256'
"let g:airline_theme='base16'
" let g:airline_theme='base16_spacemacs'
" let g:airline_theme='cobalt2'
" let g:airline_theme='hybrid'
" let g:airline_theme='onedark'
" let g:airline_theme='raven'
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
" ALE
"始终开启标志列
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚡'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '❌'
let g:ale_echo_msg_warning_str = '🔰'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"cpp NOT C++
let g:ale_linters = {
            \   'cpp': ['gcc'],
            \   'c': ['gcc'],
            \   'python': ['flake8'],
            \   'html': ['tidy'],
            \   'css': ['stylelint'],
            \   'javascript': ['eslint'],
            \}

"----------------------------------------------------------------
" nerdcommenter
let g:NERDSpaceDelims = 1
"   [count]<leader>cc |NERDCommenterComment|
"append
"
"   [count]<leader>cn |NERDCommenterNested|
"Same as cc but forces nesting.
"
"   [count]<leader>cy |NERDCommenterYank|
"Same as cc except that the commented line(s) are yanked first.
"/*----*/
"----
"
"   [count]<leader>c<space> |NERDCommenterToggle|
"auto
"
"   [count]<leader>cm |NERDCommenterMinimal|
"/*----*/
"
"   [count]<leader>ci |NERDCommenterInvert|
"Toggles the comment state of **the selected** line(s) individually.
"
"   [count]<leader>cs |NERDCommenterSexy|
"/*
" *
" */
"
"   <leader>c$ |NERDCommenterToEOL|
"Comments the current line from the cursor to the end of line.
"using na/*nespace std;*/
"
"   <leader>cA |NERDCommenterAppend|
"Adds comment delimiters to the end of line and goes into insert mode between them.
"using namespace std; //----
"
"   <leader>ca |NERDCommenterAltDelims|
"change, Switches to the alternative set of delimiters.
"
"   [count]<leader>cl |NERDCommenterAlignLeft |NERDCommenterAlignBoth[count]<leader>cb
"Same as |NERDCommenterComment| except that the delimiters are aligned down the left side () or both sides ().
"/*[>----<]*/
"
"   [count]<leader>cu |NERDCommenterUncomment|
"cancel, Uncomments the selected line(s).
"

"----------------------------------------------------------------
" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"----------------------------------------------------------------
" emmet
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"----------------------------------------------------------------
" javascript
let javascript_enable_domhtmlcss = 1

"----------------------------------------------------------------
" vim-go
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

"----------------------------------------------------------------
" vim-markdown-preview
"let g:mkdp_markdown_css = '~/.config/nvim/bin/markdown-theme/haoran_dark2.css'
let g:mkdp_page_title = '「${name}」'

"----------------------------------------------------------------
" vim-table-mode
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

"----------------------------------------------------------------
" vim-markdown-toc
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

"----------------------------------------------------------------
" Bullets.vim
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]

"----------------------------------------------------------------
" auto-pire


"----------------------------------------------------------------
" vim-multiple-cursor
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key = '<c-k>'
"let g:multi_cursor_select_all_word_key = '<a-k>'
"let g:multi_cursor_start_key = 'g<c-k>'
"let g:multi_cursor_select_all_key = 'g<a-k>'
"let g:multi_cursor_next_key = '<c-k>'
"let g:multi_cursor_prev_key = '<c-p>'
"let g:multi_cursor_skip_key = '<C-s>'
"let g:multi_cursor_quit_key = '<Esc>'

"----------------------------------------------------------------
" vim-visual-multi
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': '?', 'visual': '?', 'buffer': '?'}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'k': 'h', 'l': 'u', 'i': 'n', 'f': 'y', 'J': '0', 'L': '$', 'h': 'k'}
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-j>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'

"----------------------------------------------------------------
" tcomment_vim
"let g:tcomment_textobject_inlinecomment = ''
"nmap <LEADER>cn g>c
"vmap <LEADER>cn g>
"nmap <LEADER>cu g<c
"vmap <LEADER>cu g<

"----------------------------------------------------------------
" vim-after-object
"autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

"----------------------------------------------------------------
" xtabline
"let g:xtabline_settings = {}
"let g:xtabline_settings.enable_mappings = 0
"let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
"let g:xtabline_settings.enable_persistance = 0
"let g:xtabline_settings.last_open_first = 1
"noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>

"----------------------------------------------------------------
" vim-easymotion
let g:EasyMotion_do_mapping  = 0
let g:EasyMotion_do_shade    = 0
let g:EasyMotion_smartcase   = 1
let g:EasyMotion_startofline = 0
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

"----------------------------------------------------------------
" NrrwRgn
let g:nrrw_rgn_nomap_Nr = 1

"----------------------------------------------------------------
" FZF
"set rtp+=/usr/local/opt/fzr
"set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
"set rtp+=/home/kiteab/.linuxbrew/opt/fzf
"noremap <silent> <C-f> :Rg<CR>
"noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
"noremap <silent> <C-l> :Lines<CR>
"noremap <silent> <C-w> :Buffers<CR>
"noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

"command! BD call fzf#run(fzf#wrap({
            "\ 'source': s:list_buffers(),
            "\ 'sink*': { lines -> s:delete_buffers(lines) },
            "\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
            "\ }))

"noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

"----------------------------------------------------------------
" Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
            \   '<C-j>': ['<C-n>'],
            \   '<C-k>': ['<C-p>'],
            \   '<C-]>': ['<C-l>'],
            \   '<C-p>': ['<C-h>'],
            \   '<C-T>': ['<C-t>'],
            \   '<C-Down>': ['<C-j>'],
            \   '<C-Up>': ['<C-k>'],
            \}
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh','_exe'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','--haoran']
            \}

"----------------------------------------------------------------
" rnvimr
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
let g:rnvimr_enable_bw = 1
"let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
highlight link RnvimrNormal CursorLine
let g:rnvimr_action = {
            \ 'o':     'NvimEdit edit',
            \ '<CR>':  'NvimEdit edit',
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-h>': 'NvimEdit vsplit',
            \ '<C-j>': 'NvimEdit split',
            \ '<C-k>': 'NvimEdit split',
            \ '<C-l>': 'NvimEdit vsplit',
            \ '\gw': 'JumpNvimCwd',
            \ '\yw': 'EmitRangerCwd'
            \ }
"let g:rnvimr_ranger_views = [
            "\ {'minwidth': 90, 'ratio': []},
            "\ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            "\ {'maxwidth': 49, 'ratio': [1]}
            "\ ]
let g:rnvimr_presets = [{'width': 0.6, 'height': 0.6}]

"----------------------------------------------------------------
" floaterm
let g:floaterm_keymap_toggle = '<leader>tt'
" noremap <f9> :FloatermNew --autoclose=0 gcc % -o %< && ./%<

"----------------------------------------------------------------
" vim-rooter
"let g:rooter_targets = '*'
"let g:rooter_patterns = ['__vim_project_root', '.git/']
"let g:rooter_silent_chdir = 1

"----------------------------------------------------------------
" any-jump
let g:any_jump_disable_default_keybindings = 1
let g:any_jump_window_width_ratio  = 0.7
let g:any_jump_window_height_ratio = 0.8

"----------------------------------------------------------------
" Far.vim
let g:far#mapping = {
            \ "replace_undo" : ["l"],
            \ }

"----------------------------------------------------------------
" Undotree
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

"----------------------------------------------------------------
" vim-calc
" Testing
"if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
"   source ~/Github/vim-calc/vim-calc.vim
"endif

"----------------------------------------------------------------
" vim-focus
let g:VimFocusOpenWay = 'window'

"----------------------------------------------------------------
" vim-illuminate
" let g:Illuminate_delay = 750
" hi illuminatedWord cterm=undercurl gui=undercurl

"----------------------------------------------------------------
" Vista.vim
"noremap <leader>Vf :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }

"----------------------------------------------------------------
" coc.nvim
let g:coc_global_extensions = [
            \ 'coc-java',
            \ 'coc-actions',
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-explorer',
            \ 'coc-flutter-tools',
            \ 'coc-gitignore',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-marketplace',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-python',
            \ 'coc-snippets',
            \ 'coc-sourcekit',
            \ 'coc-stylelint',
            \ 'coc-syntax',
            \ 'coc-tasks',
            \ 'coc-todolist',
            \ 'coc-translator',
            \ 'coc-tslint-plugin',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-vetur',
            \ 'coc-yaml',
            \ 'coc-yank']
"inoremap <silent><expr> <TAB>
            "\ pumvisible() ? "\<C-n>" :
            "\ <SID>check_back_space() ? "\<TAB>" :
            "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! Show_documentation()
    call CocActionAsync('highlight')
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
let g:snips_author = 'haoran'

"----------------------------------------------------------------
" GitGutter
" let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
highlight GitGutterAdd    guifg=#98C379 ctermfg=2
highlight GitGutterChange guifg=#FF8B8B ctermfg=3
highlight GitGutterDelete guifg=#FFFF00 ctermfg=1
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_removed_above_and_below = '•'
let g:gitgutter_sign_modified_removed = '•'
set updatetime=100

"let g:gitgutter_sign_allow_clobber = 0
"let g:gitgutter_override_sign_column_highlight = 0
"let g:gitgutter_preview_win_floating = 1
"let g:gitgutter_sign_added = '▎'
"let g:gitgutter_sign_modified = '░'
"let g:gitgutter_sign_removed = '▏'
"let g:gitgutter_sign_removed_first_line = '▔'
"let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter

"----------------------------------------------------------------
" Agit
let g:agit_no_default_mappings = 1

"----------------------------------------------------------------
" AutoFormat
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']
au BufWrite *.js :Autoformat

"----------------------------------------------------------------
" OmniSharp
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
    autocmd!
    autocmd FileType cs set signcolumn=yes
    autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
    if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
    if !OmniSharp#IsServerRunning() | return | endif
    let opts = {
                \ 'CallbackCount': function('s:CBReturnCount'),
                \ 'CallbackCleanup': {-> execute('sign unplace 99')}
                \}
    call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
    if a:count
        let l = getpos('.')[1]
        let f = expand('%:p')
        execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
    endif
endfunction

"----------------------------------------------------------------
" CTRLP (Dependency for omnisharp)
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

"----------------------------------------------------------------
" org-mode
let g:org_heading_shade_leading_stars = 0

"----------------------------------------------------------------
" vim-wiki
" nnoremap < <<
let g:vimwiki_use_mouse = 0
let g:vimwiki_table_auto_fmt = 0
let g:vimwiki_stripsym = '-'
let g:vimwiki_badsyms = '-'
let wiki_1 = {}
" let wiki_1.path = '/media/haoran/Data/Book/04-蓝桥杯准备/'
let wiki_1.path = '/media/haoran/Data1/Book/04-蓝桥杯准备/'
let wiki_1.index = 'wiki-list'
let wiki_1.syntax = 'markdown'
let wiki_1.ext =  '.md'
let g:vimwiki_list = [wiki_1]
map \<CR>       <Plug>VimwikiFollowLink
map \<BS>       <Plug>VimwikiGoBackLink



"----------------------------------------------------------------
" dart-vim-plugin
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dartfmt_options = ["-l 100"]

"----------------------------------------------------------------
" AsyncTasks
let g:asyncrun_open = 6

"----------------------------------------------------------------
" AsyncRun
"noremap gp :AsyncRun git push<CR>

"----------------------------------------------------------------
" vim-calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
"augroup END

"----------------------------------------------------------------
" devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

"----------------------------------------------------------------
" rainbow
let g:rainbbw_active = 0

"----------------------------------------------------------------
" suda.vim
"cnoreabbrev sudowrite w suda://%
"cnoreabbrev sw w suda://%
"let g:suda#prompt = 'Mot de passe: '

"----------------------------------------------------------------
" dashboard-nvim
" let g:dashboard_custom_shortcut = {
"   \ 'last_session'       : 'SPC b l',
"   \ 'find_history'       : 'SPC b h',
"   \ 'find_file'          : 'SPC b f',
"   \ 'new_file'           : 'SPC b n',
"   \ 'change_colorscheme' : 'SPC b c',
"   \ 'find_word'          : 'SPC b a',
"   \ 'book_marks'         : 'SPC b b',
"   \ }
" let g:dashboard_custom_shortcut_icon['last_session'] = ' '
" let g:dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
" let g:dashboard_custom_shortcut_icon['find_file'] = ' '
" let g:dashboard_custom_shortcut_icon['new_file'] = ' '
" let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
" let g:dashboard_custom_shortcut_icon['find_word'] = ' '
" let g:dashboard_custom_shortcut_icon['book_marks'] = ' '
" let dashboard_session_directory = "~/.config/nvim/tmp/session"
" nmap <Leader>bs :<C-u>SessionSave<CR>
" nmap <Leader>bo :<C-u>SessionLoad<CR>

"----------------------------------------------------------------
" vim-bookmarks
" let g:bookmark_no_default_key_mappings = 1
" nmap mt <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mi <Plug>BookmarkNext
" nmap mn <Plug>BookmarkPrev
" nmap mC <Plug>BookmarkClear
" nmap mX <Plug>BookmarkClearAll
" nmap mu <Plug>BookmarkMoveUp
" nmap me <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1

"----------------------------------------------------------------
" Ultisnips
" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/snippet/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END

"----------------------------------------------------------------
" vimtex
" let g:vimtex_view_method = ''
" let g:vimtex_view_general_viewer = 'llpp'
" let g:vimtex_motion_enabled = 0
" let g:tex_flavor = 'latex'
" let g:vimtex_mappings_enabled = 0
" let g:vimtex_text_obj_enabled = 0
" let maplocalleader=' '

"----------------------------------------------------------------
" jsx
" let g:vim_jsx_pretty_colorful_config = 1

"----------------------------------------------------------------
" fastfold
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1

"----------------------------------------------------------------
" vim-session
"let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_command_aliases = 1
"set sessionoptions-=buffers
"set sessionoptions-=options
"noremap sl :OpenSession<CR>
"noremap sS :SaveSession<CR>
"noremap ss :SaveSession
"noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
"noremap so :OpenSession default<CR>
"noremap sD :DeleteSession<CR>
""noremap sA :AppendTabSession<CR>

"----------------------------------------------------------------
" context.vim
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>

"----------------------------------------------------------------
" vimspector
"let g:vimspector_enable_mappings = 'HUMAN'
"function! s:read_template_into_buffer(template)
"" has to be a function to avoid the extra space fzf#run insers otherwise
"execute '0r ~/.config/nvim/bin/sample_vimspector_json/'.a:template
"endfunction
"command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            "\   'source': 'ls -1 ~/.config/nvim/bin/sample_vimspector_json',
            "\   'down': 20,
            "\   'sink': function('<sid>read_template_into_buffer')
            "\ })
"" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
"sign define vimspectorBP text=☛ texthl=Normal
"sign define vimspectorBPDisabled text=☞ texthl=Normal
"sign define vimspectorPC text=🔶 texthl=SpellBad

"----------------------------------------------------------------
" reply.vim
"noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rt :ReplStop<CR>

"----------------------------------------------------------------
" typescript-vim
"let g:typescript_ignore_browserwords = 1

" ===================== End of Plugin Settings =====================
